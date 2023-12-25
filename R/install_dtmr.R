#' 安装DrugTargetMR
#'
#' @export
#'
#' @examples install_dtmr()
install_dtmr <- function() {

  # 安装依赖
  install_dep()

  # 安装DrugTargetMR
  if ("DrugTargetMR" %in% (.packages())) {
    tryCatch(detach("package:DrugTargetMR", unload = TRUE))
  }

  os <-  stringr::str_to_lower(Sys.info()['sysname'])
  if (os == "windows") {
    url <- "http://r-package.qinzhiqiang.xyz/DrugTargetMR/DrugTargetMR.zip"
    name <- "DrugTargetMR.zip"

  }else{
    url <- "http://r-package.qinzhiqiang.xyz/DrugTargetMR/DrugTargetMR.tar.gz"
    name <- "DrugTargetMR.tar.gz"
  }


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
