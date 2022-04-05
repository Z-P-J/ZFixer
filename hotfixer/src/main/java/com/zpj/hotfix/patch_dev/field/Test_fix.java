package com.zpj.hotfix.patch_dev.field;

import android.content.Context;
import android.util.Log;
import android.widget.Toast;

import com.zpj.hotfix.patch_dev.method.Test;
import com.zpj.hotfix.utils.Reflect;

public class Test_fix {

    private final Test_bug bug;

    public Test_fix(Test_bug bug) {
        this.bug = bug;
    }

    public void test() throws Exception {
        Toast.makeText(getContext(), "test", Toast.LENGTH_SHORT).show();
    }

    public void test1() throws Exception {
        getTest().test4(0, 100d);
    }

    public void test2() throws Exception {
        getTest().test4(getA() + 1000, 22222d);

        Log.d(getTag(), "a=" + getA());
    }

//    public void test3() throws Exception {
//        a++;
//
//        Log.d("Test_bug", "a=" + getA());
//
//        ++a;
//
//        Log.d("Test_bug", "a=" + getA());
//    }

    public void test4() throws Exception {
        setText("fix 123");

        Log.d("Test_bug", "text=" + getText());

        setTest(new Test());
        getTest().test4(0, 100d);
    }







    private Context getContext() throws Exception {
        return Reflect.getField(bug, "context");
    }

    private Test getTest() throws Exception {
        return Reflect.getField(bug, "test");
    }

    private int getA() throws Exception {
        return Reflect.getField(bug, "a");
    }

    private Object getObject() throws Exception {
        return Reflect.getField(bug, "a");
    }

    // 静态属性访问
    private static String getTag() throws Exception {
        return Reflect.getStaticField(Test_bug.class, "TAG");
    }


    private String getText() throws Exception {
        return Reflect.getField(bug, "text");
    }

    private void setText(String value) throws Exception {
        Reflect.setField(bug, "text", value);
    }

    private void setTest(Test test) throws Exception {
        Reflect.setField(bug, "test", test);
    }


}
