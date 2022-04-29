package com.zpj.hotfix.demo.patch_dev.field;

import com.zpj.hotfix.utils.Reflect;

public class T {

    private static int a;
    private static long b;


    public static int getA() throws Exception {
        return Reflect.getStaticField(T.class, "a");
    }

    public static long getB() throws Exception {
        return Reflect.getStaticField(T.class, "b");
    }

    public static int getA(T _this) throws Exception {
        return Reflect.getField(_this, "a");
    }

    public static long getB(T _this) throws Exception {
        return Reflect.getField(_this, "b");
    }


    public static void setObj(Object obj) throws Exception {
        Reflect.setStaticField(T.class, "obj", obj);
    }


    public static void setA(int a) throws Exception {
        Reflect.setStaticField(T.class, "a", a);
    }

    public static void setB(long b) throws Exception {
        Reflect.setStaticField(T.class, "b", b);
    }


    public static void setC(T _this, int b) throws Exception {
        Reflect.setField(_this, "b", b);
    }

    public static void setD(T _this, long b) throws Exception {
        Reflect.setField(_this, "b", b);
    }

}
