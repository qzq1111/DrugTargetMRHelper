# DrugTargetMRHelper

## 安装方法

1. 安装DrugTargetMRHelper包

```
devtools::install_github("qzq1111/DrugTargetMRHelper")
```

2. 安装DrugTargetMR包

```
library(DrugTargetMRHelper)

DrugTargetMRHelper::install_dtmr()
```

3. 测试使用
```
library(DrugTargetMR)
# 加载包没有出现问题，使用下面的测试
# 如果出现错误，按照提示按照相关的包
DrugTargetMR::is_register()
# FALSE 表示未注册 
# TRUE 表示已注册
```
