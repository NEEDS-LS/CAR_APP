#' Delimita a área de APP com vegetação nativa
#'
#' Essa função delimita a área de APP com vegetação nativa
#' @param a.veg Área delimitada pelo buffer referente ao tamanho da APP com os usos do solo.
#' @return a.veg.area Retorna o valor, em hectares, das áreas com vegetação dentro do buffer de entrada.
#' @export
#' @examples
#' areaVegetacao<-function(a.veg)


areaVegetacao<-function(a.veg){
  a.veg<-a.veg[a.veg@data$CLASSE_USO=="formação florestal" | 
                 a.veg@data$CLASSE_USO=="formação não florestal",]
  
  a.veg.merge<-mergePoli(a.veg)
  
  a.veg.area<-gArea(a.veg.merge)/10000
  return(a.veg.area)
}