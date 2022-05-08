package com.zpj.hotfix;

import android.content.Context;

import com.zpj.hotfix.patch.dex.DexPatchInstaller;

import java.io.File;
import java.util.concurrent.atomic.AtomicBoolean;

import me.weishu.epic.art.hook.HookManager;
import me.weishu.reflection.Reflection;

public class ZFixer {

    private static final String TAG = "ZFixer";



    private final AtomicBoolean mInit = new AtomicBoolean(false);

    private static final class Holder {
        private static final ZFixer FIXER = new ZFixer();
    }

    public static ZFixer getInstance() {
        return Holder.FIXER;
    }

    public void init(Patcher patcher) {
        if (mInit.compareAndSet(false, true)) {
            Reflection.unseal(patcher.getApplication());
        }
    }

    public static void fix(Context context, String dexPath) throws Throwable {
        new DexPatchInstaller(context).install(new File(dexPath));
    }

    public static void unfix(String method) {
        HookManager.unfix(method);
    }

    public static void unfixAll() {
        HookManager.unfixAll();
    }

}