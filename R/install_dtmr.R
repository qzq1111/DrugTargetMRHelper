#' 安装DrugTargetMR
#'
#' @export
#'
#' @examples install_dtmr()
install_dtmr <- function() {
  # 普通包安装
  packages <- c("usethis", "devtools", "remotes","BiocManager", "httr", "jsonlite",
                "ggplot2", "data.table", "ggpubr","forestplot","metafor","openxlsx",
                "rvest","stringr","survival","survmine")

  for (i in 1:length(packages)) {
    if (!packages[i] %in% installed.packages()[,"Package"]) {
      install.packages(packages[i], dependencies = T, quiet = T )
    }
  }

  # 安装慢解决
  options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor")
  # bico包安装
  packages<-c("BSgenome","DESeq2","GEOquery",
              "GenomicRanges","MungeSumstats","RColorBrewer",
              "TeachingDemos","clusterProfiler",
              "edgeR","limma","survminer"
              )

  for (i in 1:length(packages)) {
    if (!packages[i] %in% installed.packages()[,"Package"]) {
      BiocManager::install(packages[i], update = F, ask = F)
    }
  }

  # github包安装
  if (!"TwoSampleMR" %in% installed.packages()[,"Package"]) {
    devtools::install_github("MRCIEU/TwoSampleMR", quiet=T)
  }

  if (!"plinkbinr" %in% installed.packages()[,"Package"]) {
    devtools::install_github("explodecomputer/plinkbinr", quiet=T)
  }

  # 安装DrugTargetMR
  if ("DrugTargetMR" %in% (.packages())) {
    tryCatch(detach("package:DrugTargetMR", unload = TRUE))
  }

  url <- "http://r-package.qinzhiqiang.xyz/DrugTargetMR/DrugTargetMR.zip"
  name <- "DrugTargetMR.zip"

  if(file.exists(name)){
    file.remove(name)
  }

  options(timeout = 6000)
  download.file(url, name)
  install.packages(name, repos = NULL)

  if("DrugTargetMR" %in% installed.packages()[,"Package"]){
    message("下载并安装成功")
  }else{
    message("下载失败")
    message("打开链接下载安装 ")
    message(url)
  }
}
