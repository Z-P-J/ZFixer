package com.zpj.hotfix.demo.patch_dev.super_method;

import android.util.Log;

public class Test extends Base {

    private static final String TAG = "Test";

//    public void test() {
//        Log.d(TAG, "test fixed!");
//        super.test();
//    }
//
//    @Override
//    public void test(int a, Integer b, int c, double d, int e, Object f, int g, int h, int i, int j, long k, int l, long m, Long n) {
//        Object o = obj;
//        super.test(0, b, c, d, e, null, g, h, i, j, k, l, m, 100L);
//    }

    public void test() {
        Object o = obj;
        super.test();
        Log.d(TAG, "this is Test!");
    }

    @Override
    public void test(int a, Integer b, int c, double d, int e, Object f, int g, int h, int i, int j, long k, int l, long m, Long n) {
        Log.d(TAG, "fix meeeeeeeeeee!");
        super.test(a, b, c, d, e, f, g, h, i, j, k, l, m, n);
    }

    //    public void test2() throws Throwable {
//        _super_test();
//        Log.d(TAG, "this is Test!");
//    }

//    private Object mOrigin;
//    private void _super_test() throws Throwable {
//        Object[] arr = {};
//        Reflect.invokeSuperVoid(mOrigin, "name", "sig", arr);
//    }
//
//    private void _super_test(int a, Integer b, int c, int d, int e, Object f, int g, int h, int i, int j, long k, int l) throws Throwable {
//        Object o = obj;
//        Object[] arr = {a, b, c, d, e, f, g, h, i, j, k, l};
//        Reflect.invokeSuperVoid(o, "name", "sig", arr);
//    }

}
