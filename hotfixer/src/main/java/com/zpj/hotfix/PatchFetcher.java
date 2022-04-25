package com.zpj.hotfix;

import com.zpj.hotfix.exception.PatchException;
import com.zpj.hotfix.model.PatchInfo;
import com.zpj.hotfix.model.Result;

public interface PatchFetcher {

    PatchInfo checkPatchUpdate(Patcher patcher, int version) throws PatchException;

}
