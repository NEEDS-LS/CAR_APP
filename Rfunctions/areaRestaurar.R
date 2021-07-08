#' Delimita a área a ser restaurada
#'
#' Essa função delimita a área a ser restaurada
#' @param a.cons ????
#' @return a.cons.area ????
#' @export
#' @examples
#' areaRestaurar<-function(a.cons)


areaRestaurar<-function(a.cons){
  a.cons<-a.cons[a.cons@data$CLASSE_USO!="formação florestal" & 
                   a.cons@data$CLASSE_USO!="formação não florestal",]
  
  a.cons.merge<-mergePoli(a.cons)
  
  a.cons.area<-gArea(a.cons.merge)/10000
  return(a.cons.area)
}