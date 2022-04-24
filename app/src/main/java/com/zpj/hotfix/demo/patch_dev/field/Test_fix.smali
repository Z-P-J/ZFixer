.class public Lcom/zpj/hotfix/patch_dev/field/Test_fix;
.super Ljava/lang/Object;
.source "Test_fix.java"


# instance fields
.field private final bug:Lcom/zpj/hotfix/patch_dev/field/Test_bug;


# direct methods
.method public constructor <init>(Lcom/zpj/hotfix/patch_dev/field/Test_bug;)V
    .registers 2
    .param p1, "bug"    # Lcom/zpj/hotfix/patch_dev/field/Test_bug;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->bug:Lcom/zpj/hotfix/patch_dev/field/Test_bug;

    .line 16
    return-void
.end method

.method private getA()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 66
    iget-object v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->bug:Lcom/zpj/hotfix/patch_dev/field/Test_bug;

    const-string v1, "a"

    invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method private getContext()Landroid/content/Context;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 58
    iget-object v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->bug:Lcom/zpj/hotfix/patch_dev/field/Test_bug;

    const-string v1, "context"

    invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    return-object v0
.end method

.method private getObject()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 70
    iget-object v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->bug:Lcom/zpj/hotfix/patch_dev/field/Test_bug;

    const-string v1, "a"

    invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method private static getTag()Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 75
    const-class v0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;

    const-string v1, "TAG"

    invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getStaticField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method private getTest()Lcom/zpj/hotfix/patch_dev/method/Test;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 62
    iget-object v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->bug:Lcom/zpj/hotfix/patch_dev/field/Test_bug;

    const-string v1, "test"

    invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/zpj/hotfix/patch_dev/method/Test;

    return-object v0
.end method

.method private getText()Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 80
    iget-object v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->bug:Lcom/zpj/hotfix/patch_dev/field/Test_bug;

    const-string v1, "text"

    invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method private setTest(Lcom/zpj/hotfix/patch_dev/method/Test;)V
    .registers 4
    .param p1, "test"    # Lcom/zpj/hotfix/patch_dev/method/Test;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 88
    iget-object v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->bug:Lcom/zpj/hotfix/patch_dev/field/Test_bug;

    const-string v1, "test"

    invoke-static {v0, v1, p1}, Lcom/zpj/hotfix/utils/Reflect;->setField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 89
    return-void
.end method

.method private setText(Ljava/lang/String;)V
    .registers 4
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 84
    iget-object v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->bug:Lcom/zpj/hotfix/patch_dev/field/Test_bug;

    const-string v1, "text"

    invoke-static {v0, v1, p1}, Lcom/zpj/hotfix/utils/Reflect;->setField(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)V

    .line 85
    return-void
.end method


# virtual methods
.method public test()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 19
    invoke-direct {p0}, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "test"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 20
    return-void
.end method

.method public test1()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->getTest()Lcom/zpj/hotfix/patch_dev/method/Test;

    move-result-object v0

    const/4 v1, 0x0

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/zpj/hotfix/patch_dev/method/Test;->test4(ILjava/lang/Double;)V

    .line 24
    return-void
.end method

.method public test2()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 27
    invoke-direct {p0}, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->getTest()Lcom/zpj/hotfix/patch_dev/method/Test;

    move-result-object v0

    invoke-direct {p0}, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->getA()I

    move-result v1

    add-int/lit16 v1, v1, 0x3e8

    const-wide v2, 0x40d5b38000000000L    # 22222.0

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/zpj/hotfix/patch_dev/method/Test;->test4(ILjava/lang/Double;)V

    .line 29
    invoke-static {}, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->getTag()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "a="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->getA()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    return-void
.end method

.method public test4()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 43
    const-string v0, "fix 123"

    invoke-direct {p0, v0}, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->setText(Ljava/lang/String;)V

    .line 45
    const-string v0, "Test_bug"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "text="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->getText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    new-instance v0, Lcom/zpj/hotfix/patch_dev/method/Test;

    invoke-direct {v0}, Lcom/zpj/hotfix/patch_dev/method/Test;-><init>()V

    invoke-direct {p0, v0}, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->setTest(Lcom/zpj/hotfix/patch_dev/method/Test;)V

    .line 48
    invoke-direct {p0}, Lcom/zpj/hotfix/patch_dev/field/Test_fix;->getTest()Lcom/zpj/hotfix/patch_dev/method/Test;

    move-result-object v0

    const/4 v1, 0x0

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/zpj/hotfix/patch_dev/method/Test;->test4(ILjava/lang/Double;)V

    .line 49
    return-void
.end method
