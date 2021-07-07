# createRepo v 0.0.001
#
# This is a function that creates a standard repository for my projects
#
#
#   by Alexandre Camargo Martensen - 07 Oct 2019
#
#   www.needs.ufscar.br
#


createRepo<-function(nome){
  #dir.create(nome)
  #setwd(paste("./", nome, sep=""))
  dir.create("data")
  dir.create("data_use")
  dir.create("scripts")
  dir.create("figs")
  dir.create("outputs")
  dir.create("docs")
  dir.create("Rfunctions")
  dir.create("vignettes")
  fileConn<-file("README.txt")
  writeLines(paste("README", nome, sep="_"), fileConn)
  close(fileConn)
}
