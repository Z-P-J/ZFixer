package com.zpj.hotfix.patch_dev.method;

import com.zpj.hotfix.utils.Reflect;

public class Test1 {

    private Object bug = new Object();

    public void test(int a, String b, Object c, long d, Double e) throws Exception {
        Class[] arr1 = new Class[] { int.class, String.class, Object.class, long.class, Double.class };
        Object[] arr2 = new Object[] { a, b, c, d, e };
        Reflect.invoke(bug, "test", arr1, arr2);
    }

}
