package com.zpj.hotfix.utils;

import android.util.Log;

import me.weishu.epic.BuildConfig;

public class Logger {

    private static final boolean DEBUG = BuildConfig.DEBUG;

    public static final String preFix = "ZFixer.";

    public static void i(String tag, String msg) {
        if (DEBUG) {
            Log.i(preFix + tag, msg);
        }
    }

    public static void d(String tagSuffix, String msg) {
        if (DEBUG) {
            Log.d(preFix + tagSuffix, msg);
        }
    }

    public static void w(String tag, String msg) {
        Log.w(preFix + tag, msg);
    }

    public static void e(String tag, String msg) {
        if (DEBUG) {
            Log.e(preFix + tag, msg);
        }
    }

    public static void e(String tag, String msg, Throwable e) {
        if (DEBUG) {
            Log.e(preFix + tag, msg, e);
        }
    }

    public synchronized static void logThrowable(Throwable t) {
        i(preFix + "Throwable", Log.getStackTraceString(t));
    }

}
