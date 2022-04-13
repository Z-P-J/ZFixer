.class public Lcom/zpj/hotfix/patch_dev/field/Test2;
.super Ljava/lang/Object;
.source "Test2.java"


# instance fields
.field private final test:Lcom/zpj/hotfix/patch_dev/field/Test;


# direct methods
.method public constructor <init>(Lcom/zpj/hotfix/patch_dev/field/Test;)V
    .registers 2
    .param p1, "test"    # Lcom/zpj/hotfix/patch_dev/field/Test;

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/zpj/hotfix/patch_dev/field/Test2;->test:Lcom/zpj/hotfix/patch_dev/field/Test;

    .line 11
    return-void
.end method

.method public static test5()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 43
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/zpj/hotfix/patch_dev/field/Test2;->testSet(I)V

    .line 44
    return-void
.end method

.method public static testGet()Ljava/lang/Integer;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 16
    const-class v0, Lcom/zpj/hotfix/patch_dev/field/Test;

    const-string v1, "a"

    invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getStaticField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    return-object v0
.end method

.method public static testSet(I)V
    .registers 4
    .param p0, "value"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 20
    const-class v0, Lcom/zpj/hotfix/patch_dev/field/Test;

    const-string v1, "a"

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/zpj/hotfix/utils/Reflect;->setStaticField(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Object;)V

    .line 21
    return-void
.end method


# virtual methods
.method public test1()V
    .registers 2

    .prologue
    .line 24
    sget v0, Lcom/zpj/hotfix/patch_dev/field/Test;->a:I

    .line 26
    .local v0, "a":I
    return-void
.end method

.method public test2()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    invoke-static {}, Lcom/zpj/hotfix/patch_dev/field/Test2;->testGet()Ljava/lang/Integer;

    move-result-object v0

    .line 31
    .local v0, "a":Ljava/lang/Integer;
    return-void
.end method

.method public test3()V
    .registers 2

    .prologue
    .line 34
    const/4 v0, 0x1

    sput v0, Lcom/zpj/hotfix/patch_dev/field/Test;->a:I

    .line 36
    return-void
.end method

.method public test4()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 39
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/zpj/hotfix/patch_dev/field/Test2;->testSet(I)V

    .line 40
    return-void
.end method
