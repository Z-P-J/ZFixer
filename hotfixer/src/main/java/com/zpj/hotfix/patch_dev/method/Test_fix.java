package com.zpj.hotfix.patch_dev.method;

import com.zpj.hotfix.utils.Reflect;

public class Test_fix {

    private final Test_bug bug;

    public Test_fix(Test_bug bug) throws Exception {
        this.bug = bug;
    }

    public void test1() throws Exception {
        Reflect.invoke(bug, "test");
    }

    public Object test1_1() throws Exception {
        return Reflect.invoke(bug, "test");
    }

    private void test2(String text) throws Exception {
        Reflect.invoke(bug, "test", new Class[]{ String.class }, new Object[] { text });
    }

    public void test3(int num) throws Exception {
        Reflect.invoke(bug, "test", new Class[]{ int.class }, new Object[] { num });
    }

    public void test4(Double value) throws Exception {
        Reflect.invoke(bug, "test", new Class[]{ Double.class }, new Object[] { value});
    }

    public String test5(String text, int num, Double value) throws Exception {
        return Reflect.invoke(bug, "test", new Class[]{ String.class, int.class, Double.class }, new Object[] { text, num, value});
    }

    public Object test6(int num, Double value) throws Exception {
        return Reflect.invoke(bug, "test", new Class[]{ int.class, Double.class }, new Object[] { num, value});
    }

    public String text7(int a) throws Exception {
        return Reflect.invoke(bug, "text", new Class[]{ int.class }, new Object[] { a });
    }

    public <T> T text8(int a) throws Exception {
        return Reflect.invoke(bug, "text", new Class[]{ int.class }, new Object[] { a });
    }

}
