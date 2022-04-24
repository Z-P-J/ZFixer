package com.zpj.hotfix.demo.patch_dev.field;

import com.zpj.hotfix.utils.Reflect;

public class Test2 {

    private final Test test;

    public Test2(Test test) {
        this.test = test;
    }



    public static Integer testGet() throws Exception {
        return Reflect.getStaticField(Test.class, "a");
    }

    public static void testSet(int value) throws Exception {
        Reflect.setStaticField(Test.class, "a", value);
    }

    public void test1() {
        int a = Test.a;

    }

    public void test2() throws Exception {
        Integer a = testGet();

    }

    public void test3() {
        Test.a = 1;

    }

    public void test4() throws Exception {
        testSet(1);
    }

    public static void test5() throws Exception {
        testSet(1);
    }

}
