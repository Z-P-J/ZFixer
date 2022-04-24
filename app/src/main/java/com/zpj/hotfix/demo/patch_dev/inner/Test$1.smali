.class Lcom/zpj/hotfix/patch_dev/inner/Test$1;
.super Ljava/lang/Object;
.source "Test.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zpj/hotfix/patch_dev/inner/Test;->test()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/zpj/hotfix/patch_dev/inner/Test;


# direct methods
.method constructor <init>(Lcom/zpj/hotfix/patch_dev/inner/Test;)V
    .registers 2
    .param p1, "this$0"    # Lcom/zpj/hotfix/patch_dev/inner/Test;

    .prologue
    .line 10
    iput-object p1, p0, Lcom/zpj/hotfix/patch_dev/inner/Test$1;->this$0:Lcom/zpj/hotfix/patch_dev/inner/Test;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 1

    .prologue
    .line 14
    return-void
.end method
