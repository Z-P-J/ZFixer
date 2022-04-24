
# instance fields
.field private final mSdk:Lcom/zpj/sdk/Test1;

# direct methods
.method public constructor <init>(Lcom/zpj/sdk/Test1;)V
    .registers 2
    .param p1, "mSdk"    # Lcom/zpj/sdk/Test1;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/zpj/sdk/Test;->mSdk:Lcom/zpj/sdk/Test1;

    .line 12
    return-void
.end method





# instance fields
.field private final context:Landroid/content/Context;

# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Lcom/zpj/sdk/Test;->context:Landroid/content/Context;

    .line 12
    return-void
.end method




# 构造方法模板
# instance fields
.field private final bug对象:Bug类;

# direct methods
.method public constructor <init>(Bug类;)V
    .registers 2
    .param p1, "bug对象 参数名"    # Lcom/zpj/sdk/Test1;

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    iput-object p1, p0, Fix修复类;->bug对象:Bug类;

    .line 12
    return-void
.end method