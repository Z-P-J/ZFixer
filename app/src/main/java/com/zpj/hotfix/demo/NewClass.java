package com.zpj.hotfix.demo;

import android.util.Log;

public class NewClass {

    private static final String TAG = "NewClass";

    private final BugClass bugClass;

    public NewClass(BugClass bugClass, String text) {
        this.bugClass = bugClass;
    }

    public void test() {
        Log.d(TAG, "test----->bugClass=" + bugClass);
    }

}
