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


# virtual methods
.method public add(II)I
    .registers 5
    .param p1, "a"    # I
    .param p2, "b"    # I
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        method = "add"
        clazz = "com.zpj.hotfix.demo.BugClass"
    .end annotation

    iget-object v0, p0, Lcom/zpj/hotfix/demo/BugClass_Fix;->mBugObj:Lcom/zpj/hotfix/demo/BugClass;

    .local v0, "_thisBugObj":Lcom/zpj/hotfix/demo/BugClass;

    .line 47
    const-string v0, "TestSdk"

    const-string v1, "fix testAdd"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 48
    add-int v0, p1, p2

    return v0
.end method

.method public callBug()V
    .registers 5
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        method = "callBug"
        clazz = "com.zpj.hotfix.demo.BugClass"
    .end annotation

    iget-object v0, p0, Lcom/zpj/hotfix/demo/BugClass_Fix;->mBugObj:Lcom/zpj/hotfix/demo/BugClass;

    .local v0, "_thisBugObj":Lcom/zpj/hotfix/demo/BugClass;

    .line 38
    const/4 v0, 0x1

    :try_start_0
    div-int/lit8 v0, v0, 0x0

    .line 39
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

    .line 42
    nop

    .end local v0    # "a":I
    goto :goto_0

    .line 40
    :catch_0
    move-exception v0

    .line 41
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 43
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-void
.end method

.method public getText()Ljava/lang/String;
    .registers 2
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        method = "getText"
        clazz = "com.zpj.hotfix.demo.BugClass"
    .end annotation

    iget-object v0, p0, Lcom/zpj/hotfix/demo/BugClass_Fix;->mBugObj:Lcom/zpj/hotfix/demo/BugClass;

    .local v0, "_thisBugObj":Lcom/zpj/hotfix/demo/BugClass;

    .line 32
    new-instance v0, Lcom/zpj/hotfix/demo/NewClass;

    invoke-direct {v0, p0}, Lcom/zpj/hotfix/demo/NewClass;-><init>(Lcom/zpj/hotfix/demo/BugClass;)V

    invoke-virtual {v0}, Lcom/zpj/hotfix/demo/NewClass;->test()V

    .line 33
    const-string v0, "fix--------------getText"

    return-object v0
.end method

.method public test1()V
    .registers 6
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        method = "test1"
        clazz = "com.zpj.hotfix.demo.BugClass"
    .end annotation

    iget-object v0, p0, Lcom/zpj/hotfix/demo/BugClass_Fix;->mBugObj:Lcom/zpj/hotfix/demo/BugClass;

    .local v0, "_thisBugObj":Lcom/zpj/hotfix/demo/BugClass;

    .line 20
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/BugClass_Fix;->_get_test()Lcom/zpj/hotfix/demo/TestClass;

    move-result-object v1


    const-string v2, "fix test1"

    invoke-virtual {v1, v2}, Lcom/zpj/hotfix/demo/TestClass;->test(Ljava/lang/String;)V

    .line 21
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/BugClass_Fix;->testPrivateMethod()V

    .line 22
    const/4 v1, 0x1

    invoke-static {v1}, Lcom/zpj/hotfix/demo/BugClass_Fix;->testStaticMethod(I)I

    move-result v1

    .line 23
    .local v1, "a":I
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/BugClass_Fix;->_get_context()Landroid/content/Context;

    move-result-object v2


    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "fix TestSdk a="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 24
    return-void
.end method

.method public test2(Ljava/lang/String;)V
    .registers 5
    .param p1, "text"    # Ljava/lang/String;
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        method = "test2"
        clazz = "com.zpj.hotfix.demo.BugClass"
    .end annotation

    iget-object v0, p0, Lcom/zpj/hotfix/demo/BugClass_Fix;->mBugObj:Lcom/zpj/hotfix/demo/BugClass;

    .local v0, "_thisBugObj":Lcom/zpj/hotfix/demo/BugClass;

    .line 27
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/BugClass_Fix;->_get_test()Lcom/zpj/hotfix/demo/TestClass;

    move-result-object v1


    const-string v2, "fix test2"

    invoke-virtual {v1, v2}, Lcom/zpj/hotfix/demo/TestClass;->test(Ljava/lang/String;)V

    .line 28
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/BugClass_Fix;->_get_context()Landroid/content/Context;

    move-result-object v1


    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-static {v1, p1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 29
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

.method private testPrivateMethod()V

.registers 3

.annotation system Ldalvik/annotation/Throws;
	value = {
		Ljava/lang/Exception;
	}
.end annotation

.prologue

iget-object v0, p0, Lcom/zpj/hotfix/demo/BugClass_Fix;->mBugObj:Lcom/zpj/hotfix/demo/BugClass;

const-string v1, "testPrivateMethod"

invoke-static {v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->invoke(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

return-void.end method

.method private static testStaticMethod(I)I

.registers 5

.param p0, "arg0"

.annotation system Ldalvik/annotation/Throws;
	value = {
		Ljava/lang/Exception;
	}
.end annotation

.prologue

const/4 v3, 0x0

const/4 v2, 0x1

new-array v0, v2, [Ljava/lang/Class;

sget-object v2, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

aput-object v2, v0, v3

.local v0, "arr1":[Ljava/lang/Class;

const/4 v2, 0x1

new-array v1, v2, [Ljava/lang/Object;

invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

move-result-object v2

aput-object v2, v1, v3

.local v1, "arr2":[Ljava/lang/Object; 

const-class v2, Lcom/zpj/hotfix/demo/BugClass;const-string v3, "testStaticMethod"

invoke-static {v2, v3, v0, v1}, Lcom/zpj/hotfix/utils/Reflect;->invokeStatic(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)Ljava/lang/Object;

move-result-object v0

check-cast v0, Ljava/lang/Integer;

invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

move-result v0

return v0

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