package com.zpj.hotfix.patch.dex;

import android.os.Build;
import android.util.Log;

import com.zpj.hotfix.utils.Reflect;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;

public class DexInstaller {

    private static final String TAG = "DexInstaller";

    public static void install(ClassLoader cl, List<File> dexFiles, File optimizeDir) throws Throwable {
        if (Build.VERSION.SDK_INT >= 23) {
            V23.install(cl, dexFiles, optimizeDir);
        } else if (Build.VERSION.SDK_INT >= 19) {
            V19.install(cl, dexFiles, optimizeDir);
        } else if (Build.VERSION.SDK_INT >= 14) {
            V14.install(cl, dexFiles, optimizeDir);
        } else {
            Log.d(TAG, "not support!");
        }
    }

    /**
     * Installer for platform versions 23.
     */
    private static final class V23 {

        private static void install(ClassLoader loader, List<File> additionalClassPathEntries,
                                    File optimizedDirectory)
                throws IllegalArgumentException, IllegalAccessException,
                NoSuchFieldException, InvocationTargetException, NoSuchMethodException, IOException {
            /* The patched class loader is expected to be a descendant of
             * dalvik.system.BaseDexClassLoader. We modify its
             * dalvik.system.DexPathList pathList field to append additional DEX
             * file entries.
             */
            Field pathListField = Reflect.findField(loader, "pathList");
            Object dexPathList = pathListField.get(loader);
            ArrayList<IOException> suppressedExceptions = new ArrayList<IOException>();
            expandFieldArray(dexPathList, "dexElements", makePathElements(dexPathList,
                    new ArrayList<File>(additionalClassPathEntries), optimizedDirectory,
                    suppressedExceptions));
            if (suppressedExceptions.size() > 0) {
                for (IOException e : suppressedExceptions) {
                    Log.w(TAG, "Exception in makePathElement", e);
                    throw e;
                }

            }
        }

        /**
         * A wrapper around
         * {@code private static final dalvik.system.DexPathList#makePathElements}.
         */
        private static Object[] makePathElements(
                Object dexPathList, ArrayList<File> files, File optimizedDirectory,
                ArrayList<IOException> suppressedExceptions)
                throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {

            Method makePathElements;
            try {
                makePathElements = Reflect.findMethod(dexPathList, "makePathElements", List.class, File.class,
                        List.class);
            } catch (NoSuchMethodException e) {
                Log.e(TAG, "NoSuchMethodException: makePathElements(List,File,List) failure");
                try {
                    makePathElements = Reflect.findMethod(dexPathList, "makePathElements", ArrayList.class, File.class, ArrayList.class);
                } catch (NoSuchMethodException e1) {
                    Log.e(TAG, "NoSuchMethodException: makeDexElements(ArrayList,File,ArrayList) failure");
                    try {
                        Log.e(TAG, "NoSuchMethodException: try use v19 instead");
                        return V19.makeDexElements(dexPathList, files, optimizedDirectory, suppressedExceptions);
                    } catch (NoSuchMethodException e2) {
                        Log.e(TAG, "NoSuchMethodException: makeDexElements(List,File,List) failure");
                        throw e2;
                    }
                }
            }

            return (Object[]) makePathElements.invoke(dexPathList, files, optimizedDirectory, suppressedExceptions);
        }
    }

    /**
     * Installer for platform versions 19.
     */
    private static final class V19 {

        private static void install(ClassLoader loader, List<File> additionalClassPathEntries,
                                    File optimizedDirectory)
                throws IllegalArgumentException, IllegalAccessException,
                NoSuchFieldException, InvocationTargetException, NoSuchMethodException, IOException {
            /* The patched class loader is expected to be a descendant of
             * dalvik.system.BaseDexClassLoader. We modify its
             * dalvik.system.DexPathList pathList field to append additional DEX
             * file entries.
             */
            Field pathListField = Reflect.findField(loader, "pathList");
            Object dexPathList = pathListField.get(loader);
            ArrayList<IOException> suppressedExceptions = new ArrayList<IOException>();
            expandFieldArray(dexPathList, "dexElements", makeDexElements(dexPathList,
                    new ArrayList<File>(additionalClassPathEntries), optimizedDirectory,
                    suppressedExceptions));
            if (suppressedExceptions.size() > 0) {
                for (IOException e : suppressedExceptions) {
                    Log.w(TAG, "Exception in makeDexElement", e);
                    throw e;
                }
            }
        }

        /**
         * A wrapper around
         * {@code private static final dalvik.system.DexPathList#makeDexElements}.
         */
        private static Object[] makeDexElements(
                Object dexPathList, ArrayList<File> files, File optimizedDirectory,
                ArrayList<IOException> suppressedExceptions)
                throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {

            Method makeDexElements = null;
            try {
                makeDexElements = Reflect.findMethod(dexPathList, "makeDexElements", ArrayList.class, File.class,
                        ArrayList.class);
            } catch (NoSuchMethodException e) {
                Log.e(TAG, "NoSuchMethodException: makeDexElements(ArrayList,File,ArrayList) failure");
                try {
                    makeDexElements = Reflect.findMethod(dexPathList, "makeDexElements", List.class, File.class, List.class);
                } catch (NoSuchMethodException e1) {
                    Log.e(TAG, "NoSuchMethodException: makeDexElements(List,File,List) failure");
                    throw e1;
                }
            }

            return (Object[]) makeDexElements.invoke(dexPathList, files, optimizedDirectory, suppressedExceptions);
        }
    }

    /**
     * Installer for platform versions 14, 15, 16, 17 and 18.
     */
    private static final class V14 {

        private static void install(ClassLoader loader, List<File> additionalClassPathEntries,
                                    File optimizedDirectory)
                throws IllegalArgumentException, IllegalAccessException,
                NoSuchFieldException, InvocationTargetException, NoSuchMethodException {
            /* The patched class loader is expected to be a descendant of
             * dalvik.system.BaseDexClassLoader. We modify its
             * dalvik.system.DexPathList pathList field to append additional DEX
             * file entries.
             */
            Field pathListField = Reflect.findField(loader, "pathList");
            Object dexPathList = pathListField.get(loader);
            expandFieldArray(dexPathList, "dexElements", makeDexElements(dexPathList,
                    new ArrayList<File>(additionalClassPathEntries), optimizedDirectory));
        }

        /**
         * A wrapper around
         * {@code private static final dalvik.system.DexPathList#makeDexElements}.
         */
        private static Object[] makeDexElements(
                Object dexPathList, ArrayList<File> files, File optimizedDirectory)
                throws IllegalAccessException, InvocationTargetException,
                NoSuchMethodException {
            Method makeDexElements =
                    Reflect.findMethod(dexPathList, "makeDexElements", ArrayList.class, File.class);

            return (Object[]) makeDexElements.invoke(dexPathList, files, optimizedDirectory);
        }
    }

    /**
     * Replace the value of a field containing a non null array, by a new array containing the
     * elements of the original array plus the elements of extraElements.
     *
     * @param instance      the instance whose field is to be modified.
     * @param fieldName     the field to modify.
     * @param extraElements elements to append at the end of the array.
     */
    public static void expandFieldArray(Object instance, String fieldName, Object[] extraElements)
            throws NoSuchFieldException, IllegalArgumentException, IllegalAccessException {
        Field jlrField = Reflect.findField(instance, fieldName);

        Object[] original = (Object[]) jlrField.get(instance);
        Object[] combined = (Object[]) Array.newInstance(original.getClass().getComponentType(), original.length + extraElements.length);

        // NOTE: changed to copy extraElements first, for patch load first

        System.arraycopy(extraElements, 0, combined, 0, extraElements.length);
        System.arraycopy(original, 0, combined, extraElements.length, original.length);

        jlrField.set(instance, combined);
    }

}
