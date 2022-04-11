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
        this.test.test("test1");
        testPrivateMethod();
        int a = testStaticMethod(1);
        Context context2 = this.context;
        Toast.makeText(context2, "TestSdk a=" + a, Toast.LENGTH_SHORT).show();
    }

    public void test2(String text) {
        this.test.test("test2");
        Toast.makeText(this.context, text, Toast.LENGTH_SHORT).show();
    }

    public String getText() {
        return "getText";
    }

    public void callBug() {
        int a = (1 / 0);
        Log.d(TAG, "callBug a=" + a);
    }

    public int add(int a, int b) {
        Log.d(TAG, "testAdd");
        return a - b;
    }

    private void testPrivateMethod() {
        Log.d(TAG, "testPrivateMethod");
    }

    private static int testStaticMethod(int a) {
        Log.d(TAG, "testStaticMethod");
        return a + 1;
    }







//    public void test1() {
//        test.test("fix test1");
//        testPrivateMethod();
//        int a = testStaticMethod(1);
//        Toast.makeText(context.getApplicationContext(), "fix TestSdk a=" + a, Toast.LENGTH_SHORT).show();
//    }
//
//    public void test2(String text) {
//        test.test("fix test2");
//        Toast.makeText(context.getApplicationContext(), text, Toast.LENGTH_SHORT).show();
//    }
//
//    public String getText() {
//        new NewClass(this, "text").test();
//        return "fix--------------getText" + this;
//    }
//
//    public String getText2() {
//        BugClass self = self();
//        new NewClass(self, "text").test();
//        return "fix--------------getText" + self;
//    }
//
//    private BugClass self() {
//        return this;
//    }
//
//    public void callBug() {
//        try {
//            int a = 1 / 0;
//            Log.d(TAG, "callBug a=" + a);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//
//    public int add(int a, int b) {
//        // 去掉日志该方法会被内联优化
//        Log.d(TAG, "fix testAdd");
//        return (a + b);
//    }
//
//    private void testPrivateMethod() {
//        Log.d(TAG, "fix testPrivateMethod");
//        test(0, 0, 0, 0,0 , 0, this);
//    }
//
//    private static int testStaticMethod(int a) {
//        // 去掉log日志该方法将会被内联优化，epic无法hook
//        Log.d(TAG, "fix testStaticMethod");
//        return a + 1000;
//    }
//
//    public void test(int a, int b, int c, int d, int e, int f, BugClass g) {
//        testNewStaticMethod(this, b, c, d, e, f, g);
//    }
//
//    public static void testNewStaticMethod(BugClass a, int b, int c, int d, int e, int f, BugClass g) {
//        Log.d(TAG, "testNewStaticMethod");
//    }

}
