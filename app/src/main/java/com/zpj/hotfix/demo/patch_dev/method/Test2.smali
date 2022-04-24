.class public Lcom/zpj/hotfix/patch_dev/method/Test2;
.super Ljava/lang/Object;
.source "Test2.java"


# instance fields
.field private bug:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 2

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/zpj/hotfix/patch_dev/method/Test2;->bug:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public test(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Long;Ljava/lang/Double;)V
    .registers 14
    .param p1, "a"    # Ljava/lang/Integer;
    .param p2, "b"    # Ljava/lang/String;
    .param p3, "c"    # Ljava/lang/Object;
    .param p4, "d"    # Ljava/lang/Long;
    .param p5, "e"    # Ljava/lang/Double;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 10
    const/4 v2, 0x5

    new-array v0, v2, [Ljava/lang/Class;

    const-class v2, Ljava/lang/Integer;

    aput-object v2, v0, v3

    const-class v2, Ljava/lang/String;

    aput-object v2, v0, v4

    const-class v2, Ljava/lang/Object;

    aput-object v2, v0, v5

    const-class v2, Ljava/lang/Long;

    aput-object v2, v0, v6

    const-class v2, Ljava/lang/Double;

    aput-object v2, v0, v7

    .line 11
    .local v0, "arr1":[Ljava/lang/Class;
    const/4 v2, 0x5

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p1, v1, v3

    aput-object p2, v1, v4

    aput-object p3, v1, v5

    aput-object p4, v1, v6

    aput-object p5, v1, v7

    .line 12
    .local v1, "arr2":[Ljava/lang/Object;
    iget-object v2, p0, Lcom/zpj/hotfix/patch_dev/method/Test2;->bug:Ljava/lang/Object;

    const-string v3, "test"

    invoke-static {v2, v3, v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    return-void
.end method
