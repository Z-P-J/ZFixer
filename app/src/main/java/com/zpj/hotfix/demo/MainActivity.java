package com.zpj.hotfix.demo;

import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.zpj.hotfix.ZFixer;
import com.zpj.hotfix.demo.patch_dev.extend.Base;
import com.zpj.hotfix.demo.patch_dev.extend.Test;
import com.zpj.hotfix.utils.Reflect;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.lang.reflect.Method;
import java.util.Arrays;

import me.weishu.epic.art.hook.HookManager;
import me.weishu.epic.art.hook.XC_MethodHook;

public class MainActivity extends AppCompatActivity {

    private static final String TAG = "MainActivity";

    private BugClass mSdk;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mSdk = new BugClass(getApplicationContext());

        try {
            Method method = getClass().getDeclaredMethod("test", long.class, Integer.class,
                    int.class, double.class, int.class, Object.class, int.class, int.class,
                    int.class, int.class, long.class, int.class, long.class, Long.class);
            HookManager.hookMethod(method, new XC_MethodHook() {
                @Override
                protected void beforeHookedMethod(MethodHookParam param) throws Throwable {
                    super.beforeHookedMethod(param);
                    Log.d(TAG, "beforeHookedMethod-------params=" + Arrays.toString(param.args));
                }
            });



            method = getClass().getDeclaredMethod("test", int.class, int.class);
            HookManager.hookMethod(method, new XC_MethodHook() {
                @Override
                protected void beforeHookedMethod(MethodHookParam param) throws Throwable {
                    super.beforeHookedMethod(param);
                    Log.d(TAG, "beforeHookedMethod-------params=" + Arrays.toString(param.args));
                }
            });
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        }

    }

    public int test(int a, int b) {
        int total = a + b;
        Log.d(TAG, "total=" + total);
        return total;
    }

//    public static void test(int a, Integer b, int c, double d, int e, Object f, int g, int h, int i, int j, long k, int l, long m, Long n) {
//        Log.d(TAG, "a=" + a + " f=" + f + " n=" + n);
//    }

    public void test(long a, Integer b, int c, double d, int e, Object f, int g, int h, int i, int j, long k, int l, long m, Long n) {
        long aa = a;
        Log.d(TAG, "a=" + a + " f=" + f + " n=" + n + " b=" + b + " d=" + d + " f=" + f);
        Log.d(TAG, "aa=" + aa);
    }

    public static void testStatic(long a, Integer b, int c, double d, int e, Object f, int g, int h, int i, int j, long k, int l, long m, Long n) {
        Log.d(TAG, "a=" + a + " f=" + f + " n=" + n);
    }

    public void clickLoadPatch(View view) throws ClassNotFoundException {
//        File dst = new File(getDir("cache", Context.MODE_PRIVATE), "patch.dex");
//        try {
//            copy(this, "patch.dex", dst.getAbsolutePath());
//            ZFixer.fix(getApplicationContext(), dst.getAbsolutePath());
//        } catch (Throwable e) {
//            e.printStackTrace();
//        }


//        // 测试父子类同时修改的情况
//        File dst = new File(getDir("cache", Context.MODE_PRIVATE), "test_extend.dex");
//        try {
//            copy(this, "test_extend.dex", dst.getAbsolutePath());
//            ZFixer.fix(getApplicationContext(), dst.getAbsolutePath());
//        } catch (IOException | IllegalAccessException | NoSuchFieldException e) {
//            e.printStackTrace();
//        }

//        // 测试内部类
//        File dst = new File(getDir("cache", Context.MODE_PRIVATE), "test_inner.dex");
//        try {
//            copy(this, "test_inner.dex", dst.getAbsolutePath());
//            ZFixer.fix(getApplicationContext(), dst.getAbsolutePath());
//        } catch (IOException | IllegalAccessException | NoSuchFieldException e) {
//            e.printStackTrace();
//        }

        // 测试super方法调用
        File dst = new File(getDir("cache", Context.MODE_PRIVATE), "test_super.dex");
        try {
            copy(this, "test_super.dex", dst.getAbsolutePath());
            ZFixer.fix(getApplicationContext(), dst.getAbsolutePath());
        } catch (Throwable throwable) {
            throwable.printStackTrace();
        }
    }

    public void test1(View view) {
//        mSdk.test1();
//
//        new Base().test();
//        new Test().test1();
////
//        new com.zpj.hotfix.demo.patch_dev.inner.Test().test();
//
//        com.zpj.hotfix.demo.patch_dev.super_method.Test superTest = new com.zpj.hotfix.demo.patch_dev.super_method.Test();
//        superTest.test();
//        superTest.test(100, 0, 0, 0, 0, this, 0, 0, 0, 0, 0, 0, 0, 0L);

        // 测试很多参数的方法hook
        test(100L, 100, 100, 100, 0, this, 0, 0, 0, 0, 0, 0, 0, 0L);

        int num = test(3, 2);
    }

    public void test2(View view) {
        mSdk.test2("this is test2!");
    }

    public void test3(View view) {
        String text = mSdk.getText();
        int num = mSdk.add(100, 50);
        Toast.makeText(this, "text=" + text + "   100+50= " + num, Toast.LENGTH_SHORT).show();
    }

    public void fixPrivateMethod(View view) {
        try {
            Reflect.invoke(mSdk, "testPrivateMethod");
        } catch (Exception e) {
            e.printStackTrace();
        }
        Toast.makeText(this, "通过日志查看testPrivateMethod是否修复成功", Toast.LENGTH_SHORT).show();

    }

    public void fixStaticMethod(View view) {
        try {
            // 测试静态方法是否修复成功
            int a = Reflect.invoke(mSdk, "testStaticMethod", new Class[]{int.class}, new Object[]{100});
            Toast.makeText(this, "testStaticMethod a=" + a, Toast.LENGTH_SHORT).show();

            ZFixer.unfix("testStaticMethod");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void callBug(View view) {
        mSdk.callBug();
    }

    public void removeHooks(View view) {
        ZFixer.unfixAll();
    }


    public static void copy(Context context, String assetName, String dstPath) throws IOException {

        File dst = new File(dstPath);

        if (!dst.getParentFile().exists()) {
            dst.getParentFile().mkdirs();
        }

        try (InputStream in = context.getAssets().open(assetName)) {
            try (OutputStream out = new FileOutputStream(dst)) {
                byte[] buf = new byte[1024];
                int len;
                while ((len = in.read(buf)) > 0) {
                    out.write(buf, 0, len);
                }
            }
        }
    }

}