package com.zpj.hotfix.patch_dev.method;

import com.zpj.hotfix.utils.Reflect;

public class Test2 {

    private Object bug = new Object();

    public void test(Integer a, String b, Object c, Long d, Double e) throws Exception {
        Class[] arr1 = new Class[] { Integer.class, String.class, Object.class, Long.class, Double.class };
        Object[] arr2 = new Object[] { a, b, c, d, e };
        Reflect.invoke(bug, "test", arr1, arr2);
    }

}
