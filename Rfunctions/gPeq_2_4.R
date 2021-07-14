#' Função unifica a hidrográfia, cria os buffers e corta com o uso do solo.
#'
#' Essa função unifica a hidrografia e cria os buffer referentes as áreas a serem 
#' restauradas em propriedades pequenas entre dois e quatro módulos fiscais (15 metros em nascentes e 15 metros nas demais 
#' hidrográfias), retornando a intersecção deste buffer com o uso do solo
#' @param mapa_MDA Mapa da hidrográfia referente as Massas d'água.
#' @param mapa_RMS Mapa da hidrográfia referente aos Rios de margem simples.
#' @param mapa_RMD Mapa da hidrográfia referente aos Rios de margem dupla.
#' @param mapa_NAS Mapa da hidrográfia referente as Nascentes.
#' @param pequeno_2_4 Conjunto de propriedades caracterizadas como entre dois e quatro módulos fiscais, resultantes da função separaTamanho.
#' @param uso Mapa do uso do solo do local
#' @return Objeto SpatialPolygonsDataFrames referente ao uso do solo dentro do buffer criado
#' @export
#' @examples
#' gPeq_2_4<-function(mapa_MDA,mapa_RMS,mapa_RMD,mapa_NAS,pequeno_2_4,uso)
#' 

gPeq_2_4<-function(mapa_MDA,mapa_RMS,mapa_RMD,mapa_NAS,pequeno_1_2,uso){
  
  mapa_MDA<-mapa_MDA[mapa_MDA@data$AREA_HA > 1,]
  mapa_MDA<-gBuffer(mapa_MDA, byid=TRUE, width=0)
  mapa_NAS<-gBuffer(mapa_NAS, byid=TRUE, width = 15)
  
  if (!is.na(mapa_RMD)){
    mapa_hidro_pol<-gUnion(mapa_MDA, mapa_RMD)
  }else{
    mapa_hidro_pol<-mapa_MDA
  }
  mapa_hidro<-gUnion(mapa_hidro_pol, mapa_RMS)
  
  pequeno24_app_original<-gBuffer(mapa_hidro, byid=TRUE, width=15)
  pequeno24_app_original<-gUnion(pequeno24_app_original, nas_b)
  pequeno24_app_original<-gDifference(pequeno24_app_original, mapa_hidro_pol)
  
  pequeno24_app<-gIntersection(pequeno24_app_original, pequena_2_4)
  pequeno24_app<-gBuffer(pequeno24_app, byid=TRUE, width=0)
  pequeno24_app<-raster::intersect(mapa_USO, pequeno24_app)
  pequeno24_app<-pequeno24_app[pequeno24_app@data$CLASSE_USO!="água",]
  
  return(pequeno24_app)
}