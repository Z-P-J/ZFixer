.class public Lcom/zpj/hotfix/demo/BugClass_Fix;
.super Ljava/lang/Object;
.source "BugClass_Fix.java"

# instance fields
.field private final mBugObj:Lcom/zpj/hotfix/demo/BugClass;

# direct methods
.method public constructor <init>(Lcom/zpj/hotfix/demo/BugClass;)V
    .registers 2
    .param p1, "mBugObj"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/zpj/hotfix/demo/BugClass_Fix;->mBugObj:Lcom/zpj/hotfix/demo/BugClass;

    return-void
.end method


# direct methods
.method private self()Lcom/zpj/hotfix/demo/BugClass;
    .registers 2

    iget-object v0, p0, Lcom/zpj/hotfix/demo/BugClass_Fix;->mBugObj:Lcom/zpj/hotfix/demo/BugClass;

    .local v0, "_thisBugObj":Lcom/zpj/hotfix/demo/BugClass;

    .line 85
    return-object v0
.end method

.method public static testNewStaticMethod(Lcom/zpj/hotfix/demo/BugClass;IIIIILcom/zpj/hotfix/demo/BugClass;)V
    .registers 9
    .param p0, "a"    # Lcom/zpj/hotfix/demo/BugClass;
    .param p1, "b"    # I
    .param p2, "c"    # I
    .param p3, "d"    # I
    .param p4, "e"    # I
    .param p5, "f"    # I
    .param p6, "g"    # Lcom/zpj/hotfix/demo/BugClass;

    .line 119
    const-string v0, "TestSdk"

    const-string v1, "testNewStaticMethod"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    return-void
.end method

.method private testPrivateMethod()V
    .registers 12
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        method = "testPrivateMethod"
        clazz = "com.zpj.hotfix.demo.BugClass"
    .end annotation

    iget-object v0, p0, Lcom/zpj/hotfix/demo/BugClass_Fix;->mBugObj:Lcom/zpj/hotfix/demo/BugClass;

    .local v0, "_thisBugObj":Lcom/zpj/hotfix/demo/BugClass;

    .line 104
    const-string v1, "TestSdk"

    const-string v2, "fix testPrivateMethod"

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v3, v0

    move-object v10, v0

    move-object v3, p0

    invoke-virtual/range {v3 .. v10}, Lcom/zpj/hotfix/demo/BugClass_Fix;->test(IIIIIILcom/zpj/hotfix/demo/BugClass;)V

    .line 106
    return-void
.end method

.method private static testStaticMethod(I)I
    .registers 3
    .param p0, "a"    # I
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        clazz = "com.zpj.hotfix.demo.BugClass"
        method = "testStaticMethod"
    .end annotation

    .line 110
    const-string v0, "TestSdk"

    const-string v1, "fix testStaticMethod"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    add-int/lit16 v0, p0, 0x3e8

    return v0
.end method


# virtual methods
.method public add(II)I
    .registers 5
    .param p1, "a"    # I
    .param p2, "b"    # I
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        method = "add"
        clazz = "com.zpj.hotfix.demo.BugClass"
    .end annotation

    .line 99
    const-string v0, "TestSdk"

    const-string v1, "fix testAdd"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    add-int v0, p1, p2

    return v0
.end method

.method public callBug()V
    .registers 5
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        method = "callBug"
        clazz = "com.zpj.hotfix.demo.BugClass"
    .end annotation

    .line 90
    const/4 v0, 0x1

    :try_start_0
    div-int/lit8 v0, v0, 0x0

    .line 91
    .local v0, "a":I
    const-string v1, "TestSdk"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "callBug a="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    nop

    .end local v0    # "a":I
    goto :goto_0

    .line 92
    :catch_0
    move-exception v0

    .line 93
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 95
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public getText()Ljava/lang/String;
    .registers 4
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        method = "getText"
        clazz = "com.zpj.hotfix.demo.BugClass"
    .end annotation

    iget-object v0, p0, Lcom/zpj/hotfix/demo/BugClass_Fix;->mBugObj:Lcom/zpj/hotfix/demo/BugClass;

    .local v0, "_thisBugObj":Lcom/zpj/hotfix/demo/BugClass;

    .line 74
    new-instance v1, Lcom/zpj/hotfix/demo/NewClass;

    const-string v2, "text"

    invoke-direct {v1, v0, v2}, Lcom/zpj/hotfix/demo/NewClass;-><init>(Lcom/zpj/hotfix/demo/BugClass;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/zpj/hotfix/demo/NewClass;->test()V

    .line 75
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fix--------------getText"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getText2()Ljava/lang/String;
    .registers 4

    .line 79
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/BugClass_Fix;->self()Lcom/zpj/hotfix/demo/BugClass;

    move-result-object v0

    .line 80
    .local v0, "self":Lcom/zpj/hotfix/demo/BugClass;
    new-instance v1, Lcom/zpj/hotfix/demo/NewClass;

    const-string v2, "text"

    invoke-direct {v1, v0, v2}, Lcom/zpj/hotfix/demo/NewClass;-><init>(Lcom/zpj/hotfix/demo/BugClass;Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/zpj/hotfix/demo/NewClass;->test()V

    .line 81
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fix--------------getText"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
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

    iget-object v0, p0, Lcom/zpj/hotfix/demo/BugClass_Fix;->mBugObj:Lcom/zpj/hotfix/demo/BugClass;

    .local v0, "_thisBugObj":Lcom/zpj/hotfix/demo/BugClass;

    .line 115
    move-object v1, v0

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move-object v7, p7

    invoke-static/range {v1 .. v7}, Lcom/zpj/hotfix/demo/BugClass_Fix;->testNewStaticMethod(Lcom/zpj/hotfix/demo/BugClass;IIIIILcom/zpj/hotfix/demo/BugClass;)V

    .line 116
    return-void
.end method

.method public test1()V
    .registers 5
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        method = "test1"
        clazz = "com.zpj.hotfix.demo.BugClass"
    .end annotation

    .line 62
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/BugClass_Fix;->_get_test()Lcom/zpj/hotfix/demo/TestClass;

    move-result-object v0


    const-string v1, "fix test1"

    invoke-virtual {v0, v1}, Lcom/zpj/hotfix/demo/TestClass;->test(Ljava/lang/String;)V

    .line 63
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/BugClass_Fix;->testPrivateMethod()V

    .line 64
    const/4 v0, 0x1

    invoke-static {v0}, Lcom/zpj/hotfix/demo/BugClass_Fix;->testStaticMethod(I)I

    move-result v0

    .line 65
    .local v0, "a":I
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/BugClass_Fix;->_get_context()Landroid/content/Context;

    move-result-object v1


    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "fix TestSdk a="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 66
    return-void
.end method

.method public test2(Ljava/lang/String;)V
    .registers 4
    .param p1, "text"    # Ljava/lang/String;
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        method = "test2"
        clazz = "com.zpj.hotfix.demo.BugClass"
    .end annotation

    .line 69
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/BugClass_Fix;->_get_test()Lcom/zpj/hotfix/demo/TestClass;

    move-result-object v0


    const-string v1, "fix test2"

    invoke-virtual {v0, v1}, Lcom/zpj/hotfix/demo/TestClass;->test(Ljava/lang/String;)V

    .line 70
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/BugClass_Fix;->_get_context()Landroid/content/Context;

    move-result-object v0


    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 71
    return-void
.end method


.method private _get_context()Landroid/content/Context;

.registers 3

.annotation system Ldalvik/annotation/Throws;
	value = {
		Ljava/lang/Exception;
	}
.end annotation

.prologue

iget-object v0, p0, Lcom/zpj/hotfix/demo/BugClass_Fix;->mBugObj:Lcom/zpj/hotfix/demo/BugClass;

const-string v1, "context"

invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

move-result-object v0

check-cast v0, Landroid/content/Context;

return-object v0

.end method

.method private _get_test()Lcom/zpj/hotfix/demo/TestClass;

.registers 3

.annotation system Ldalvik/annotation/Throws;
	value = {
		Ljava/lang/Exception;
	}
.end annotation

.prologue

iget-object v0, p0, Lcom/zpj/hotfix/demo/BugClass_Fix;->mBugObj:Lcom/zpj/hotfix/demo/BugClass;

const-string v1, "test"

invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->getField(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

move-result-object v0

check-cast v0, Lcom/zpj/hotfix/demo/TestClass;

return-object v0

.end method