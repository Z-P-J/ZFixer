package com.zpj.hotfix.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;

public class Reflect {

    public void get() {

    }

    public static <T> T getStaticField(Class<?> clazz, String name) throws Exception {
        Field field = clazz.getDeclaredField(name);
        field.setAccessible(true);
        return (T) field.get(null);
    }

    public static void setStaticField(Class<?> clazz, String name, Object value) throws Exception {
        Field field = clazz.getDeclaredField(name);
        field.setAccessible(true);
        field.set(null, value);
    }

    public static <T> T getField(Object obj, String name) throws Exception {
        Field field = obj.getClass().getDeclaredField(name);
        field.setAccessible(true);
        return (T) field.get(obj);
    }

    public static void setField(Object obj, String name, Object value) throws Exception {
        Field field = obj.getClass().getDeclaredField(name);
        field.setAccessible(true);
        field.set(obj, value);
    }

    public static <T> T invoke(Object obj, String name) throws Exception {
        Method method = obj.getClass().getDeclaredMethod(name);
        method.setAccessible(true);
        return (T) method.invoke(obj);
    }

    public static <T> T invoke(Object obj, String name, Class<?>[] parameterTypes, Object[] args) throws Exception {
        Method method = obj.getClass().getDeclaredMethod(name, parameterTypes);
        method.setAccessible(true);
        return (T) method.invoke(obj, args);
    }

    public static <T> T invokeStatic(Class<?> clazz, String name) throws Exception {
        Method method = clazz.getDeclaredMethod(name);
        method.setAccessible(true);
        return (T) method.invoke(null);
    }

    public static <T> T invokeStatic(Class<?> clazz, String name, Class<?>[] parameterTypes, Object[] args) throws Exception {
        Method method = clazz.getDeclaredMethod(name, parameterTypes);
        method.setAccessible(true);
        return (T) method.invoke(null, args);
    }

}
