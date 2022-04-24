.class public Lcom/zpj/hotfix/patch_dev/field/Test_bug;
.super Ljava/lang/Object;
.source "Test_bug.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "Test_bug"


# instance fields
.field private a:I

.field private final context:Landroid/content/Context;

.field private l:J

.field private test:Lcom/zpj/hotfix/patch_dev/method/Test;

.field private text:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    new-instance v0, Lcom/zpj/hotfix/patch_dev/method/Test;

    invoke-direct {v0}, Lcom/zpj/hotfix/patch_dev/method/Test;-><init>()V

    iput-object v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->test:Lcom/zpj/hotfix/patch_dev/method/Test;

    .line 20
    const-string v0, "123"

    iput-object v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->text:Ljava/lang/String;

    .line 24
    iput-object p1, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->context:Landroid/content/Context;

    .line 25
    return-void
.end method


# virtual methods
.method public test()V
    .registers 4

    .prologue
    .line 28
    iget-object v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->context:Landroid/content/Context;

    const-string v1, "test"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 29
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
    .line 32
    iget-object v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->test:Lcom/zpj/hotfix/patch_dev/method/Test;

    const/4 v1, 0x0

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/zpj/hotfix/patch_dev/method/Test;->test4(ILjava/lang/Double;)V

    .line 33
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
    .line 36
    iget-object v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->test:Lcom/zpj/hotfix/patch_dev/method/Test;

    iget v1, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    add-int/lit16 v1, v1, 0x3e8

    const-wide v2, 0x40d5b38000000000L    # 22222.0

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/zpj/hotfix/patch_dev/method/Test;->test4(ILjava/lang/Double;)V

    .line 42
    const-string v0, "Test_bug"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "a="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    return-void
.end method

.method public test3()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 46
    iget v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    .line 48
    const-string v0, "Test_bug"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "a1="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    iget v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    .line 52
    const-string v0, "Test_bug"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "a2="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 53
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
    .line 56
    const-string v0, "fix 123"

    iput-object v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->text:Ljava/lang/String;

    .line 58
    const-string v0, "Test_bug"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "text="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->text:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    new-instance v0, Lcom/zpj/hotfix/patch_dev/method/Test;

    invoke-direct {v0}, Lcom/zpj/hotfix/patch_dev/method/Test;-><init>()V

    iput-object v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->test:Lcom/zpj/hotfix/patch_dev/method/Test;

    .line 61
    iget-object v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->test:Lcom/zpj/hotfix/patch_dev/method/Test;

    const/4 v1, 0x0

    const-wide/high16 v2, 0x4059000000000000L    # 100.0

    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/zpj/hotfix/patch_dev/method/Test;->test4(ILjava/lang/Double;)V

    .line 62
    return-void
.end method

.method public test5()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 65
    iget v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    .line 66
    iget-wide v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->l:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->l:J

    .line 67
    return-void
.end method

.method public test6()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 70
    iget v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    .line 71
    iget-wide v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->l:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->l:J

    .line 72
    return-void
.end method

.method public test7()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 75
    iget v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    .line 76
    iget-wide v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->l:J

    const-wide/16 v2, 0x1

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->l:J

    .line 77
    return-void
.end method

.method public test8()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 80
    iget v1, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/zpj/hotfix/patch_dev/field/Test_bug;->a:I

    add-int/lit8 v0, v1, 0x64

    .line 81
    .local v0, "b":I
    return-void
.end method
