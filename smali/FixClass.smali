.class public Lcom/zpj/hotfix/demo/FixClass;
.super Ljava/lang/Object;
.source "FixClass.java"


# annotations
.annotation runtime Lcom/zpj/hotfix/annotation/FixClass;
    name = "com.zpj.hotfix.demo.BugClass"
.end annotation


# instance fields
.field private final bugClass:Lcom/zpj/hotfix/demo/BugClass;


# direct methods
.method public constructor <init>(Lcom/zpj/hotfix/demo/BugClass;)V
    .registers 2
    .param p1, "bugClass"    # Lcom/zpj/hotfix/demo/BugClass;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    iput-object p1, p0, Lcom/zpj/hotfix/demo/FixClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    .line 17
    return-void
.end method

.method private getContext()Landroid/content/Context;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v0, p0, Lcom/zpj/hotfix/demo/FixClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    const-string v1, "context"

    invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

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
    .line 77
    const-class v0, Lcom/zpj/hotfix/demo/BugClass;

    const-string v1, "TAG"

    invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getStaticField(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method private getTest()Lcom/zpj/hotfix/demo/TestClass;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 69
    iget-object v0, p0, Lcom/zpj/hotfix/demo/FixClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    const-string v1, "test"

    invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/zpj/hotfix/demo/TestClass;

    return-object v0
.end method

.method private testPrivateMethod()V
    .registers 3
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        clazz = "com.zpj.hotfix.demo.BugClass"
        method = "testPrivateMethod"
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 55
    invoke-static {}, Lcom/zpj/hotfix/demo/FixClass;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v1, "fix testPrivateMethod"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    return-void
.end method

.method private static testStaticMethod(I)I
    .registers 3
    .param p0, "a"    # I
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        clazz = "com.zpj.hotfix.demo.BugClass"
        method = "testStaticMethod"
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 60
    invoke-static {}, Lcom/zpj/hotfix/demo/FixClass;->getTag()Ljava/lang/String;

    move-result-object v0

    const-string v1, "fix testStaticMethod"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    add-int/lit16 v0, p0, 0x3e8

    return v0
.end method


# virtual methods
.method public add(II)I
    .registers 4
    .param p1, "a"    # I
    .param p2, "b"    # I
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        clazz = "com.zpj.hotfix.demo.BugClass"
        method = "add"
    .end annotation

    .prologue
    .line 50
    add-int v0, p1, p2

    return v0
.end method

.method public callBug()V
    .registers 6
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        clazz = "com.zpj.hotfix.demo.BugClass"
        method = "callBug"
    .end annotation

    .prologue
    .line 41
    const/4 v2, 0x1

    :try_start_1
    div-int/lit8 v0, v2, 0x0

    .line 42
    .local v0, "a":I
    invoke-static {}, Lcom/zpj/hotfix/demo/FixClass;->getTag()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "callBug a="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1d} :catch_1e

    .line 46
    .end local v0    # "a":I
    :goto_1d
    return-void

    .line 43
    :catch_1e
    move-exception v1

    .line 44
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1d
.end method

.method public getText()Ljava/lang/String;
    .registers 2
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        clazz = "com.zpj.hotfix.demo.BugClass"
        method = "getText"
    .end annotation

    .prologue
    .line 35
    const-string v0, "getText11111111111111"

    return-object v0
.end method

.method public test1()V
    .registers 5
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        clazz = "com.zpj.hotfix.demo.BugClass"
        method = "test1"
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 21
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/FixClass;->getTest()Lcom/zpj/hotfix/demo/TestClass;

    move-result-object v1

    const-string v2, "test1"

    invoke-virtual {v1, v2}, Lcom/zpj/hotfix/demo/TestClass;->test(Ljava/lang/String;)V

    .line 22
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/FixClass;->testPrivateMethod()V

    .line 23
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/zpj/hotfix/demo/FixClass;->testStaticMethod(I)I

    move-result v0

    .line 24
    .local v0, "a":I
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/FixClass;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "TestSdk a="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 25
    return-void
.end method

.method public test2(Ljava/lang/String;)V
    .registers 5
    .param p1, "text"    # Ljava/lang/String;
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        clazz = "com.zpj.hotfix.demo.BugClass"
        method = "gettest2Text"
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/FixClass;->getTest()Lcom/zpj/hotfix/demo/TestClass;

    move-result-object v0

    const-string v1, "test2"

    invoke-virtual {v0, v1}, Lcom/zpj/hotfix/demo/TestClass;->test(Ljava/lang/String;)V

    .line 30
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/FixClass;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fix --------- "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 31
    return-void
.end method
