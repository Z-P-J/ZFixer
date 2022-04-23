package me.weishu.epic.art.hook;

public interface IXUnhook<T> {
    /**
     * Returns the callback that has been registered.
     */
    T getCallback();

    /**
     * Removes the callback.
     */
    void unhook();
}
