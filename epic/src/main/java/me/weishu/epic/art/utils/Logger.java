package me.weishu.epic.art.utils;

import android.util.Log;

import me.weishu.epic.art.utils.Debug;

/**
 * Created by weishu on 17/11/10.
 */
public class Logger {

    private static final boolean DEBUG = Debug.DEBUG;

    public static final String preFix = "epic.";

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
