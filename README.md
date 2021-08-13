# CAR_APP v 0.0.1.9000: Calcula as Áreas de Preservação Permanente (APPs) Hídricas, as APPs que devem ser restauradas baseadas no tamanho das propriedades e as APPs protegidas.

Em construção!!!!

Link para o Wiki provisório no Google Docs: https://docs.google.com/document/d/1EQhcSTetLeN9m-Wg2VPWHpkp6hFaofIdgo6WmDVk0KA/edit?usp=sharing

## Table of contents
* [Introdução](#introdução)
* [Objetivos](#objetivos)
* [Requisitos](#requisitos)
* [Resultados](#resultados)
* [Aplicativo](#aplicativo)
* [Referências](#referências)

## Introdução

Com a promulgação da Lei de Proteção da Vegetação Nativa ([Lei No. 12.651, de 25 de maio de 2012](http://www.planalto.gov.br/ccivil_03/_ato2011-2014/2012/lei/l12651.htm), LPVN, ou Novo Código Florestal) em 2012, a delimitação das Áreas de Preservação Permanentes (APPs) que encontram-se degradadas, e desta maneira, são passíveis de serem restauradas, se tornou dependente do tamanho das propriedades (Número de módulos fiscais). Consequentemente, algumas informações adicionais são necessárias para a delimitação das áreas passíveis de serem restauradas, entre elas: o tamanho do módulo fiscal (varia de município para município) e o tamanho da propriedade.

Este pacote busca avaliar o passivo ambiental das APPs baseado nos seguintes conjuntos de dados disponíveis na internet:

- Cadastro Ambiental Rural (CAR), obtido através do [SiCAR](https://www.car.gov.br/)
- Uso do solo e área de APP dados da [FBDS](https://www.fbds.org.br/)
- Tamanho do modulo fiscal ([CAR](https://www.car.gov.br/))
- Mapeamento do uso e cobertura do solo ([FBDS](https://www.fbds.org.br/) ou [MapBiomas](https://mapbiomas.org/))
- Limites municipais 2020 ([IBGE](https://www.ibge.gov.br/))


## Objetivo

Calcular as áreas de preservação permanentes (APPs), as áreas de APPs conservadas e as áreas de APPs degradadas, e consequentemente que podem ser restauradas, baseadas no tamanho das propriedades rurais em módulos fiscais (SiCAR), no tamanho do módulo fiscal, e no uso e cobertura do solo ([MapBiomas](https://mapbiomas.org/) ou [FBDS](https://www.fbds.org.br/))

## Requisitos

As análises são realizadas no ambiente de programação R e se utiliza dos seguintes pacotes: rgdal, raster, rgeos, abjutils e sf.

## Resultados

Os resultados são apresentados em formato tabular e também na forma de mapas, mostrando as áreas de APP preservada, as áreas de APP à serem restauradas e as áreas onde não é possível a definição precisa da área de APP à ser restaurada, uma vez que os dados do CAR ou não estão disponíveis ou estão com inconsistências (ex. sobreposição entre propriedades de tamanhos diferentes).

## Aplicativo

De forma a facilitar o uso por gestores públicos e tomadores de decisão que não tenham experiência com o ambiente de programação **R** será desenvolvido um aplicativo que facilite a entrada das informações e a obtenção dos quantitativos e mapas relacionados. EM CONSTRUÇÃO!!!

## Referências

Incluir o capítulo In press.
