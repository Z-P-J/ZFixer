.class public Lcom/zpj/hotfix/demo/NewClass;
.super Ljava/lang/Object;
.source "NewClass.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "NewClass"


# instance fields
.field private final bugClass:Lcom/zpj/hotfix/demo/BugClass;


# direct methods
.method public constructor <init>(Lcom/zpj/hotfix/demo/BugClass;)V
    .locals 0
    .param p1, "bugClass"    # Lcom/zpj/hotfix/demo/BugClass;

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    .line 13
    return-void
.end method


# virtual methods
.method public test()V
    .locals 2

    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "test----->bugClass="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "NewClass"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 17
    return-void
.end method