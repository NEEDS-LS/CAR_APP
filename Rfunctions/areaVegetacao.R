#' Delimita a área de APP com vegetação nativa
#'
#' Essa função delimita a área de APP com vegetação nativa a partir do objeto resultante da aplicação das funções para recorte do uso dentro das APPs.
#' @param a.veg Área delimitada pelo buffer referente ao tamanho da APP com os usos do solo.
#' @return a.veg.area Retorna o valor, em hectares, das áreas com vegetação dentro do buffer de entrada.
#' @export
#' @examples
#' 
#' exemplo<-gMicro(mapa_MDA,mapa_RMS,mapa_RMD,mapa_NAS,micro,uso)
#' 
#' area<-areaVegetacao(exemplo)
#' 
#' #area = Valor em hectares da área coberta por vegetação nativa.


areaVegetacao<-function(a.veg){
  a.veg<-a.veg[a.veg$CLASSE_USO=="formação florestal" | 
                 a.veg$CLASSE_USO=="formação não florestal",]
  
  a.veg.merge<-mergePoli(a.veg)
  
  a.veg.area<-gArea(a.veg.merge)/10000
  return(a.veg.area)
}