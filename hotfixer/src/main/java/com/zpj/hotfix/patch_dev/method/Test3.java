package com.zpj.hotfix.patch_dev.method;

import android.util.Log;

import com.zpj.hotfix.utils.Reflect;

public class Test3 {

    private Object bug = new Object();

    public void test(Integer a, String b, Object c, Long d, Double e, int f, long g, int h, int i) throws Exception {
        Class[] arr1 = new Class[] { Integer.class, String.class, Object.class, Long.class, Double.class, int.class, int.class, int.class, int.class };
        Object[] arr2 = new Object[] { a, b, c, d, e, f, g, h, i };
        Reflect.invoke(bug, "test", arr1, arr2);

        int l = 15;
        Log.d("tag", "l=" + l);

    }

}
