package com.zpj.hotfix.demo;

import android.content.Context;
import android.util.Log;
import android.widget.Toast;

import com.zpj.hotfix.annotation.Fix;
import com.zpj.hotfix.utils.Reflect;

@com.zpj.hotfix.annotation.FixClass(name = "com.zpj.hotfix.demo.BugClass")
public class FixClass {

    private final BugClass bugClass;

    public FixClass(BugClass bugClass) {
        this.bugClass = bugClass;
    }

    @Fix(clazz = "com.zpj.hotfix.demo.BugClass", method = "test1")
    public void test1() throws Exception {
        getTest().test("test1");
        testPrivateMethod();
        int a = testStaticMethod(1);
        Toast.makeText(getContext().getApplicationContext(), "TestSdk a=" + a, Toast.LENGTH_SHORT).show();
    }

    @Fix(clazz = "com.zpj.hotfix.demo.BugClass", method = "gettest2Text")
    public void test2(String text) throws Exception {
        getTest().test("test2");
        Toast.makeText(getContext().getApplicationContext(), "fix --------- " + text, Toast.LENGTH_SHORT).show();
    }

    @Fix(clazz = "com.zpj.hotfix.demo.BugClass", method = "getText")
    public String getText() {

        new NewClass(bugClass, "text").test();
        return "getText11111111111111" + bugClass;
    }

    public String getText2() {
        BugClass self = bugClass;
        new NewClass(self, "text").test();
        return "getText11111111111111" + self;
    }

//    private BugClass getBugClass() {
//        return ;
//    }

    @Fix(clazz = "com.zpj.hotfix.demo.BugClass", method = "callBug")
    public void callBug() {
        try {
            int a = 1 / 0;
            Log.d(getTag(), "callBug a=" + a);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Fix(clazz = "com.zpj.hotfix.demo.BugClass", method = "add")
    public int add(int a, int b) {
        return a + b;
    }

    @Fix(clazz = "com.zpj.hotfix.demo.BugClass", method = "testPrivateMethod")
    private void testPrivateMethod() throws Exception {
        Log.d(getTag(), "fix testPrivateMethod");
    }

    @Fix(clazz = "com.zpj.hotfix.demo.BugClass", method = "testStaticMethod")
    private static int testStaticMethod(int a) throws Exception {
        Log.d(getTag(), "fix testStaticMethod");
        return a + 1000;
    }





    private TestClass getTest() throws Exception {
        return Reflect.getField(bugClass, "test");
    }

    private Context getContext() throws Exception {
        return Reflect.getField(bugClass, "context");
    }

    private static String getTag() throws Exception {
        return Reflect.getStaticField(BugClass.class,  "TAG");
    }

}
