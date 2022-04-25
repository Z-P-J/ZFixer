package com.zpj.hotfix.patch;

import android.content.Context;

import com.zpj.hotfix.model.Result;

import java.io.File;

public abstract class PatchInstaller implements Installer {

    protected final Context mContext;

    public PatchInstaller(Context context) {
        this.mContext = context;
    }

}
