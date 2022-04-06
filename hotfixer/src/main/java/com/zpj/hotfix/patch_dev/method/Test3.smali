.class public Lcom/zpj/hotfix/patch_dev/method/Test3;
.super Ljava/lang/Object;
.source "Test3.java"


# instance fields
.field private bug:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/zpj/hotfix/patch_dev/method/Test3;->bug:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public test(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Long;Ljava/lang/Double;IJII)V
    .registers 18
    .param p1, "a"    # Ljava/lang/Integer;
    .param p2, "b"    # Ljava/lang/String;
    .param p3, "c"    # Ljava/lang/Object;
    .param p4, "d"    # Ljava/lang/Long;
    .param p5, "e"    # Ljava/lang/Double;
    .param p6, "f"    # I
    .param p7, "g"    # J
    .param p9, "h"    # I
    .param p10, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 12
    const/16 v3, 0x9

    new-array v0, v3, [Ljava/lang/Class;

    const/4 v3, 0x0

    const-class v4, Ljava/lang/Integer;

    aput-object v4, v0, v3

    const/4 v3, 0x1

    const-class v4, Ljava/lang/String;

    aput-object v4, v0, v3

    const/4 v3, 0x2

    const-class v4, Ljava/lang/Object;

    aput-object v4, v0, v3

    const/4 v3, 0x3

    const-class v4, Ljava/lang/Long;

    aput-object v4, v0, v3

    const/4 v3, 0x4

    const-class v4, Ljava/lang/Double;

    aput-object v4, v0, v3

    const/4 v3, 0x5

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v0, v3

    const/4 v3, 0x6

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v0, v3

    const/4 v3, 0x7

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v0, v3

    const/16 v3, 0x8

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v0, v3

    .line 13
    .local v0, "arr1":[Ljava/lang/Class;
    const/16 v3, 0x9

    new-array v1, v3, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v1, v3

    const/4 v3, 0x1

    aput-object p2, v1, v3

    const/4 v3, 0x2

    aput-object p3, v1, v3

    const/4 v3, 0x3

    aput-object p4, v1, v3

    const/4 v3, 0x4

    aput-object p5, v1, v3

    const/4 v3, 0x5

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v3

    const/4 v3, 0x6

    invoke-static {p7, p8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v1, v3

    const/4 v3, 0x7

    invoke-static/range {p9 .. p9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v3

    const/16 v3, 0x8

    invoke-static/range {p10 .. p10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v3

    .line 14
    .local v1, "arr2":[Ljava/lang/Object;
    iget-object v3, p0, Lcom/zpj/hotfix/patch_dev/method/Test3;->bug:Ljava/lang/Object;

    const-string v4, "test"

    invoke-static {v3, v4, v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    const/16 v2, 0xf

    .line 17
    .local v2, "l":I
    const-string v3, "tag"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "l="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    return-void
.end method
