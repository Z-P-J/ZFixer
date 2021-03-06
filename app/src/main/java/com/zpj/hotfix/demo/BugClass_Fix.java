//package com.zpj.hotfix.demo;
//
//import android.content.Context;
//import android.util.Log;
//import android.widget.Toast;
//
//public class BugClass_Fix {
//
//    private static final String TAG = "TestSdk";
//
//    private final Context context;
//
//    private final TestClass test = new TestClass();
//
//    public BugClass_Fix(Context context) {
//        this.context = context;
//    }
//
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
//        new NewClass(this).test();
//        return "fix--------------getText";
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
//    }
//
//    private static int testStaticMethod(int a) {
//        // 去掉log日志该方法将会被内联优化，epic无法hook
//        Log.d(TAG, "fix testStaticMethod");
//        return a + 1000;
//    }
//
//}
