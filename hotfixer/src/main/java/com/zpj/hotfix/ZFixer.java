package com.zpj.hotfix;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;

import com.zpj.hotfix.annotation.Fix;
import com.zpj.hotfix.patch.dex.DexInstaller;

import java.io.File;
import java.lang.reflect.Method;
import java.util.Collections;
import java.util.Enumeration;
import java.util.WeakHashMap;

import dalvik.system.DexFile;
import me.weishu.epic.art.hook.HookManager;
import me.weishu.epic.art.hook.XC_MethodHook;
import me.weishu.epic.art.utils.Reflector;

public class ZFixer {

    private static final String TAG = "ZFixer";

    private static final WeakHashMap<String, XC_MethodHook.Unhook> UNHOOK_MAP = new WeakHashMap<>();

    public static void fix(Context context, String dexPath) throws Throwable {

        File optPath = context.getDir("dex", Context.MODE_PRIVATE);
        final DexFile dexFile = DexFile.loadDex(dexPath,
                optPath.getAbsolutePath(), Context.MODE_PRIVATE);

//        loadPatch(context, dexPath);
        DexInstaller.install(context.getClassLoader(), Collections.singletonList(new File(dexPath)), optPath);

        Enumeration<String> entrys = dexFile.entries();
        Class<?> clazz = null;
        while (entrys.hasMoreElements()) {
            String entry = entrys.nextElement();
            clazz = context.getClassLoader().loadClass(entry);
            if (clazz != null) {
                fixClass(clazz, context.getClassLoader());
            }
        }
    }

    public static void unfix(String method) {
        synchronized (UNHOOK_MAP) {
            XC_MethodHook.Unhook unhook = UNHOOK_MAP.remove(method);
            if (unhook != null) {
                unhook.unhook();
            }
        }
    }

    public static void unfixAll() {
        synchronized (UNHOOK_MAP) {
            for (XC_MethodHook.Unhook unhook : UNHOOK_MAP.values()) {
                unhook.unhook();
            }
            UNHOOK_MAP.clear();
        }
    }

    private static void fixClass(Class<?> fixClazz, ClassLoader classLoader) throws ClassNotFoundException, NoSuchMethodException {
        Method[] methods = fixClazz.getDeclaredMethods();
        Fix fix;
        String clz;
        String meth;
        for (Method method : methods) {
            fix = method.getAnnotation(Fix.class);
            if (fix == null) {
                continue;
            }
            clz = fix.clazz();
            meth = fix.method();
            if (!TextUtils.isEmpty(clz) && !TextUtils.isEmpty(meth)) {
                replaceMethod(classLoader, clz, meth, fixClazz, method);
            }
        }
    }

    private static void replaceMethod(ClassLoader classLoader, final String bugClazzName,
                               String bugMethod, Class<?> fixClazz, Method fixMethod) throws ClassNotFoundException, NoSuchMethodException {
        Class<?> bugClazz = classLoader.loadClass(bugClazzName);
        XC_MethodHook callback = new XC_MethodHook() {
            @Override
            protected void beforeHookedMethod(MethodHookParam param) throws Throwable {
                try {

//                        Class<?> fixer = Class.forName("com.zpj.sdk.TestSdk$Fixer");
//                    Class<?> fixer = fixClazz;
//                    Constructor<?> constructor = fixer.getConstructor(bugClazz);
//                    constructor.setAccessible(true);
//                    Object obj = constructor.newInstance(param.thisObject);

                    Object obj = null;
                    if (param.thisObject != null) {
                        obj = FixObjectManager.get(param.thisObject, fixClazz);
                    }

                    Method method = fixClazz.getDeclaredMethod(fixMethod.getName(), fixMethod.getParameterTypes());
                    method.setAccessible(true);
                    Log.d(TAG, "fix method=" + method);
                    Object result = method.invoke(obj, param.args);
                    param.setResult(result);

//                        Log.d(TAG, "before fix method=" + fixMethod);
//                        Object result = fixMethod.invoke(param.thisObject, param.args);
//                        param.setResult(result);
                } catch (Throwable e) {
                    e.printStackTrace();
                }
            }
        };
        Method m = Reflector.findMethod(bugClazz, fixMethod.getName(), fixMethod.getParameterTypes());

        XC_MethodHook.Unhook unhook = HookManager.hookMethod(m, callback);
        synchronized (UNHOOK_MAP) {
            UNHOOK_MAP.put(bugMethod, unhook);
        }
    }

}