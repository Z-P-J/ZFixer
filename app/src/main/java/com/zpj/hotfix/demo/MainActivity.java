package com.zpj.hotfix.demo;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import com.zpj.hotfix.ZFixer;
import com.zpj.hotfix.patch_dev.extend.Base;
import com.zpj.hotfix.patch_dev.extend.Test;
import com.zpj.hotfix.utils.Reflect;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class MainActivity extends AppCompatActivity {

    private BugClass mSdk;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        mSdk = new BugClass(getApplicationContext());
    }

    public void clickLoadPatch(View view) throws ClassNotFoundException {
//        File dst = new File(getDir("cache", Context.MODE_PRIVATE), "patch.dex");
//        try {
//            copy(this, "patch.dex", dst.getAbsolutePath());
//            ZFixer.fix(getApplicationContext(), dst.getAbsolutePath());
//        } catch (IOException | IllegalAccessException | NoSuchFieldException e) {
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

        // 测试内部类
        File dst = new File(getDir("cache", Context.MODE_PRIVATE), "test_inner.dex");
        try {
            copy(this, "test_inner.dex", dst.getAbsolutePath());
            ZFixer.fix(getApplicationContext(), dst.getAbsolutePath());
        } catch (IOException | IllegalAccessException | NoSuchFieldException e) {
            e.printStackTrace();
        }
    }

    public void test1(View view) {
        mSdk.test1();

        new Base().test();
        new Test().test1();
//
        new com.zpj.hotfix.patch_dev.inner.Test().test();
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