.class public Lcom/zpj/hotfix/patch_dev/extend/Test_Fix;
.super Lcom/zpj/hotfix/patch_dev/extend/Base_Fix;
.source "Test_Fix.java"


# direct methods
.method public constructor <init>(Lcom/zpj/hotfix/patch_dev/extend/Test;)V
    .registers 2
    .param p1, "test"    # Lcom/zpj/hotfix/patch_dev/extend/Test;

    .prologue
    .line 6
    invoke-direct {p0, p1}, Lcom/zpj/hotfix/patch_dev/extend/Base_Fix;-><init>(Lcom/zpj/hotfix/patch_dev/extend/Base;)V

    .line 7
    return-void
.end method
