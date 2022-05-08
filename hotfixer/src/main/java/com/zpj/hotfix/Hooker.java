package com.zpj.hotfix;

import java.lang.reflect.Method;

import me.weishu.epic.art.hook.XC_MethodHook;

public interface Hooker {

    void hook(Method method, XC_MethodHook hook);

}
