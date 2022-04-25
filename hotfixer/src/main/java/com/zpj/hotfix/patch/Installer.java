package com.zpj.hotfix.patch;

import com.zpj.hotfix.model.Result;

import java.io.File;
import java.io.IOException;

public interface Installer {

    Result install(File file) throws Throwable;

}
