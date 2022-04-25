package com.zpj.hotfix.demo;

import android.app.Application;

import com.zpj.hotfix.PatchFetcher;
import com.zpj.hotfix.Patcher;
import com.zpj.hotfix.ZFixer;
import com.zpj.hotfix.exception.PatchException;
import com.zpj.hotfix.model.PatchInfo;
import com.zpj.hotfix.model.Result;
import com.zpj.hotfix.utils.Logger;

public class App extends Application {

    @Override
    public void onCreate() {
        super.onCreate();
        Patcher patcher = new Patcher.Builder(this)
                .setFetcher(new PatchFetcher() {
                    @Override
                    public PatchInfo checkPatchUpdate(Patcher patcher, int version) throws PatchException {
                        // TODO
                        return null;
                    }
                })
                .setCallback(new Patcher.Callback() {
                    @Override
                    public void onResult(Result result) {
                        Logger.d("App", "result=" + result);
                    }
                })
                .build();
        ZFixer.getInstance().init(patcher);
    }
}
