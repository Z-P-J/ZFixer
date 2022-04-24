.class public Lcom/zpj/hotfix/patch_dev/method/Test1;
.super Ljava/lang/Object;
.source "Test1.java"


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

    iput-object v0, p0, Lcom/zpj/hotfix/patch_dev/method/Test1;->bug:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public test(ILjava/lang/String;Ljava/lang/Object;JLjava/lang/Double;)V
    .registers 15
    .param p1, "a"    # I
    .param p2, "b"    # Ljava/lang/String;
    .param p3, "c"    # Ljava/lang/Object;
    .param p4, "d"    # J
    .param p6, "e"    # Ljava/lang/Double;
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

    sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v2, v0, v3

    const-class v2, Ljava/lang/String;

    aput-object v2, v0, v4

    const-class v2, Ljava/lang/Object;

    aput-object v2, v0, v5

    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v2, v0, v6

    const-class v2, Ljava/lang/Double;

    aput-object v2, v0, v7

    .line 11
    .local v0, "arr1":[Ljava/lang/Class;
    const/4 v2, 0x5

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    aput-object p2, v1, v4

    aput-object p3, v1, v5

    invoke-static {p4, p5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v1, v6

    aput-object p6, v1, v7

    .line 12
    .local v1, "arr2":[Ljava/lang/Object;
    iget-object v2, p0, Lcom/zpj/hotfix/patch_dev/method/Test1;->bug:Ljava/lang/Object;

    const-string v3, "test"

    invoke-static {v2, v3, v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->invoke(Ljava/lang/Object;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    return-void
.end method
