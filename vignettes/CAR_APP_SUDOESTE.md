---
title: "APPS SUDOESTE"
author: "NEEDS"
date: "05/2020"
output: 
  html_document:
     
    includes:
      after_body: footer.html
    keep_md: True
    toc: True
    toc_float:
      collapsed: false
      smooth_scroll: false
editor_options: 
  chunk_output_type: console
---



















![](CAR_APP_SUDOESTE_files/figure-html/unnamed-chunk-6-1.png)<!-- -->



























*Cenário 1*: Compreende a soma das áreas que precisam ser restauradas dentro das áreas conhecidas (áreas com CAR), dependendo do tamanho da propriedade (micro, pequena 1 a 2 módulos, pequena 2 a 4 módulos, média e grande). Dessa forma temos:

* Área para restaurar em micro propriedades: 52 ha do total de 85 ha existentes nesta classe.

* Área para restaurar em pequenas propriedades (1 a 2 módulos): 93 ha do total de 172 ha existentes nesta classe.

* Área para restaurar em pequenas propriedades (2 a 4 módulos): 179 ha do total de 333 ha existentes nesta classe.

* Área para restaurar em médias propriedades: 319 ha do total de 514 ha existentes nesta classe.

* Área para restaurar em grande propriedades: 1494 ha do total de 2649 ha existentes nesta classe.

Finalizando O total de área a ser recuperada no Cenário 1 é 2137 ha de 3752 ha

#######################################################################################################################################

*Cenário 2*: Compreende na soma das areas conhecidas (Cenário 1) com as áreas em branco (sem CAR), considerando que todas as propriedades ali existentes são micro (até 1 módulo). Tendo como resultado:

* Área para restauração existente quando consideramos como micro as áreas brancas: 128 ha de 247 ha totais

Dessa forma a área total a ser restaurada nesse Cenário é: 2265 ha de 3999 ha

#######################################################################################################################################

*Cenário 3*: Compreende na soma das areas conhecidas (Cenário 1) com as áreas em branco (sem CAR), considerando que todas as propriedades ali existentes são grandes (mais de 10 módulos). Tendo como resultado:

* Área para restauração existente quando consideramos como micro as áreas brancas: 754 ha de 1308 ha totais

Dessa forma a área total a ser restaurada nesse Cenário é: 2890 ha de 5060 ha

#######################################################################################################################################

*Cenário 4*: Compreende na quantidade de área a ser restaurada, dentro das áreas em branco do car, de acordo com as proporções de propriedades dentro do planalto e depressão. A correlação entre planalto e depressão é significativa, por isso foi selecionada como variavel para a modelagem de distribuição das propriedades nestas áreas.

*Proporção de micro propriedades: Através desta modelagem tem-se 8,88% em planalto e 3,65% em derpessão, gerando 11 ha e NA ha, respectivamente.

*Proporção de pequenas entre 1 e 2 módulos: Tem-se 9,8% em planalto e 5,14% em depressão, gerando 18 ha e NA ha, respectivamente.

*Proporção de pequenas entre 2 e 4 módulos: Tem-se 11,46% em planalto e 7,52% em depressão, gerando 36 ha e NA ha, respectivamente.

*Proporção de médias propriedades: Tem-se 14,36% em planalto e 14,26% em depressão, gerando 59 ha e NA ha, respectivamente.

*Proporção de grandes propriedades: Tem-se 55,5% em planalto e 69,42% em depressão, gerando 348 ha e NA ha, respectivamente.

Dessa forma o total de a ser restaurado neste cenário é a soma destas proporções com o cenário 1, ou seja, 472 ha mais os 2137 ha do cenário 1, totalizando 2608 ha.
