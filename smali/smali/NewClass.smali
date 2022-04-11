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

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    .line 18
    return-void
.end method


# virtual methods
.method public test()V
    .registers 19

    .line 21
    move-object/from16 v0, p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "test----->bugClass="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "NewClass"

    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    iget-object v10, v0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v3, v10

    invoke-static {v3}, Lcom/zpj/hotfix/demo/NewClass;->get_BugClass_Fix(Lcom/zpj/hotfix/demo/BugClass;)Lcom/zpj/hotfix/demo/BugClass_Fix;

    move-result-object v3

    invoke-virtual/range {v3 .. v10}, Lcom/zpj/hotfix/demo/BugClass_Fix;->test(IIIIIILcom/zpj/hotfix/demo/BugClass;)V

    .line 25
    iget-object v1, v0, Lcom/zpj/hotfix/demo/NewClass;->bugClass:Lcom/zpj/hotfix/demo/BugClass;

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    move-object v11, v1

    move-object/from16 v17, v1

    invoke-static/range {v11 .. v17}, Lcom/zpj/hotfix/demo/BugClass_Fix;->testNewStaticMethod(Lcom/zpj/hotfix/demo/BugClass;IIIIILcom/zpj/hotfix/demo/BugClass;)V

    .line 26
    return-void
.end method


.method private static test(Lcom/zpj/hotfix/demo/BugClass;)Lcom/zpj/hotfix/demo/BugClass_Fix;

.registers 2

.param p0, "bugObj"    # Lcom/zpj/hotfix/demo/BugClass;

.annotation system Ldalvik/annotation/Throws;
	value = {
		Ljava/lang/Exception;
	}
.end annotation

.prologue

const-class v0, Lcom/zpj/hotfix/demo/BugClass_Fix;

invoke-static {p0, v0}, Lcom/zpj/hotfix/FixObjectManager;->get(Ljava/lang/Object;Ljava/lang/Class;)Ljava/lang/Object;

move-result-object v0

check-cast v0, Lcom/zpj/hotfix/demo/BugClass_Fix;

return-object v0

.end method