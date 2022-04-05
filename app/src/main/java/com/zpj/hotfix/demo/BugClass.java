package com.zpj.hotfix.demo;

import android.content.Context;
import android.util.Log;
import android.widget.Toast;

public class BugClass {

    private static final String TAG = "TestSdk";

    private final Context context;

    private final TestClass test = new TestClass();

    public BugClass(Context context) {
        this.context = context;
    }

    public void test1() {
        test.test("test1");
        testPrivateMethod();
        int a = testStaticMethod(1);
        Toast.makeText(context, "TestSdk a=" + a, Toast.LENGTH_SHORT).show();
    }

    public void test2(String text) {
        test.test("test2");
        Toast.makeText(context, text, Toast.LENGTH_SHORT).show();
    }

    public String getText() {
        return "getText";
    }

    public void callBug() {
        int a = 1 / 0;
        Log.d(TAG, "callBug a=" + a);
    }

    public int add(int a, int b) {
        return a - b;
    }

    private void testPrivateMethod() {
        Log.d(TAG, "testPrivateMethod");
    }

    private static int testStaticMethod(int a) {
        // 去掉log日志该方法将会被内联优化，epic无法hook
        Log.d(TAG, "testStaticMethod");
        return a + 1;
    }

}
