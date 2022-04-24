package com.zpj.hotfix.demo.patch_dev.super_method;

import android.util.Log;

public class Base {

    private static final String TAG = "Base";

    protected final Object obj = new Object();

    public void test() {
        Log.d(TAG, "this is Base!");
    }

//    public void test(int a, Integer b, int c, double d, int e, Object f, int g, int h, int i, int j, long k, int l, long m, Long n) {
//        Log.d(TAG, "a=" + a + " f=" + f + " n=" + n);
//        Log.d("hhhhhhhhhhhhhh", TAG);
//    }

    public void test(int a, Integer b, int c, double d, int e, Object f, int g, int h, int i, int j, long k, int l, long m, Long n) {
        Log.d(TAG, "a=" + a + " f=" + f + " n=" + n);
    }

}
