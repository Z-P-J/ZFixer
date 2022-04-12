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
.method public callBug()V
    .registers 11
    .annotation runtime Lcom/zpj/hotfix/annotation/Fix;
        method = "callBug"
        clazz = "com.zpj.hotfix.demo.BugClass"
    .end annotation

    iget-object v0, p0, Lcom/zpj/hotfix/demo/BugClass_Fix;->mBugObj:Lcom/zpj/hotfix/demo/BugClass;

    .local v0, "_thisBugObj":Lcom/zpj/hotfix/demo/BugClass;

    .line 37
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/BugClass_Fix;->_get_test()Lcom/zpj/hotfix/demo/TestClass;

    move-result-object v1


    invoke-static {v1}, Lcom/zpj/hotfix/demo/BugClass_Fix;->get_TestClass_Fix(Lcom/zpj/hotfix/demo/TestClass;)Lcom/zpj/hotfix/demo/TestClass_Fix;

    move-result-object v1

    invoke-virtual {v1}, Lcom/zpj/hotfix/demo/TestClass_Fix;->test()V

    .line 39
    const/4 v1, 0x1

    :try_start_0
    div-int/lit8 v1, v1, 0x0

    .line 40
    .local v1, "a":I
    const-string v2, "TestSdk"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "callBug a="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    nop

    .end local v1    # "a":I
    goto :goto_0

    .line 41
    :catch_0
    move-exception v1

    .line 42
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 44
    .end local v1    # "e":Ljava/lang/Exception;
    :goto_0
    invoke-direct {p0}, Lcom/zpj/hotfix/demo/BugClass_Fix;->_get_test()Lcom/zpj/hotfix/demo/TestClass;

    move-result-object v2


    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object v3, v0

    move-object v9, v0

    invoke-static {v2}, Lcom/zpj/hotfix/demo/BugClass_Fix;->get_TestClass_Fix(Lcom/zpj/hotfix/demo/TestClass;)Lcom/zpj/hotfix/demo/TestClass_Fix;

    move-result-object v2

    invoke-virtual/range {v2 .. v9}, Lcom/zpj/hotfix/demo/TestClass_Fix;->test(Lcom/zpj/hotfix/demo/BugClass;IIIIILcom/zpj/hotfix/demo/BugClass;)V

    .line 45
    return-void
.end method


.method private static get_TestClass_Fix(Lcom/zpj/hotfix/demo/TestClass;)Lcom/zpj/hotfix/demo/TestClass_Fix;

.registers 2

.param p0, "bugObj"    # Lcom/zpj/hotfix/demo/TestClass;

.annotation system Ldalvik/annotation/Throws;
	value = {
		Ljava/lang/Exception;
	}
.end annotation

.prologue

const-class v0, Lcom/zpj/hotfix/demo/TestClass_Fix;

invoke-static {p0, v0}, Lcom/zpj/hotfix/FixObjectManager;->get(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

move-result-object v0

check-cast v0, Lcom/zpj/hotfix/demo/TestClass_Fix;

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