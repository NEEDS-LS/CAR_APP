# CAR_APP: Calcula as Áreas de Preservação Permanente Hídricas baseadas no tamanho das propriedades

Em construção!!!!

Link para o Wiki provisório no Google Docs: https://docs.google.com/document/d/1EQhcSTetLeN9m-Wg2VPWHpkp6hFaofIdgo6WmDVk0KA/edit?usp=sharing

## Table of contents
* [Introdução](#introdução)
* [Objetivos](#objetivos)
* [Requisitos](#requisitos)
* 
## Introdução

Com a promulgação da Lei de Proteção da Vegetação Nativa (LPVN, ou Novo Código Florestal) em 2012, a delimitação das Áreas de Preservação Permanentes (APPs) que encontram-se degradadas, e desta maneira, são passíveis de serem restauradas, depende do tamanho das propriedades (Número de módulos fiscais). Consequentemente, algumas informações adicionais são necessárias para a delimitação das áreas passíveis de serem restauradas, entre elas: o tamanho do módulo fiscal (varia de município para município) e o tamanho da propriedade. 
Este pacote busca avaliar o passivo ambiental das APPs baseado nos seguintes conjuntos de dados:

- Cadastro Ambiental Rural (CAR), obtido através do [SiCAR](https://www.car.gov.br/)
- Hidrografia e área de APP baseado na restituição da [FBDS](https://www.fbds.org.br/)
- Tamanho do modulo fiscal (CAR)
- Mapeamento do uso e cobertura do solo ([FBDS](https://www.fbds.org.br/) ou [MapBiomas](https://mapbiomas.org/))
- Limites municipais ([IBGE](https://www.ibge.gov.br/))
- 

## Objetivo

Calcular as áreas de preservação permanentes (APPs), as áreas de APPs conservadas e as áreas de APPs degradadas, e consequentemente que podem ser restauradas baseadas no tamanho das propriedades rurais em módulos fiscais (SiCAR), no tamanho do módulo fiscal, e no uso e cobertura do solo (MapBiomas)

## Requisitos

As análises são realizadas no ambiente de programação R e se utiliza dos seguintes pacotes: rgdal, raster, rgeos e sf.

