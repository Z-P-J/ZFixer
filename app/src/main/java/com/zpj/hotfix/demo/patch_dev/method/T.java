package com.zpj.hotfix.demo.patch_dev.method;

import com.zpj.hotfix.utils.Reflect;

public class T {


    private void test(int i, long l, short s, boolean b, double d, float f, byte by, String string) throws Exception {
//        Object[] objects = new Object[] { i, l, s, b, d, f, by, string, o};
        Reflect.invoke(this, "test", new Class[] {
                int.class, long.class, short.class, double.class, float.class, byte.class, String.class
        }, new Object[] { i, l, s, b, d, f, by, string});
    }


    private void test2(int i, int a, int b, int c) throws Exception {
//        Object[] objects = new Object[] { i, l, s, b, d, f, by, string, o};
        Reflect.invoke(this, "test", new Class[] {
                int.class, int.class, int.class, int.class
        }, new Object[] { i, a, b, c});
    }

}
