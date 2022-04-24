# 补丁生成研究之super调用

```smali
invoke-super {p0}, Lcom/zpj/hotfix/patch_dev/super_method/Base;->test()V
||
||
VV
invoke-direct {p0}, Lcom/zpj/hotfix/patch_dev/super_method/Test;->_super_test()V


invoke-super/range {p0 .. p5}, Lcom/zpj/hotfix/patch_dev/super_method/Base;->test(....)V
||
||
VV
invoke-direct/range {p0 .. p5}, Lcom/zpj/hotfix/patch_dev/super_method/Test;->_super_test(....)V
```

```smali
.method private 方法名(参数...n个args)返回值

    # 寄存器数 = 1（p0） + n（p1~pn） + 4（v0~v3） = n + 5
    # 参数中每有一个long或double，寄存器数加1
    int count = n + 5;
    for arg : args {
        if arg是long或double
            count++;
    }
    .registers count
    
    int index = 1;
    for (int i = 0; i < n; i++) {
        .param p[index], "arg[i]"   # 类型
        if args[i]是long或double:
            index++
        index++;
    }
        
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    const/16 v1, 0xn

    new-array v0, v1, [Ljava/lang/Object;
    
    int index = 1;
    for (int i = 0; i < n; i++) {
        const/4 v1, 0xi
        if args[i]是基本数据类型:
            # 以int为例
            if index > 11 {
                if 是long或double:
                    invoke-static/range {p[index] .. p[++index]}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                else
                    invoke-static/range {p[index] .. p[index]}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
            } else {
                if 是long或double:
                    invoke-static {p[index], p[++index]}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                else
                    invoke-static {p[index]}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
            }
                
            move-result-object v2
            aput-object v2, v0, v1
        else
            aput-object p[index], v0, v1
        index++
    }

    .local v0, "arr":[Ljava/lang/Object;
    
    iget-object v1, p0, 修复类->mOrigin:原始类

    const-string v2, "方法名"

    const-string v3, "方法签名"

    invoke-static {v1, v2, v3, v0}, Lcom/zpj/hotfix/utils/Reflect;->invokeSuperVoid(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    # 注入返回值Smali语法
    
.end method
```
