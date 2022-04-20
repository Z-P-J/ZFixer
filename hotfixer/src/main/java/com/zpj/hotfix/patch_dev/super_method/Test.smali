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

.method private _super_test(ILjava/lang/Integer;IIILjava/lang/Object;IIIIJI)V
    .registers 19
    .param p1, "a"    # I
    .param p2, "b"    # Ljava/lang/Integer;
    .param p3, "c"    # I
    .param p4, "d"    # I
    .param p5, "e"    # I
    .param p6, "f"    # Ljava/lang/Object;
    .param p7, "g"    # I
    .param p8, "h"    # I
    .param p9, "i"    # I
    .param p10, "j"    # I
    .param p11, "k"    # J
    .param p13, "l"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 46
    iget-object v1, p0, Lcom/zpj/hotfix/patch_dev/super_method/Test;->obj:Ljava/lang/Object;

    .line 47
    .local v1, "o":Ljava/lang/Object;
    const/16 v2, 0xc

    new-array v0, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    const/4 v2, 0x1

    aput-object p2, v0, v2

    const/4 v2, 0x2

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    const/4 v2, 0x3

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    const/4 v2, 0x4

    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    const/4 v2, 0x5

    aput-object p6, v0, v2

    const/4 v2, 0x6

    invoke-static {p7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    const/4 v2, 0x7

    invoke-static {p8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    const/16 v2, 0x8

    invoke-static {p9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    const/16 v2, 0x9

    invoke-static {p10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    const/16 v2, 0xa

    invoke-static/range {p11 .. p12}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v0, v2

    const/16 v2, 0xb

    invoke-static/range {p13 .. p13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v0, v2

    .line 48
    .local v0, "arr":[Ljava/lang/Object;
    const-string v2, "name"

    const-string v3, "sig"

    invoke-static {v1, v2, v3, v0}, Lcom/zpj/hotfix/utils/Reflect;->invokeSuperVoid(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 49
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
    .registers 40
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
    .line 18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/zpj/hotfix/patch_dev/super_method/Test;->obj:Ljava/lang/Object;

    move-object/from16 v20, v0

    .line 19
    .local v20, "o":Ljava/lang/Object;
    const/4 v3, 0x0

    const/4 v9, 0x0

    const-wide/16 v4, 0x64

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    move-object/from16 v2, p0

    move-object/from16 v4, p2

    move/from16 v5, p3

    move-wide/from16 v6, p4

    move/from16 v8, p6

    move/from16 v10, p8

    move/from16 v11, p9

    move/from16 v12, p10

    move/from16 v13, p11

    move-wide/from16 v14, p12

    move/from16 v16, p14

    move-wide/from16 v17, p15

    invoke-super/range {v2 .. v19}, Lcom/zpj/hotfix/patch_dev/super_method/Base;->test(ILjava/lang/Integer;IDILjava/lang/Object;IIIIJIJLjava/lang/Long;)V

    .line 20
    return-void
.end method
