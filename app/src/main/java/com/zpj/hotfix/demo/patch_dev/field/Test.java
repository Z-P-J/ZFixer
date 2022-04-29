package com.zpj.hotfix.demo.patch_dev.field;

import com.zpj.hotfix.utils.Reflect;

public class Test {

    public static int a;

    private int b;

    public void test() {
        int num = b;
        this.b = 100;
    }

    public static void test1(Test _this) throws Exception {
        int num = getB(_this);
        setB(_this, 100);
    }

//    public static void test2(Test _this) throws Exception {
//        setB(_this, 100);
//    }

    private static int getB(Test test) throws Exception {
        return Reflect.getField(test, "b");
    }

    private static long getC(Test test) throws Exception {
        return Reflect.getField(test, "b");
    }

    private static int getD() throws Exception {
        return Reflect.getStaticField(Test.class, "b");
    }

    private static long getE() throws Exception {
        return Reflect.getStaticField(Test.class, "b");
    }

    private static void setB(Test test, int b) throws Exception {
        Reflect.setField(test, "b", b);
    }

}
