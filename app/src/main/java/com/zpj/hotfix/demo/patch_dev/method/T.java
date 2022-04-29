package com.zpj.hotfix.demo.patch_dev.method;

import com.zpj.hotfix.utils.Reflect;

public class T {

    private static void test(T _this) throws Exception {
        Reflect.invoke(_this, "test");
    }

    private static void test(T _this, int i, long l, short s, boolean b, double d, float f, byte by, String string) throws Exception {
//        Object[] objects = new Object[] { i, l, s, b, d, f, by, string, o};
        Class<?>[] arr1 = new Class<?>[] {int.class, long.class, short.class, double.class, float.class, byte.class, String.class};
        Object[] arr2 = new Object[] { i, l, s, b, d, f, by, string};
        Reflect.invoke(_this, "test", arr1, arr2);
    }

    private static void testStatic(int i, long l, short s, boolean b, double d, float f, byte by, String string) throws Exception {
//        Object[] objects = new Object[] { i, l, s, b, d, f, by, string, o};
        Class<?>[] arr1 = new Class<?>[] {int.class, long.class, short.class, double.class, float.class, byte.class, String.class};
        Object[] arr2 = new Object[] { i, l, s, b, d, f, by, string};
        Reflect.invokeStatic(T.class, "test", arr1, arr2);
    }


//    private void test2(int i, int a, int b, int c) throws Exception {
////        Object[] objects = new Object[] { i, l, s, b, d, f, by, string, o};
//        Reflect.invoke(this, "test", new Class[] {
//                int.class, int.class, int.class, int.class
//        }, new Object[] { i, a, b, c});
//    }

}
