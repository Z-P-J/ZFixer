package com.zpj.hotfix.patch_dev.method;

import android.util.Log;

import com.zpj.hotfix.utils.Reflect;

/**
 * 静态方法
 */
public class Test4_static {

    private Object bug = new Object();

    public void test0() throws Exception {
        Reflect.invoke(bug, "test");
    }

    public static void test1() throws Exception {
        Reflect.invokeStatic(Test.class, "test");
    }

    public static void test1_1(int a) throws Exception {
        Reflect.invokeStatic(Test.class, "test");
    }

    public static void test2() throws Exception {
        Reflect.invokeStatic(Test.class, "test", new Class[] {int.class, long.class}, new Object[] {1, 1L});
    }

}
