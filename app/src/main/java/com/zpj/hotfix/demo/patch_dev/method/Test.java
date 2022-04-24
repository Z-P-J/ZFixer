package com.zpj.hotfix.demo.patch_dev.method;

import com.zpj.hotfix.utils.Reflect;

public class Test {

    private final Test_bug bug = new Test_bug(null);

    private void test0() throws Exception {
        Reflect.invoke(bug, "test");
    }

    private int test1() throws Exception {
        return Reflect.invoke(bug, "test");
    }

    private Object test1_1() throws Exception {
        return Reflect.invoke(bug, "test");
    }

    private String test1_2() throws Exception {
        return Reflect.invoke(bug, "test");
    }

    private void test2(String arg0) throws Exception {
        Reflect.invoke(bug, "test", new Class[]{ String.class }, new Object[] { arg0 });
    }

    private Double test3(String arg0) throws Exception {
        return Reflect.invoke(bug, "test", new Class[]{ String.class }, new Object[] { arg0 });
    }


    public void test4(int arg0, Double arg1) throws Exception {
        Reflect.invoke(bug, "test", new Class[]{ int.class, Double.class }, new Object[] { arg0, arg1 });
    }

    public Object test5(int arg0, Double arg1) throws Exception {
        return Reflect.invoke(bug, "test", new Class[]{ int.class, Double.class }, new Object[] { arg0, arg1 });
    }


    public void test6(String arg0, int arg1, Double arg2) throws Exception {
        Reflect.invoke(bug, "test", new Class[]{ String.class, int.class, Double.class }, new Object[] { arg0, arg1, arg2 });
    }

    public String test7(String arg0, int arg1, Double arg2) throws Exception {
        return Reflect.invoke(bug, "test", new Class[]{ String.class, int.class, Double.class }, new Object[] { arg0, arg1, arg2 });
    }

    public void test8(String arg0, int arg1, Double arg2, Test_fix arg3) throws Exception {
        Reflect.invoke(bug, "test",
                new Class[]{ String.class, int.class, Double.class, Test_fix.class },
                new Object[] { arg0, arg1, arg2, arg3 });
    }

    public Test_bug test9(String arg0, int arg1, Double arg2, Test_fix arg3) throws Exception {
        return Reflect.invoke(bug, "test",
                new Class[]{ String.class, int.class, Double.class, Test_fix.class },
                new Object[] { arg0, arg1, arg2, arg3 });
    }

    public void test10(String arg0, int arg1, String ...arg3) throws Exception {
        Reflect.invoke(bug, "test",
                new Class[]{ String.class, int.class, String[].class },
                new Object[] { arg0, arg1, arg3 });
    }

    public Test_bug test11(String arg0, int arg1, String ...arg3) throws Exception {
        return Reflect.invoke(bug, "test",
                new Class[]{ String.class, int.class, String[].class },
                new Object[] { arg0, arg1, arg3 });
    }


    public void test12(String arg0, int arg1) throws Exception {
        Reflect.invoke(bug, "test",
                new Class[]{ String.class, int.class },
                new Object[] { arg0, arg1 });
    }

    public void test13(String arg0, int arg1, String arg3) throws Exception {
        Reflect.invoke(bug, "test",
                new Class[]{ String.class, int.class, String.class },
                new Object[] { arg0, arg1, arg3 });
    }

    public void test14(String arg0) throws Exception {
        Reflect.invoke(bug, "test",
                new Class[]{ String.class },
                new Object[] { arg0 });
    }

}
