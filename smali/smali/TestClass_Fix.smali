.class public Lcom/zpj/hotfix/demo/TestClass_Fix;
.super Ljava/lang/Object;
.source "TestClass_Fix.java"

# instance fields
.field private final mBugObj:Lcom/zpj/hotfix/demo/TestClass;

# direct methods
.method public constructor <init>(Lcom/zpj/hotfix/demo/TestClass;)V
    .registers 2
    .param p1, "mBugObj"

    .prologue
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/zpj/hotfix/demo/TestClass_Fix;->mBugObj:Lcom/zpj/hotfix/demo/TestClass;

    return-void
.end method


# virtual methods
.method public test()V
    .registers 3

    .line 14
    const-string v0, "Test"

    const-string v1, "test added method!"

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 15
    return-void
.end method

.method public test(Lcom/zpj/hotfix/demo/BugClass;IIIIILcom/zpj/hotfix/demo/BugClass;)V
    .registers 10
    .param p1, "a"    # Lcom/zpj/hotfix/demo/BugClass;
    .param p2, "b"    # I
    .param p3, "c"    # I
    .param p4, "d"    # I
    .param p5, "e"    # I
    .param p6, "f"    # I
    .param p7, "bugClass"    # Lcom/zpj/hotfix/demo/BugClass;

    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "test bugClass="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, " text="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p7}, Lcom/zpj/hotfix/demo/BugClass;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Test"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    return-void
.end method