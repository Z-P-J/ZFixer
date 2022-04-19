package com.zpj.hotfix;

import android.content.Context;
import android.text.TextUtils;
import android.util.Log;

import com.zpj.hotfix.annotation.Fix;
import com.zpj.hotfix.utils.Reflect;

import java.io.IOException;
import java.lang.reflect.Array;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Enumeration;
import java.util.WeakHashMap;
import java.util.function.ObjDoubleConsumer;

import dalvik.system.DexClassLoader;
import dalvik.system.DexFile;
import dalvik.system.PathClassLoader;
import de.robv.android.xposed.DexposedBridge;
import de.robv.android.xposed.XC_MethodHook;
import de.robv.android.xposed.XposedHelpers;

public class ZFixer {

    private static final String TAG = "ZFixer";

    private static final WeakHashMap<String, XC_MethodHook.Unhook> UNHOOK_MAP = new WeakHashMap<>();

    public static void fix(Context context, String dexPath) throws IOException, ClassNotFoundException, NoSuchFieldException, IllegalAccessException {

        final DexFile dexFile = DexFile.loadDex(dexPath,
                context.getDir("dex", Context.MODE_PRIVATE).getAbsolutePath(), Context.MODE_PRIVATE);

        loadPatch(context, dexPath);

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

    private static void fixClass(Class<?> fixClazz, ClassLoader classLoader) throws ClassNotFoundException {
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
                               String bugMethod, Class<?> fixClazz, Method fixMethod) throws ClassNotFoundException {
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
        Method m = XposedHelpers.findMethodExact(bugClazz, fixMethod.getName(), fixMethod.getParameterTypes());

        XC_MethodHook.Unhook unhook = DexposedBridge.hookMethod(m, callback);
        synchronized (UNHOOK_MAP) {
            UNHOOK_MAP.put(bugMethod, unhook);
        }
    }

    public static void loadPatch(Context context, String dexPath) throws NoSuchFieldException, IllegalAccessException {
        ClassLoader classLoader = context.getClassLoader();

        Field pathListField = Reflect.findField(classLoader, "pathList");
        if (pathListField == null) {
            return;
        }
        Object pathList = pathListField.get(classLoader);
        Field dexElementsField = Reflect.findField(pathList, "dexElements");
        if (dexElementsField == null) {
            return;
        }

        Object[] dexElements = (Object[]) dexElementsField.get(pathList);


        DexClassLoader patchClassLoader = new DexClassLoader(dexPath, null, null, classLoader);
        Object patchPathList = pathListField.get(patchClassLoader);
        Object[] patchDexElements = (Object[]) dexElementsField.get(patchPathList);

        if (patchDexElements == null) {
            return;
        }

        int patchLength = patchDexElements.length;
        int length = dexElements.length;

        Object[] newDexElements = (Object[]) Array.newInstance(dexElements.getClass().getComponentType(), patchLength + length);



        System.arraycopy(patchDexElements, 0, newDexElements, 0, patchLength);
        System.arraycopy(dexElements, 0, newDexElements, patchLength, length);

        dexElementsField.set(pathList, newDexElements);

    }

//    private static Object[] makeDexElements(ClassLoader classLoader, ) {
//        return Reflect.invoke()
//    }

}