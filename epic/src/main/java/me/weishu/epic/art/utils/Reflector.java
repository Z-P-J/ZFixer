package me.weishu.epic.art.utils;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Arrays;

import me.weishu.epic.art.EpicNative;

public class Reflector {

    public void get() {

    }

    public static <T> T getStaticField(Class<?> clazz, String name) throws Exception {
        Field field = findField(clazz, name);
        return (T) field.get(null);
    }

    public static void setStaticField(Class<?> clazz, String name, Object value) throws Exception {
        Field field = findField(clazz, name);
        field.set(null, value);
    }

    public static <T> T getField(Object obj, String name) throws Exception {
        Field field = findField(obj, name);
        return (T) field.get(obj);
    }

    public static void setField(Object obj, String name, Object value) throws Exception {
        Field field = findField(obj, name);
        field.set(obj, value);
    }

    public static <T> T invoke(Object obj, String name) throws Exception {
        Method method = findMethod(obj, name);
        return (T) method.invoke(obj);
    }

    public static <T> T invoke(Object obj, String name, Class<?>[] parameterTypes, Object[] args) throws Exception {
        Method method = findMethod(obj, name, parameterTypes);
        return (T) method.invoke(obj, args);
    }

    public static <T> T invokeStatic(Class<?> clazz, String name) throws Exception {
        Method method = findMethod(clazz, name);
        return (T) method.invoke(null);
    }

    public static <T> T invokeStatic(Class<?> clazz, String name, Class<?>[] parameterTypes, Object[] args) throws Exception {
        Method method = findMethod(clazz, name, parameterTypes);
        return (T) method.invoke(null, args);
    }

    public static Field findField(Object instance, String name) throws NoSuchFieldException {
        return findField(instance.getClass(), name);
    }

    public static Field findField(Class<?> clazz, String name) throws NoSuchFieldException {
        for (Class<?> c = clazz; c != null; c = c.getSuperclass()) {
            try {
                Field field = c.getDeclaredField(name);

                if (!field.isAccessible()) {
                    field.setAccessible(true);
                }
                return field;
            } catch (NoSuchFieldException e) {
                // ignore and search next
            }
        }
        throw new NoSuchFieldException("Field " + name + " not found in " + clazz);
    }

    public static Method findMethod(Object instance, String name, Class<?>... parameterTypes)
            throws NoSuchMethodException {
        return findMethod(instance.getClass(), name, parameterTypes);
    }

    public static Method findMethod(final Class<?> clazz, String name, Class<?>... parameterTypes)
            throws NoSuchMethodException {
        for (Class<?> c = clazz; c != null; c = c.getSuperclass()) {
            try {
                Method method = c.getDeclaredMethod(name, parameterTypes);

                if (!method.isAccessible()) {
                    method.setAccessible(true);
                }

                return method;
            } catch (NoSuchMethodException e) {
                // ignore and search next
            }
        }
        throw new NoSuchMethodException("Method " + name + " with parameters "
                + Arrays.asList(parameterTypes) + " not found in " + clazz);
    }

//    @RequiresApi(api = Build.VERSION_CODES.O)
//    public static  <T> T invokeSuper(final Object object, String name, Class<?> returnType, Class<?>[] parameterTypes, Object[] args)
//            throws Throwable {
//        return invokeSuper(object.getClass(), name, returnType, parameterTypes, args);
//    }
//
//    @RequiresApi(api = Build.VERSION_CODES.O)
//    public static  <T> T invokeSuper(final Class<?> clazz, String name, Class<?> returnType, Class<?>[] parameterTypes, Object[] args)
//            throws Throwable {
//        MethodHandles.Lookup lookup = MethodHandles.lookup();
//
//        Field allowedModes = MethodHandles.Lookup.class.getDeclaredField("allowedModes");
//        allowedModes.setAccessible(true);
//        allowedModes.set(lookup, -1);  // 关键，没有这三步的操作findSpecial方法内部this.checkSpecialCaller(specialCaller);会抛异常
//
//        MethodHandle h1 = lookup.findSpecial(clazz.getSuperclass(), name,
//                MethodType.methodType(returnType, parameterTypes), clazz);
//        return (T) h1.invoke(null, args);
//    }

    public static <T> T invokeSuperObject(final Object object, String name, String signature, Object...args)
            throws Throwable {
        return (T) EpicNative.invokeSuperObject(object, name, signature, args);
    }

    public static void invokeSuperVoid(final Object object, String name, String signature, Object...args)
            throws Throwable {
        EpicNative.invokeSuperVoid(object, name, signature, args);
    }

}
