# DrugTargetMRHelper

## 安装方法

1. 安装DrugTargetMRHelper包

```
install.packages("devtools")

tryCatch(detach("package:DrugTargetMRHelper", unload = TRUE))

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
# 如果出现错误，按照提示安装相关的包
DrugTargetMR::is_register()
# FALSE 表示未注册 
# TRUE 表示已注册
# 工作人员提供注册码，注册包
DrugTargetMR::register("注册码")
```

## 微信公众号

关注微信公众号：`秦吕的旅行日记`

![微信公众号](./img/qinlv2013.png)
