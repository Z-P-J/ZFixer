package com.zpj.hotfix;

import android.content.Context;

import com.zpj.hotfix.model.Result;

import java.io.File;

public class Patcher {

    private final Context context;
    private final Callback callback;
    private final PatchFetcher fetcher;
    private final File patchDir;

    private Patcher(Builder builder) {
        this.context = builder.context;
        this.callback = builder.callback;
        this.fetcher = builder.fetcher;
        if (builder.patchDir == null) {
            this.patchDir = this.context.getDir("hotfix", Context.MODE_PRIVATE);
        } else {
            this.patchDir = builder.patchDir;
        }
    }

    public Context getContext() {
        return context;
    }

    public Callback getCallback() {
        return callback;
    }

    public PatchFetcher getFetcher() {
        return fetcher;
    }

    public static class Builder {

        private final Context context;
        private Callback callback;
        private PatchFetcher fetcher;
        private File patchDir;

        public Builder(Context context) {
            this.context = context;
        }

        public Builder setCallback(Callback callback) {
            this.callback = callback;
            return this;
        }

        public Builder setFetcher(PatchFetcher fetcher) {
            this.fetcher = fetcher;
            return this;
        }

        public Builder setPatchDir(File patchDir) {
            this.patchDir = patchDir;
            return this;
        }

        public Patcher build() {
            return new Patcher(this);
        }

    }

    public interface Callback {

        void onResult(Result result);

    }

}
