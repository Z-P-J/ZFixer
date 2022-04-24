package com.zpj.hotfix.patch;

import com.zpj.hotfix.model.Result;

import java.io.File;

public interface Installer {

    Result install(File file);

}
