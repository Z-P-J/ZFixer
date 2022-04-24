.class public Lcom/zpj/hotfix/patch_dev/inner/Test$Test_Fix;
.super Ljava/lang/Object;
.source "Test.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/zpj/hotfix/patch_dev/inner/Test;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Test_Fix"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zpj/hotfix/patch_dev/inner/Test;


# direct methods
.method public constructor <init>(Lcom/zpj/hotfix/patch_dev/inner/Test;)V
    .registers 2
    .param p1, "this$0"    # Lcom/zpj/hotfix/patch_dev/inner/Test;

    .prologue
    .line 5
    iput-object p1, p0, Lcom/zpj/hotfix/patch_dev/inner/Test$Test_Fix;->this$0:Lcom/zpj/hotfix/patch_dev/inner/Test;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
