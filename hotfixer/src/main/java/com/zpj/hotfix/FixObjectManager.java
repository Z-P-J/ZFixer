package com.zpj.hotfix;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.WeakHashMap;

public class FixObjectManager {


    private static final WeakHashMap<Object, Object> FIX_OBJECT_MAP = new WeakHashMap<>();


    public static <T> T get(Object object, Class<T> clazz) throws NoSuchMethodException, IllegalAccessException, InvocationTargetException, InstantiationException {
        Object fixObject = FIX_OBJECT_MAP.get(object);
        if (fixObject == null) {
            synchronized (FIX_OBJECT_MAP) {
                fixObject = FIX_OBJECT_MAP.get(object);
                if (fixObject == null) {
                    Constructor<?> constructor = clazz.getConstructor(object.getClass());
                    fixObject = constructor.newInstance(object);
                    FIX_OBJECT_MAP.put(object, fixObject);
                }
            }
        }
        return (T) fixObject;
    }

}
