.class public Lcom/zpj/hotfix/patch_dev/extend/Base_Fix;
.super Ljava/lang/Object;
.source "Base_Fix.java"


# instance fields
.field protected final mOrigin:Lcom/zpj/hotfix/patch_dev/extend/Base;


# direct methods
.method public constructor <init>(Lcom/zpj/hotfix/patch_dev/extend/Base;)V
    .registers 2
    .param p1, "base"    # Lcom/zpj/hotfix/patch_dev/extend/Base;

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/zpj/hotfix/patch_dev/extend/Base_Fix;->mOrigin:Lcom/zpj/hotfix/patch_dev/extend/Base;

    .line 10
    return-void
.end method
