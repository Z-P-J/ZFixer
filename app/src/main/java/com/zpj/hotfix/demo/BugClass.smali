.class public Lcom/zpj/hotfix/demo/BugClass;
.super Ljava/lang/Object;
.source "BugClass.java"

# interfaces
.implements Lcom/zpj/hotfix/demo/MyInterface;


# static fields
.field private static final TAG:Ljava/lang/String; = "TestSdk"


# instance fields
.field private final context:Landroid/content/Context;

.field private final test:Lcom/zpj/hotfix/demo/TestClass;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Lcom/zpj/hotfix/demo/TestClass;

    invoke-direct {v0}, Lcom/zpj/hotfix/demo/TestClass;-><init>()V

    iput-object v0, p0, Lcom/zpj/hotfix/demo/BugClass;->test:Lcom/zpj/hotfix/demo/TestClass;

    .line 16
    iput-object p1, p0, Lcom/zpj/hotfix/demo/BugClass;->context:Landroid/content/Context;

    .line 17
    return-void
.end method

.method private self()Lcom/zpj/hotfix/demo/BugClass;
    .registers 1

    .prologue
    .line 43
    return-object p0
.end method

.method private testPrivateMethod()V
    .registers 9

    .prologue
    const/4 v1, 0x0

    .line 62
    const-string v0, "TestSdk"

    const-string v2, "fix testPrivateMethod"

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    invoke-virtual {p0}, Lcom/zpj/hotfix/demo/BugClass;->sayHello()V

    move-object v0, p0

    move v2, v1

    move v3, v1

    move v4, v1

    move v5, v1

    move v6, v1

    move-object v7, p0

    .line 64
    invoke-virtual/range {v0 .. v7}, Lcom/zpj/hotfix/demo/BugClass;->test(IIIIIILcom/zpj/hotfix/demo/BugClass;)V

    .line 65
    return-void
.end method

.method private static testStaticMethod(I)I
    .registers 3
    .param p0, "a"    # I

    .prologue
    .line 69
    const-string v0, "TestSdk"

    const-string v1, "fix testStaticMethod"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    add-int/lit16 v0, p0, 0x3e8

    return v0
.end method


# virtual methods
.method public add(II)I
    .registers 5
    .param p1, "a"    # I
    .param p2, "b"    # I

    .prologue
    .line 57
    const-string v0, "TestSdk"

    const-string v1, "fix testAdd"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    add-int v0, p1, p2

    return v0
.end method

.method public callBug()V
    .registers 6

    .prologue
    .line 48
    const/4 v2, 0x1

    :try_start_1
    div-int/lit8 v0, v2, 0x0

    .line 49
    .local v0, "a":I
    const-string v2, "TestSdk"

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
    :try_end_1b
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1b} :catch_1c

    .line 53
    .end local v0    # "a":I
    :goto_1b
    return-void

    .line 50
    :catch_1c
    move-exception v1

    .line 51
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1b
.end method

.method public getText()Ljava/lang/String;
    .registers 3

    .prologue
    .line 32
    new-instance v0, Lcom/zpj/hotfix/demo/NewClass;

    const-string v1, "text"

    invoke-direct {v0, p0, v1}, Lcom/zpj/hotfix/demo/NewClass;-><init>(Lcom/zpj/hotfix/demo/BugClass;Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/zpj/hotfix/demo/NewClass;->test()V

    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "fix--------------getText"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getText2()Ljava/lang/String;
    .registers 4

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/BugClass;->self()Lcom/zpj/hotfix/demo/BugClass;

    move-result-object v0

    .line 38
    .local v0, "self":Lcom/zpj/hotfix/demo/BugClass;
    new-instance v1, Lcom/zpj/hotfix/demo/NewClass;

    const-string v2, "text"

    invoke-direct {v1, v0, v2}, Lcom/zpj/hotfix/demo/NewClass;-><init>(Lcom/zpj/hotfix/demo/BugClass;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/zpj/hotfix/demo/NewClass;->test()V

    .line 39
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fix--------------getText"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public sayHello()V
    .registers 3

    .prologue
    .line 75
    const-string v0, "TestSdk"

    const-string v1, "sayHello"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    return-void
.end method

.method public test(IIIIIILcom/zpj/hotfix/demo/BugClass;)V
    .registers 16
    .param p1, "a"    # I
    .param p2, "b"    # I
    .param p3, "c"    # I
    .param p4, "d"    # I
    .param p5, "e"    # I
    .param p6, "f"    # I
    .param p7, "g"    # Lcom/zpj/hotfix/demo/BugClass;

    .prologue
    .line 80
    move-object v0, p0

    move-object v1, p0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move-object v7, p7

    invoke-virtual/range {v0 .. v7}, Lcom/zpj/hotfix/demo/BugClass;->test222(Lcom/zpj/hotfix/demo/BugClass;IIIIILcom/zpj/hotfix/demo/BugClass;)V

    .line 81
    return-void
.end method

.method public test1()V
    .registers 5

    .prologue
    .line 20
    iget-object v1, p0, Lcom/zpj/hotfix/demo/BugClass;->test:Lcom/zpj/hotfix/demo/TestClass;

    const-string v2, "fix test1"

    invoke-virtual {v1, v2}, Lcom/zpj/hotfix/demo/TestClass;->test(Ljava/lang/String;)V

    .line 21
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/BugClass;->testPrivateMethod()V

    .line 22
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/zpj/hotfix/demo/BugClass;->testStaticMethod(I)I

    move-result v0

    .line 23
    .local v0, "a":I
    iget-object v1, p0, Lcom/zpj/hotfix/demo/BugClass;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "fix TestSdk a="

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

    .line 24
    return-void
.end method

.method public test2(Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 27
    iget-object v0, p0, Lcom/zpj/hotfix/demo/BugClass;->test:Lcom/zpj/hotfix/demo/TestClass;

    const-string v1, "fix test2"

    invoke-virtual {v0, v1}, Lcom/zpj/hotfix/demo/TestClass;->test(Ljava/lang/String;)V

    .line 28
    iget-object v0, p0, Lcom/zpj/hotfix/demo/BugClass;->context:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 29
    return-void
.end method

.method public test222(Lcom/zpj/hotfix/demo/BugClass;IIIIILcom/zpj/hotfix/demo/BugClass;)V
    .registers 8
    .param p1, "a"    # Lcom/zpj/hotfix/demo/BugClass;
    .param p2, "b"    # I
    .param p3, "c"    # I
    .param p4, "d"    # I
    .param p5, "e"    # I
    .param p6, "f"    # I
    .param p7, "g"    # Lcom/zpj/hotfix/demo/BugClass;

    .prologue
    .line 85
    return-void
.end method
