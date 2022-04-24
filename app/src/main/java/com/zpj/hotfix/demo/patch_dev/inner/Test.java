package com.zpj.hotfix.demo.patch_dev.inner;

import android.util.Log;

public class Test {

//    public class Test_Fix {
//
//    }

    public void test() {
        new Thread(new Runnable() {
            @Override
            public void run() {
//                Log.d("Test", "test=" + Test.this.getClass());
                Log.d("Test", "fix me!!!!!!");
            }
        }).start();
    }

}
