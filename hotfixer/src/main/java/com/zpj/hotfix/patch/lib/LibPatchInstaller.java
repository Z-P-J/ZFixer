package com.zpj.hotfix.patch.lib;

import android.content.Context;

import com.zpj.hotfix.model.Result;
import com.zpj.hotfix.patch.PatchInstaller;

import java.io.File;

public class LibPatchInstaller extends PatchInstaller {
    public LibPatchInstaller(Context context) {
        super(context);
    }

    @Override
    public Result install(File file) throws Throwable {
        return null;
    }
}
