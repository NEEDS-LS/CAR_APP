#' Delimita a área a ser restaurada
#'
#' Essa função delimita a área a ser restaurada a partir do objeto resultante da aplicação das funções para recorte do uso dentro das APPs
#' @param a.cons Área delimitada pelo buffer referente ao tamanho da APP com os usos do solo.
#' @return a.cons.area Retorna o valor, em hectares, a ser restaurado dentro do buffer de entrada.
#' @export
#' @examples
#' 
#' exemplo<-gMicro(mapa_MDA,mapa_RMS,mapa_RMD,mapa_NAS,micro,uso)
#' 
#' area<-areaRestaurar(exemplo)
#' 
#' #area = Valor em hectares a ser restaurado.


areaRestaurar<-function(a.cons){
  a.cons<-a.cons[a.cons@data$CLASSE_USO!="formação florestal" & 
                   a.cons@data$CLASSE_USO!="formação não florestal",]
  
  a.cons.merge<-mergePoli(a.cons)
  
  a.cons.area<-gArea(a.cons.merge)/10000
  return(a.cons.area)
}