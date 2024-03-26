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
    "cli",
    "cowplot",
    "ggrepel"
  )

  for (i in 1:length(packages)) {
    if (!packages[i] %in% installed.packages()[, "Package"]) {
      install.packages(packages[i], dependencies = T, quiet = T)
    }
  }

  # bico包安装
  packages <- c("DESeq2",
                "TeachingDemos",
                "edgeR",
                "limma",
                "rtracklayer",
                "GenomicRanges")

  for (i in 1:length(packages)) {
    if (!packages[i] %in% installed.packages()[, "Package"]) {
      BiocManager::install(packages[i], update = F, ask = F)
    }
  }

  # github包安装
  install_github_dep(pkg_name = "TwoSampleMR", github_pkg_name = "MRCIEU/TwoSampleMR")
  install_github_dep(pkg_name = "ieugwasr", github_pkg_name = "mrcieu/ieugwasr")
  install_github_dep(pkg_name = "gassocplot2", github_pkg_name = "jrs95/gassocplot2")
  install_github_dep(pkg_name = "ldscr", github_pkg_name = "mglev1n/ldscr")
}

# 安装github依赖包
install_github_dep <- function(pkg_name, github_pkg_name) {
  if (!pkg_name %in% installed.packages()[, "Package"]) {
    rsp <- try(devtools::install_github(github_pkg_name, quiet = T))
  }

  # 检查是否安装成功
  if (pkg_name %in% installed.packages()[, "Package"]) {
    return()
  }

  # 如果未安装成功，安装本地二进制包
  tmp <- tempdir()
  os <-  stringr::str_to_lower(Sys.info()['sysname'])
  # 根据不同系统安装不同包
  if (os == "windows") {
    url <-
      sprintf("http://r-package.qinzhiqiang.xyz/DrugTargetMR/dep/%s.zip",
              pkg_name)
    name <- paste0(tmp, sprintf("/%s.zip", pkg_name))

  } else{
    url <-
      sprintf("http://r-package.qinzhiqiang.xyz/DrugTargetMR/dep/%s.tar.gz",
              pkg_name)
    name <- paste0(tmp, sprintf("/%s.tar.gz", pkg_name))
  }
  # 删除已有文件
  if (file.exists(name)) {
    file.remove(name)
  }

  options(timeout = 6000)
  # 下载文件
  download.file(url, name)
  # 安装文件
  install.packages(name, repos = NULL)
}


# 安装DrugTargetMR
install_dtmr_package <- function() {
  # 安装依赖
  install_dtmr_dep()

  tmp <- tempdir()

  os <-  stringr::str_to_lower(Sys.info()['sysname'])
  if (os == "windows") {
    url <-
      "http://r-package.qinzhiqiang.xyz/DrugTargetMR/DrugTargetMR.zip"
    name <- paste0(tmp, "/DrugTargetMR.zip")

  } else{
    url <-
      "http://r-package.qinzhiqiang.xyz/DrugTargetMR/DrugTargetMR.tar.gz"
    name <- paste0(tmp, "/DrugTargetMR.tar.gz")
  }


  if (file.exists(name)) {
    file.remove(name)
  }

  options(timeout = 6000)
  download.file(url, name)

  # 安装DrugTargetMR
  if ("DrugTargetMR" %in% (.packages())) {
    tryCatch(detach("package:DrugTargetMR", unload = TRUE))
  }


  install.packages(name, repos = NULL)


  if ("DrugTargetMR" %in% installed.packages()[, "Package"]) {
    message("下载并安装成功")
  } else{
    message("下载失败")
    message("打开链接下载安装 ")
    message(url)
  }
}
