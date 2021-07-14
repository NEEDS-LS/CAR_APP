#' Função unifica a hidrográfia, cria os buffers e corta com o uso do solo.
#'
#' Essa função unifica a hidrografia e cria os buffer referentes as áreas a serem 
#' restauradas em propriedades de tamanho médio, entre quatro e dez módulos fiscais, 
#'(15 metros em nascentes, 20 metros nos rios de margem simples e 30 nas demais
#'hidrográfias), retornando a intersecção deste buffer com o uso do solo
#' @param mapa_MDA Mapa da hidrográfia referente as Massas d'água.
#' @param mapa_RMS Mapa da hidrográfia referente aos Rios de margem simples.
#' @param mapa_RMD Mapa da hidrográfia referente aos Rios de margem dupla.
#' @param mapa_NAS Mapa da hidrográfia referente as Nascentes.
#' @param media Conjunto de propriedades caracterizadas como média, resultantes da função separaTamanho.
#' @param uso Mapa do uso do solo do local
#' @return Objeto SpatialPolygonsDataFrames referente ao uso do solo dentro do buffer criado
#' @export
#' @examples
#' gMedia<-function(mapa_MDA,mapa_RMS,mapa_RMD,mapa_NAS,media,uso)
#' 

gMedia<-function(mapa_MDA,mapa_RMS,mapa_RMD,mapa_NAS,media,uso){
  
  mapa_MDA<-mapa_MDA[mapa_MDA@data$AREA_HA > 1,]
  mapa_MDA<-gBuffer(mapa_MDA, byid=TRUE, width=0)
  mapa_NAS<-gBuffer(mapa_NAS, byid=TRUE, width = 15)
  
  if (!is.na(mapa_RMD)){
    mapa_hidro_pol<-gUnion(mapa_MDA, mapa_RMD)
  }else{
    mapa_hidro_pol<-mapa_MDA
  }
  mapa_hidro<-gUnion(mapa_hidro_pol, mapa_RMS)
  
  media_poli<-gBuffer(mapa_hidro_pol, byid=TRUE, width=30)
  media_rios<-gBuffer(mapa_RMS, byid=TRUE, width=20)
  media_app_original<-gUnion(media_poli, media_rios)
  media_app_original<-gUnion(media_app_original, nas_b)
  media_app_original<-gDifference(media_app_original, mapa_hidro_pol)
  
  media_app<-gIntersection(media_app_original, media)
  media_app<-gBuffer(media_app, byid=TRUE, width=0)
  media_app<-raster::intersect(mapa_USO, media_app)
  media_app<-media_app[media_app@data$CLASSE_USO!="água",]
  
  return(media_app)
}