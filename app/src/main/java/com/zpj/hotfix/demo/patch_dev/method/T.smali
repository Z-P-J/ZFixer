.class public Lcom/zpj/hotfix/demo/patch_dev/method/T;
.super Ljava/lang/Object;
.source "T.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static test(Lcom/zpj/hotfix/demo/patch_dev/method/T;)V
    .registers 2
    .param p0, "_this"    # Lcom/zpj/hotfix/demo/patch_dev/method/T;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 8
    const-string v0, "test"

    invoke-static {p0, v0}, Lcom/zpj/hotfix/utils/Reflect;->invoke(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    return-void
.end method

.method private static test(Lcom/zpj/hotfix/demo/patch_dev/method/T;IJSZDFBLjava/lang/String;)V
    .registers 15
    .param p0, "_this"    # Lcom/zpj/hotfix/demo/patch_dev/method/T;
    .param p1, "i"    # I
    .param p2, "l"    # J
    .param p4, "s"    # S
    .param p5, "b"    # Z
    .param p6, "d"    # D
    .param p8, "f"    # F
    .param p9, "by"    # B
    .param p10, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 13
    const/4 v2, 0x7

    new-array v0, v2, [Ljava/lang/Class;

    const/4 v2, 0x0

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v2

    const/4 v2, 0x1

    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v2

    const/4 v2, 0x2

    sget-object v3, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v2

    const/4 v2, 0x3

    sget-object v3, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v2

    const/4 v2, 0x4

    sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v2

    const/4 v2, 0x5

    sget-object v3, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v2

    const/4 v2, 0x6

    const-class v3, Ljava/lang/String;

    aput-object v3, v0, v2

    .line 14
    .local v0, "arr1":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/16 v2, 0x8

    new-array v1, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p4}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    invoke-static {p6, p7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    invoke-static {p8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    invoke-static {p9}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    aput-object p10, v1, v2

    .line 15
    .local v1, "arr2":[Ljava/lang/Object;
    const-string v2, "test"

    invoke-static {p0, v2, v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    return-void
.end method

.method private static testStatic(IJSZDFBLjava/lang/String;)V
    .registers 15
    .param p0, "i"    # I
    .param p1, "l"    # J
    .param p3, "s"    # S
    .param p4, "b"    # Z
    .param p5, "d"    # D
    .param p7, "f"    # F
    .param p8, "by"    # B
    .param p9, "string"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 20
    const/4 v2, 0x7

    new-array v0, v2, [Ljava/lang/Class;

    const/4 v2, 0x0

    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v2

    const/4 v2, 0x1

    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v2

    const/4 v2, 0x2

    sget-object v3, Ljava/lang/Short;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v2

    const/4 v2, 0x3

    sget-object v3, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v2

    const/4 v2, 0x4

    sget-object v3, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v2

    const/4 v2, 0x5

    sget-object v3, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    aput-object v3, v0, v2

    const/4 v2, 0x6

    const-class v3, Ljava/lang/String;

    aput-object v3, v0, v2

    .line 21
    .local v0, "arr1":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    const/16 v2, 0x8

    new-array v1, v2, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    invoke-static {p3}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x3

    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    invoke-static {p5, p6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x5

    invoke-static {p7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x6

    invoke-static {p8}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x7

    aput-object p9, v1, v2

    .line 22
    .local v1, "arr2":[Ljava/lang/Object;
    const-class v2, Lcom/zpj/hotfix/demo/patch_dev/method/T;

    const-string v3, "test"

    invoke-static {v2, v3, v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->invokeStatic(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    return-void
.end method
