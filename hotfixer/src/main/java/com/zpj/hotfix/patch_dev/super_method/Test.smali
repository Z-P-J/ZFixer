.class public Lcom/zpj/hotfix/patch_dev/super_method/Test;
.super Lcom/zpj/hotfix/patch_dev/super_method/Base;
.source "Test.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Test"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 7
    invoke-direct {p0}, Lcom/zpj/hotfix/patch_dev/super_method/Base;-><init>()V

    return-void
.end method


# virtual methods
.method public test()V
    .registers 4

    .prologue
    .line 23
    iget-object v0, p0, Lcom/zpj/hotfix/patch_dev/super_method/Test;->obj:Ljava/lang/Object;

    .line 24
    .local v0, "o":Ljava/lang/Object;
    invoke-super {p0}, Lcom/zpj/hotfix/patch_dev/super_method/Base;->test()V

    .line 25
    const-string v1, "Test"

    const-string v2, "this is Test!"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    return-void
.end method

.method public test(ILjava/lang/Integer;IDILjava/lang/Object;IIIIJIJLjava/lang/Long;)V
    .registers 20
    .param p1, "a"    # I
    .param p2, "b"    # Ljava/lang/Integer;
    .param p3, "c"    # I
    .param p4, "d"    # D
    .param p6, "e"    # I
    .param p7, "f"    # Ljava/lang/Object;
    .param p8, "g"    # I
    .param p9, "h"    # I
    .param p10, "i"    # I
    .param p11, "j"    # I
    .param p12, "k"    # J
    .param p14, "l"    # I
    .param p15, "m"    # J
    .param p17, "n"    # Ljava/lang/Long;

    .prologue
    .line 30
    const-string v0, "Test"

    const-string v1, "fix meeeeeeeeeee!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    invoke-super/range {p0 .. p17}, Lcom/zpj/hotfix/patch_dev/super_method/Base;->test(ILjava/lang/Integer;IDILjava/lang/Object;IIIIJIJLjava/lang/Long;)V

    .line 32
    return-void
.end method
