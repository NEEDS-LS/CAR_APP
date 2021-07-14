#' Função unifica a hidrográfia, cria os buffers e corta com o uso do solo.
#'
#' Essa função unifica a hidrografia e cria os buffer referentes as áreas a serem 
#' restauradas em propriedades de tamanho grande, maiores que dez módulos fiscais, 
#'(15 metros em nascentes e 30 nas demais hidrográfias), retornando a intersecção 
#'deste buffer com o uso do solo
#' @param mapa_MDA Mapa da hidrográfia referente as Massas d'água.
#' @param mapa_RMS Mapa da hidrográfia referente aos Rios de margem simples.
#' @param mapa_RMD Mapa da hidrográfia referente aos Rios de margem dupla.
#' @param mapa_NAS Mapa da hidrográfia referente as Nascentes.
#' @param grande Conjunto de propriedades caracterizadas como média, resultantes da função separaTamanho.
#' @param uso Mapa do uso do solo do local
#' @return Objeto SpatialPolygonsDataFrames referente ao uso do solo dentro do buffer criado
#' @export
#' @examples
#' gGrande<-function(mapa_MDA,mapa_RMS,mapa_RMD,mapa_NAS,media,uso)
#' 

gGrande<-function(mapa_MDA,mapa_RMS,mapa_RMD,mapa_NAS,grande,uso){
  
  mapa_MDA<-mapa_MDA[mapa_MDA@data$AREA_HA > 1,]
  mapa_MDA<-gBuffer(mapa_MDA, byid=TRUE, width=0)
  mapa_NAS<-gBuffer(mapa_NAS, byid=TRUE, width = 15)
  
  if (!is.na(mapa_RMD)){
    mapa_hidro_pol<-gUnion(mapa_MDA, mapa_RMD)
  }else{
    mapa_hidro_pol<-mapa_MDA
  }
  mapa_hidro<-gUnion(mapa_hidro_pol, mapa_RMS)
  
  grande_app_original<-gBuffer(mapa_hidro, byid=TRUE, width=30)
  grande_app_original<-gUnion(grande_app_original, nas_b)
  grande_app_original<-gDifference(grande_app_original, mapa_hidro_pol)
  
  grande_app<-gIntersection(grande_app_original, grande)
  grande_app<-gBuffer(grande_app, byid=TRUE, width=0)
  grande_app<-raster::intersect(mapa_USO, grande_app)
  grande_app<-grande_app[grande_app@data$CLASSE_USO!="água",]
  
  return(grande_app)
}