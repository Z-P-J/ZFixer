package com.zpj.hotfix.model;

public class PatchInfo {

    private final String patchName;
    private final String patchMd5;
    private final int patchVersion;
    private final String patchPath;

    public PatchInfo(String patchName, String patchMd5, int patchVersion, String patchPath) {
        this.patchName = patchName;
        this.patchMd5 = patchMd5;
        this.patchVersion = patchVersion;
        this.patchPath = patchPath;
    }

    public String getPatchName() {
        return patchName;
    }

    public String getPatchMd5() {
        return patchMd5;
    }

    public int getPatchVersion() {
        return patchVersion;
    }

    public String getPatchPath() {
        return patchPath;
    }

}
