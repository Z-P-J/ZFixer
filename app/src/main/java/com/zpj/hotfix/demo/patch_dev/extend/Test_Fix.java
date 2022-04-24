package com.zpj.hotfix.demo.patch_dev.extend;

public class Test_Fix extends Base_Fix {

    protected final Test mOrigin;

    public Test_Fix(Test test) {
        super(test);
        this.mOrigin = test;
    }
}
