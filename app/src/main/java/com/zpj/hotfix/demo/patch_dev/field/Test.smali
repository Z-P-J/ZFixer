.class public Lcom/zpj/hotfix/demo/patch_dev/field/Test;
.super Ljava/lang/Object;
.source "Test.java"


# static fields
.field public static a:I


# instance fields
.field private b:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getB(Lcom/zpj/hotfix/demo/patch_dev/field/Test;)I
    .registers 2
    .param p0, "test"    # Lcom/zpj/hotfix/demo/patch_dev/field/Test;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 26
    const-string v0, "b"

    invoke-static {p0, v0}, Lcom/zpj/hotfix/utils/Reflect;->getField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method private static getC(Lcom/zpj/hotfix/demo/patch_dev/field/Test;)J
    .registers 3
    .param p0, "test"    # Lcom/zpj/hotfix/demo/patch_dev/field/Test;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 30
    const-string v0, "b"

    invoke-static {p0, v0}, Lcom/zpj/hotfix/utils/Reflect;->getField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method private static getD()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 34
    const-class v0, Lcom/zpj/hotfix/demo/patch_dev/field/Test;

    const-string v1, "b"

    invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getStaticField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method private static getE()J
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 38
    const-class v0, Lcom/zpj/hotfix/demo/patch_dev/field/Test;

    const-string v1, "b"

    invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getStaticField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method private static setB(Lcom/zpj/hotfix/demo/patch_dev/field/Test;I)V
    .registers 4
    .param p0, "test"    # Lcom/zpj/hotfix/demo/patch_dev/field/Test;
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 42
    const-string v0, "b"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->setField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 43
    return-void
.end method

.method public static test1(Lcom/zpj/hotfix/demo/patch_dev/field/Test;)V
    .registers 3
    .param p0, "_this"    # Lcom/zpj/hotfix/demo/patch_dev/field/Test;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 17
    invoke-static {p0}, Lcom/zpj/hotfix/demo/patch_dev/field/Test;->getB(Lcom/zpj/hotfix/demo/patch_dev/field/Test;)I

    move-result v0

    .line 18
    .local v0, "num":I
    const/16 v1, 0x64

    invoke-static {p0, v1}, Lcom/zpj/hotfix/demo/patch_dev/field/Test;->setB(Lcom/zpj/hotfix/demo/patch_dev/field/Test;I)V

    .line 19
    return-void
.end method


# virtual methods
.method public test()V
    .registers 3

    .prologue
    .line 12
    iget v0, p0, Lcom/zpj/hotfix/demo/patch_dev/field/Test;->b:I

    .line 13
    .local v0, "num":I
    const/16 v1, 0x64

    iput v1, p0, Lcom/zpj/hotfix/demo/patch_dev/field/Test;->b:I

    .line 14
    return-void
.end method
