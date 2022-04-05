package com.zpj.hotfix.patch_dev.field;

import android.content.Context;
import android.util.Log;
import android.widget.Toast;

import com.zpj.hotfix.patch_dev.method.Test;

public class Test_bug {

    private static final String TAG = "Test_bug";

    private final Context context;

    private Test test = new Test();

    private int a;
    private long l;

    private String text = "123";


    public Test_bug(Context context) {
        this.context = context;
    }

    public void test() {
        Toast.makeText(context, "test", Toast.LENGTH_SHORT).show();
    }

    public void test1() throws Exception {
        test.test4(0, 100d);
    }

    public void test2() throws Exception {
        test.test4(a + 1000, 22222d);

//        a++;
//
//        ++a;

        Log.d(TAG, "a=" + a);
    }

    public void test3() throws Exception {
        a++;

        Log.d(TAG, "a1=" + a);

        ++a;

        Log.d(TAG, "a2=" + a);
    }

    public void test4() throws Exception {
        text = "fix 123";

        Log.d(TAG, "text=" + text);

        test = new Test();
        test.test4(0, 100d);
    }

    public void test5() throws Exception {
        a++;
        l++;
    }

    public void test6() throws Exception {
        ++a;
        ++l;
    }

    public void test7() throws Exception {
        a = a + 1;
        l = l + 1L;
    }

    public void test8() throws Exception {
        int b = 100 + a++;
    }


}
