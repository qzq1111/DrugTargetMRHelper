# 依赖包安装
install_dtmr_dep <- function() {
  # 普通包安装
  packages <-  c(
    "BiocManager",
    "httr",
    "jsonlite",
    "ggplot2",
    "data.table",
    "ggpubr",
    "forestplot",
    "metafor",
    "openxlsx",
    "rvest",
    "stringr",
    "survival",
    "survminer",
    "coloc",
    "cli"
  )

  for (i in 1:length(packages)) {
    if (!packages[i] %in% installed.packages()[, "Package"]) {
      install.packages(packages[i], dependencies = T, quiet = T)
    }
  }

  # bico包安装
  packages <- c("DESeq2", "TeachingDemos",
                "edgeR", "limma",
                "rtracklayer","GenomicRanges")

  for (i in 1:length(packages)) {
    if (!packages[i] %in% installed.packages()[, "Package"]) {
      BiocManager::install(packages[i], update = F, ask = F)
    }
  }

  # github包安装
  if (!"TwoSampleMR" %in% installed.packages()[, "Package"]) {
    devtools::install_github("MRCIEU/TwoSampleMR", quiet = T)
  }

  if (!"ieugwasr" %in% installed.packages()[, "Package"]) {
    devtools::install_github("mrcieu/ieugwasr", quiet = T)
  }

  if (!"gassocplot2" %in% installed.packages()[, "Package"]) {
    devtools::install_github("jrs95/gassocplot2", quiet = T)
  }
}


# 安装DrugTargetMR
install_dtmr_package <- function() {

  # 安装依赖
  install_dtmr_dep()

  tmp <- tempdir()

  os <-  stringr::str_to_lower(Sys.info()['sysname'])
  if (os == "windows") {
    url <- "http://r-package.qinzhiqiang.xyz/DrugTargetMR/DrugTargetMR.zip"
    name <- paste0(tmp,"/DrugTargetMR.zip")

  }else{
    url <- "http://r-package.qinzhiqiang.xyz/DrugTargetMR/DrugTargetMR.tar.gz"
    name <- paste0(tmp,"/DrugTargetMR.tar.gz")
  }


  if(file.exists(name)){
    file.remove(name)
  }

  options(timeout = 6000)
  download.file(url, name)

  # 安装DrugTargetMR
  if ("DrugTargetMR" %in% (.packages())) {
    tryCatch(detach("package:DrugTargetMR", unload = TRUE))
  }


  install.packages(name, repos = NULL)


  if("DrugTargetMR" %in% installed.packages()[,"Package"]){
    message("下载并安装成功")
  }else{
    message("下载失败")
    message("打开链接下载安装 ")
    message(url)
  }
}
