package me.weishu.epic.art.hook;

import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Member;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import me.weishu.epic.art.Epic;
import me.weishu.epic.art.method.ArtMethod;
import me.weishu.epic.art.utils.Logger;

public class HookManager {

    private static final String TAG = "HookManager";

    private static final Object[] EMPTY_ARRAY = new Object[0];

    private static final Map<Member, CopyOnWriteSortedSet<XC_MethodHook>>
            HOOKED_METHOD_CALLBACKS = new HashMap<>();

    public static XC_MethodHook.Unhook hookMethod(final Member hookMethod, XC_MethodHook callback) {
        if (!(hookMethod instanceof Method) && !(hookMethod instanceof Constructor<?>)) {
            throw new IllegalArgumentException("only methods and constructors can be hooked");
        }

        Logger.d(TAG, "callback=" + callback);
        boolean newMethod = false;
        CopyOnWriteSortedSet<XC_MethodHook> callbacks;
        synchronized (HOOKED_METHOD_CALLBACKS) {
            callbacks = HOOKED_METHOD_CALLBACKS.get(hookMethod);
            Logger.d(TAG, "callbacks=" + callbacks);
            if (callbacks == null) {
                callbacks = new CopyOnWriteSortedSet<>();
                HOOKED_METHOD_CALLBACKS.put(hookMethod, callbacks);
                newMethod = true;
            }
        }

        Logger.w(TAG, "hook: " + hookMethod + ", newMethod ? " + newMethod);

        callbacks.add(callback);
        if (newMethod) {
//            if (Runtime.isArt()) {
//
//            }
            // TODO 支持davilk
            if (hookMethod instanceof Method) {
                Epic.hookMethod(((Method) hookMethod));
            } else {
                Epic.hookMethod(((Constructor<?>) hookMethod));
            }
        }
        return callback.new Unhook(hookMethod) {
            @Override
            public void unhook() {
                unhookMethod(getHookedMethod());
            }
        };
    }

    public static Object handleHookedArtMethod(Object artMethodObject, Object thisObject, Object[] args) {

        CopyOnWriteSortedSet<XC_MethodHook> callbacks;

        ArtMethod artmethod = (ArtMethod ) artMethodObject;
        synchronized (HOOKED_METHOD_CALLBACKS) {
            callbacks = HOOKED_METHOD_CALLBACKS.get(artmethod.getExecutable());
        }
        Object[] callbacksSnapshot = callbacks.getSnapshot();
        final int callbacksLength = callbacksSnapshot.length;
        //Logger.d(TAG, "callbacksLength:" + callbacksLength +  ", this:" + thisObject + ", args:" + Arrays.toString(args));
        if (callbacksLength == 0) {
            try {
                ArtMethod method = Epic.getBackMethod(artmethod);
                return method.invoke(thisObject, args);
            } catch (Exception e) {
                Logger.logThrowable(e.getCause());
            }
        }

        XC_MethodHook.MethodHookParam param = new XC_MethodHook.MethodHookParam();
        param.method  = (Member) (artmethod).getExecutable();
        param.thisObject = thisObject;
        param.args = args;

        // call "before method" callbacks
        int beforeIdx = 0;
        do {
            try {
                ((XC_MethodHook) callbacksSnapshot[beforeIdx]).beforeHookedMethod(param);
            } catch (Throwable t) {
                Logger.logThrowable(t);

                // reset result (ignoring what the unexpectedly exiting callback did)
                param.setResult(null);
                param.returnEarly = false;
                continue;
            }

            if (param.returnEarly) {
                // skip remaining "before" callbacks and corresponding "after" callbacks
                beforeIdx++;
                break;
            }
        } while (++beforeIdx < callbacksLength);

        // call original method if not requested otherwise
        if (!param.returnEarly) {
            try {
                ArtMethod method = Epic.getBackMethod(artmethod);
                Object result = method.invoke(thisObject, args);
                param.setResult(result);
            } catch (Exception e) {
                // log(e); origin throw exception is normal.
                param.setThrowable(e);
            }
        }

        // call "after method" callbacks
        int afterIdx = beforeIdx - 1;
        do {
            Object lastResult =  param.getResult();
            Throwable lastThrowable = param.getThrowable();

            try {
                ((XC_MethodHook) callbacksSnapshot[afterIdx]).afterHookedMethod(param);
            } catch (Throwable t) {
                Logger.logThrowable(t);

                // reset to last result (ignoring what the unexpectedly exiting callback did)
                if (lastThrowable == null)
                    param.setResult(lastResult);
                else
                    param.setThrowable(lastThrowable);
            }
        } while (--afterIdx >= 0);

        if (param.hasThrowable()) {
            final Throwable throwable = param.getThrowable();
            if (throwable instanceof IllegalAccessException || throwable instanceof InvocationTargetException
                    || throwable instanceof InstantiationException) {
                // reflect exception, get the origin cause
                final Throwable cause = throwable.getCause();

                // We can not change the exception flow of origin call, rethrow
                // Logger.e(TAG, "origin call throw exception (not a real crash, just record for debug):", cause);
                throw (RuntimeException) cause;
            } else {
                // the exception cause by epic self, just log.
                Logger.e(TAG, "epic cause exception in call bridge!!", throwable);
            }
            return null; // never reached.
        } else {
            final Object result = param.getResult();
            //Logger.d(TAG, "return :" + result);
            return result;
        }
    }

    public static void unhookMethod(Member hookMethod, XC_MethodHook callback) {
        CopyOnWriteSortedSet<XC_MethodHook> callbacks;
        synchronized (HOOKED_METHOD_CALLBACKS) {
            callbacks = HOOKED_METHOD_CALLBACKS.get(hookMethod);
            if (callbacks == null)
                return;
        }
        callbacks.remove(callback);
    }

    public static void unhookMethod(Member hookMethod) {
        CopyOnWriteSortedSet<XC_MethodHook> callbacks;
        synchronized (HOOKED_METHOD_CALLBACKS) {
            callbacks = HOOKED_METHOD_CALLBACKS.get(hookMethod);
            if (callbacks != null) {
                callbacks.clear();
            }
        }
    }


    public static class CopyOnWriteSortedSet<E> {
        private transient volatile Object[] elements = EMPTY_ARRAY;

        public synchronized boolean add(E e) {
            int index = indexOf(e);
            if (index >= 0)
                return false;

            Object[] newElements = new Object[elements.length + 1];
            System.arraycopy(elements, 0, newElements, 0, elements.length);
            newElements[elements.length] = e;
            Arrays.sort(newElements);
            elements = newElements;
            return true;
        }

        public synchronized boolean remove(E e) {
            int index = indexOf(e);
            if (index == -1)
                return false;

            Object[] newElements = new Object[elements.length - 1];
            System.arraycopy(elements, 0, newElements, 0, index);
            System.arraycopy(elements, index + 1, newElements, index, elements.length - index - 1);
            elements = newElements;
            return true;
        }

        public synchronized void clear(){
            elements = EMPTY_ARRAY;
        }

        private int indexOf(Object o) {
            for (int i = 0; i < elements.length; i++) {
                if (o.equals(elements[i]))
                    return i;
            }
            return -1;
        }

        public Object[] getSnapshot() {
            return elements;
        }
    }


}
