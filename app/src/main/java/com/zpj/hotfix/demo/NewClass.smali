.class public Lcom/zpj/hotfix/demo/NewClass;
.super Ljava/lang/Object;
.source "NewClass.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "NewClass"


# instance fields
.field private final bugClass:Lcom/zpj/hotfix/demo/BugClass;


# direct methods
.method public constructor <init>(Lcom/zpj/hotfix/demo/BugClass;Ljava/lang/String;)V
    .registers 3
    .param p1, "bugClass"    # Lcom/zpj/hotfix/demo/BugClass;
    .param p2, "text"    # Ljava/lang/String;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    .line 18
    return-void
.end method


# virtual methods
.method public getBugClass()Lcom/zpj/hotfix/demo/BugClass;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 37
    iget-object v0, p0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    const-class v1, Lcom/zpj/hotfix/demo/BugClass;

    invoke-static {v0, v1}, Lcom/zpj/hotfix/FixObjectManager;->get(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/zpj/hotfix/demo/BugClass;

    return-object v0
.end method

.method public test()V
    .registers 9

    .prologue
    const/4 v1, 0x0

    .line 21
    const-string v0, "NewClass"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "test----->bugClass="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    iget-object v0, p0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    iget-object v7, p0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    move v2, v1

    move v3, v1

    move v4, v1

    move v5, v1

    move v6, v1

    invoke-virtual/range {v0 .. v7}, Lcom/zpj/hotfix/demo/BugClass;->test(IIIIIILcom/zpj/hotfix/demo/BugClass;)V

    .line 25
    iget-object v0, p0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    iget-object v6, p0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    move v2, v1

    move v3, v1

    move v4, v1

    move v5, v1

    invoke-static/range {v0 .. v6}, Lcom/zpj/hotfix/demo/BugClass;->testNewStaticMethod(Lcom/zpj/hotfix/demo/BugClass;IIIIILcom/zpj/hotfix/demo/BugClass;)V

    .line 26
    return-void
.end method

.method public test1()V
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v1, 0x0

    .line 29
    const-string v0, "NewClass"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "test----->bugClass="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    invoke-virtual {p0}, Lcom/zpj/hotfix/demo/NewClass;->getBugClass()Lcom/zpj/hotfix/demo/BugClass;

    move-result-object v0

    iget-object v7, p0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    move v2, v1

    move v3, v1

    move v4, v1

    move v5, v1

    move v6, v1

    invoke-virtual/range {v0 .. v7}, Lcom/zpj/hotfix/demo/BugClass;->test(IIIIIILcom/zpj/hotfix/demo/BugClass;)V

    .line 33
    iget-object v0, p0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    iget-object v6, p0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    move v2, v1

    move v3, v1

    move v4, v1

    move v5, v1

    invoke-static/range {v0 .. v6}, Lcom/zpj/hotfix/demo/BugClass;->testNewStaticMethod(Lcom/zpj/hotfix/demo/BugClass;IIIIILcom/zpj/hotfix/demo/BugClass;)V

    .line 34
    return-void
.end method
