#' Função unifica a hidrográfia, cria os buffers e corta com o uso do solo.
#'
#' Essa função unifica a hidrografia e cria os buffer referentes as áreas a serem 
#' restauradas em micro propriedades (15 metros em nascentes e 5 metros nas demais 
#' hidrográfias), retornando a intersecção deste buffer com o uso do solo
#' @param mapa_MDA Mapa da hidrográfia referente as Massas d'água.
#' @param mapa_RMS Mapa da hidrográfia referente aos Rios de margem simples.
#' @param mapa_RMD Mapa da hidrográfia referente aos Rios de margem dupla.
#' @param mapa_NAS Mapa da hidrográfia referente as Nascentes.
#' @param micro Conjunto de propriedades caracterizadas como micro, resultantes da função separaTamanho.
#' @param uso Mapa do uso do solo do local
#' @return Objeto SpatialPolygonsDataFrames referente ao uso do solo dentro do buffer criado
#' @export
#' @examples
#' gHidro<-function(mapa_MDA,mapa_RMS,mapa_RMD,mapa_NAS,micro,uso)
#' 

gMicro<-function(mapa_MDA,mapa_RMS,mapa_RMD,mapa_NAS,micro,uso){
  
  mapa_MDA<-mapa_MDA[mapa_MDA@data$AREA_HA > 1,]
  mapa_MDA<-gBuffer(mapa_MDA, byid=TRUE, width=0)
  nas_b<-gBuffer(mapa_NAS, byid=TRUE, width = 15)
  
  mapa_hidro_pol<-gUnion(mapa_MDA, mapa_RMD)
  mapa_hidro<-gUnion(mapa_hidro_pol, mapa_RMS)
  
  micro_app_original<-gBuffer(mapa_hidro, byid=TRUE, width=5)
  micro_app_original<-gUnion(micro_app_original, nas_b)
  micro_app_original<-gDifference(micro_app_original, mapa_hidro_pol)
  
  micro_app<-gIntersection(micro_app_original, micro)
  micro_app<-gBuffer(micro_app, byid=TRUE, width=0)
  micro_app<-raster::intersect(uso, micro_app)
  micro_app<-micro_app[micro_app@data$CLASSE_USO!="água",]
  
  return(micro_app)
}