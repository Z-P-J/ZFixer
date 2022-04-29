.class public Lcom/zpj/hotfix/demo/patch_dev/field/T;
.super Ljava/lang/Object;
.source "T.java"


# static fields
.field private static a:I

.field private static b:J


# direct methods
.method public constructor <init>()V
    .registers 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getA()I
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 12
    const-class v0, Lcom/zpj/hotfix/demo/patch_dev/field/T;

    const-string v1, "a"

    invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getStaticField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static getA(Lcom/zpj/hotfix/demo/patch_dev/field/T;)I
    .registers 2
    .param p0, "_this"    # Lcom/zpj/hotfix/demo/patch_dev/field/T;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 20
    const-string v0, "a"

    invoke-static {p0, v0}, Lcom/zpj/hotfix/utils/Reflect;->getField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public static getB()J
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 16
    const-class v0, Lcom/zpj/hotfix/demo/patch_dev/field/T;

    const-string v1, "b"

    invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getStaticField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public static getB(Lcom/zpj/hotfix/demo/patch_dev/field/T;)J
    .registers 3
    .param p0, "_this"    # Lcom/zpj/hotfix/demo/patch_dev/field/T;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 24
    const-string v0, "b"

    invoke-static {p0, v0}, Lcom/zpj/hotfix/utils/Reflect;->getField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    return-wide v0
.end method

.method public static setA(I)V
    .registers 4
    .param p0, "a"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 34
    const-class v0, Lcom/zpj/hotfix/demo/patch_dev/field/T;

    const-string v1, "a"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/zpj/hotfix/utils/Reflect;->setStaticField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    .line 35
    return-void
.end method

.method public static setB(J)V
    .registers 6
    .param p0, "b"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 38
    const-class v0, Lcom/zpj/hotfix/demo/patch_dev/field/T;

    const-string v1, "b"

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/zpj/hotfix/utils/Reflect;->setStaticField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    .line 39
    return-void
.end method

.method public static setC(Lcom/zpj/hotfix/demo/patch_dev/field/T;I)V
    .registers 4
    .param p0, "_this"    # Lcom/zpj/hotfix/demo/patch_dev/field/T;
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 43
    const-string v0, "b"

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->setField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 44
    return-void
.end method

.method public static setD(Lcom/zpj/hotfix/demo/patch_dev/field/T;J)V
    .registers 6
    .param p0, "_this"    # Lcom/zpj/hotfix/demo/patch_dev/field/T;
    .param p1, "b"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 47
    const-string v0, "b"

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {p0, v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->setField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 48
    return-void
.end method

.method public static setObj(Ljava/lang/Object;)V
    .registers 3
    .param p0, "obj"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    const-class v0, Lcom/zpj/hotfix/demo/patch_dev/field/T;

    const-string v1, "obj"

    invoke-static {v0, v1, p0}, Lcom/zpj/hotfix/utils/Reflect;->setStaticField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    .line 30
    return-void
.end method
