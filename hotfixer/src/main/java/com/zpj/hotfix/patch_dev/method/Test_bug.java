package com.zpj.hotfix.patch_dev.method;

import android.content.Context;

public class Test_bug {

    private static final String TAG = "Test_bug";

    private final Context context;

    private final Test test = new Test();

    public Test_bug(Context context) {
        this.context = context;
    }

    public void test() {

    }

    private void test(String text) {

    }

    public void test(int num) {

    }

    public void test(Double value) {

    }

    public void test(String text, int num, Double value) {

    }

    public Object test(int num, Double value) {
        return null;
    }

    public String text(int a) {
        return "text" + a;
    }

}
