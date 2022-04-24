package com.zpj.hotfix;

import com.zpj.hotfix.model.Result;

public interface PatchFetcher {

    Result checkPatchUpdate(Patcher patcher, int version);

}
