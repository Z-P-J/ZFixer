/*
 * Copyright (c) 2017, weishu twsxtd@gmail.com
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package me.weishu.epic.art;

import android.app.Application;
import android.util.Log;

import me.weishu.epic.art.utils.Debug;
import me.weishu.epic.art.utils.Logger;
import me.weishu.epic.art.utils.Reflector;
import me.weishu.epic.art.utils.Unsafe;
import me.weishu.reflection.Reflection;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Member;

import static me.weishu.epic.art.utils.Debug.addrHex;


public final class EpicNative {

    private static final String TAG = "EpicNative";
    private static volatile boolean useUnsafe = false;
    static {
        try {
            System.loadLibrary("epic");
            // TODO 在application中初始化时调用
            Reflection.unseal(getApplication());
            useUnsafe = !isGetObjectAvailable();
            Log.i(TAG, "use unsafe ? " + useUnsafe);
        } catch (Throwable e) {
            Log.e(TAG, "init EpicNative error", e);
        }
    }

    // TODO 在application中初始化时调用
    private static Application getApplication() throws InvocationTargetException, NoSuchMethodException, ClassNotFoundException, IllegalAccessException {
        Application app = null;
        try {
            app = (Application) Class.forName("android.app.ActivityThread").getMethod("currentApplication").invoke(null);
            if (app == null)
                throw new IllegalStateException("Static initialization of Applications must be on main thread.");
        } catch (final Exception e) {
            try {
                app = (Application) Class.forName("android.app.AppGlobals").getMethod("getInitialApplication").invoke(null);
            } catch (final Exception ex) {
                throw ex;
            }
        }
        return app;
    }

    public static native long mmap(int length);

    public static native boolean munmap(long address, int length);

    public static native void memcpy(long src, long dest, int length);

    public static native void memput(byte[] bytes, long dest);

    public static native byte[] memget(long src, int length);

    public static native boolean munprotect(long addr, long len);

    public static native long getMethodAddress(Member method);

    public static native void MakeInitializedClassVisibilyInitialized(long self);

    public static native boolean cacheflush(long addr, long len);

    public static native long malloc(int sizeOfPtr);

    public static native Object getObjectNative(long self, long address);

    private static native boolean isGetObjectAvailable();

    public static Object getObject(long self, long address) {
        if (useUnsafe) {
            return Unsafe.getObject(address);
        } else {
            return getObjectNative(self, address);
        }
    }

    public static native boolean compileMethod(Member method, long self);

    /**
     * suspend all running thread momently
     * @return a handle to resume all thread, used by {@link #resumeAll(long)}
     */
    public static native long suspendAll();

    /**
     * resume all thread which are suspend by {@link #suspendAll()}
     * only work abobe Android N
     * @param cookie the cookie return by {@link #suspendAll()}
     */
    public static native void resumeAll(long cookie);

    /**
     * stop jit compiler in runtime.
     * Warning: Just for experiment Do not call this now!!!
     * @return cookie use by {@link #startJit(long)}
     */
    public static native long stopJit();

    /**
     * start jit compiler stop by {@link #stopJit()}
     * Warning: Just for experiment Do not call this now!!!
     * @param cookie the cookie return by {@link #stopJit()}
     */
    public static native void startJit(long cookie);

    // FIXME: 17/12/29 reimplement it with pure native code.
    static native boolean activateNative(long jumpToAddress, long pc, long sizeOfTargetJump, long sizeOfBridgeJump, byte[] code);

    /**
     * Disable the moving gc of runtime.
     * Warning: Just for experiment Do not call this now!!!
     * @param api the api level
     */
    public static native void disableMovingGc(int api);

    public static native Object invokeSuperObject(Object object, String name, String sig, Object...args);

    public static native void invokeSuperVoid(Object object, String name, String sig, Object...args);

    public static native int invokeSuperInt(Object object, String name, String sig, Object...args);

    public static native long invokeSuperLong(Object object, String name, String sig, Object...args);

    public static native double invokeSuperDouble(Object object, String name, String sig, Object...args);

    public static native float invokeSuperFloat(Object object, String name, String sig, Object...args);

    public static native boolean invokeSuperBoolean(Object object, String name, String sig, Object...args);

    public static native char invokeSuperChar(Object object, String name, String sig, Object...args);

    public static native byte invokeSuperByte(Object object, String name, String sig, Object...args);

    public static native short invokeSuperShort(Object object, String name, String sig, Object...args);


    private EpicNative() {
    }

    public static long getNativePeer() {
        try {
            return Reflector.getField(Thread.currentThread(), "nativePeer");
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean compileMethod(Member method) {
        return compileMethod(method, getNativePeer());
    }

    public static Object getObject(long address) {
        return getObject(getNativePeer(), address);
    }

    public static void MakeInitializedClassVisibilyInitialized() {
        MakeInitializedClassVisibilyInitialized(getNativePeer());
    }

    public static long map(int length) {
        long m = mmap(length);
        Logger.i(TAG, "Mapped memory of size " + length + " at " + addrHex(m));
        return m;
    }

    public static boolean unmap(long address, int length) {
        Logger.d(TAG, "Removing mapped memory of size " + length + " at " + addrHex(address));
        return munmap(address, length);
    }

    public static void put(byte[] bytes, long dest) {
        if (Debug.DEBUG) {
            Logger.d(TAG, "Writing memory to: " + addrHex(dest));
            Logger.d(TAG, Debug.hexdump(bytes, dest));
        }
        memput(bytes, dest);
    }

    public static byte[] get(long src, int length) {
        Logger.d(TAG, "Reading " + length + " bytes from: " + addrHex(src));
        byte[] bytes = memget(src, length);
        Logger.d(TAG, Debug.hexdump(bytes, src));
        return bytes;
    }

    public static boolean unprotect(long addr, long len) {
        Logger.d(TAG, "Disabling mprotect from " + addrHex(addr));
        return munprotect(addr, len);
    }

    public static void copy(long src, long dst, int length) {
        Logger.d(TAG, "Copy " + length + " bytes form " + addrHex(src) + " to " + addrHex(dst));
        memcpy(src, dst, length);
    }

}



