package com.zpj.hotfix;

import android.app.Application;
import android.content.Context;

import com.zpj.hotfix.model.Result;

import java.io.File;

public class Patcher {

    private final Application application;
    private final Callback callback;
    private final PatchFetcher fetcher;
    private final File patchDir;

    private Patcher(Builder builder) {
        this.application = builder.application;
        this.callback = builder.callback;
        this.fetcher = builder.fetcher;
        if (builder.patchDir == null) {
            this.patchDir = this.application.getDir("hotfix", Context.MODE_PRIVATE);
        } else {
            this.patchDir = builder.patchDir;
        }
    }

    public Application getApplication() {
        return application;
    }

    public Callback getCallback() {
        return callback;
    }

    public PatchFetcher getFetcher() {
        return fetcher;
    }

    public static class Builder {

        private final Application application;
        private Callback callback;
        private PatchFetcher fetcher;
        private File patchDir;

        public Builder(Application application) {
            this.application = application;
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
