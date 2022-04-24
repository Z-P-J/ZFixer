.class public Lcom/zpj/hotfix/patch_dev/inner/Test;
.super Ljava/lang/Object;
.source "Test.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zpj/hotfix/patch_dev/inner/Test$Test_Fix;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public test()V
    .registers 3

    .prologue
    .line 10
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/zpj/hotfix/patch_dev/inner/Test$1;

    invoke-direct {v1, p0}, Lcom/zpj/hotfix/patch_dev/inner/Test$1;-><init>(Lcom/zpj/hotfix/patch_dev/inner/Test;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 15
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 16
    return-void
.end method
