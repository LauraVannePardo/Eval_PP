*==============================================================================*
*				 		EVALUACION POLITICA PUBICA   2024-2					   *
*							TALLER 2 DO file								   *
* 	POR: Laura Pardo, José E González, Julián Pulido  Luis Castellanos   	   *
* 							8 de Septiembre  DE 2024						   *
* 							 	STATA 18.0									   *  
*==============================================================================*

cls
clear all
cap log close
set more off
*________________________________________________________________________________
*Establecemos un directorio de trabajo

*cd "/Users/User/Library/CloudStorage/OneDrive-Universidaddelosandes/2024-2 Evaluación de Políticas Públicas/Talleres/Taller 2"

cd "C:\Users\Heitz\Desktop\Evaluación de Impacto  EGOB\Taller 2"

*Rellenar directorio de trabajo para revisión
*cd ""

log using "taller2.log", replace /*Empezar el log file*/

use "VIF_ENDS2010.dta", clear

*_______________________________________________________________________________
**************************		PUNTO 1			*********************************
*________________________________________________________________________________


*----- A. Creamos un proceso automático (loop) que recodifique las variables ------


* Crear una lista de variables originales, nuevas y sus respectivas etiquetas



*_______________________________________________________________________________
**************************		PUNTO 1			*********************************
*________________________________________________________________________________


*----- A. Creamos un proceso automático (loop) que recodifique las variables ------

{
* Crear una lista de variables originales, nuevas y sus respectivas etiquetas
local original1 Q1103AA
local original2 Q1103BA
local original3 Q1103DA
local original4 Q1103EA
local original5 Q1103FA
local original6 Q1103GA
local original7 Q1103HA
local original8 Q1103IA
local original9 Q1106AA
local original10 Q1106BA
local original11 Q1106CA
local original12 Q1107CA
local original13 Q1107FA
local original14 Q1107IA
local original15 Q1122
*Variables de prueba para el alpha
local original16  Q1103BB



local nueva1 algunaVezCeloso
local nueva2 algunaAcusaInfiel
local nueva3 limitaFamilia
local nueva4 saberDondeEsta
local nueva5 vigilaGastoDinero
local nueva6 ignorado
local nueva7 ellaEnreunionesSociales
local nueva8 consultaDecisionesI
local nueva9 amenazaAbandonarla
local nueva10 amenazaQuitarleNinos
local nueva11 amenazaQuitarApoyoEcon
local nueva12 algunaVezGolpeado
local nueva13 algunaVezAmenazoArma
local nueva14 algunaVezHaViolado
local nueva15 esposoConsumeSustancias 
local nueva16 ultimoAnoAcusaInfiel

local etiqueta1 "Alguna vez se ha puesto celoso si habla con otro hombre: Sí=1, No=0"
local etiqueta2 "Alguna vez la ha acusado de serle infiel: Sí=1, No=0"
local etiqueta3 "Alguna vez ha tratado de limitarle el trato con la familia: Sí=1, No=0"
local etiqueta4 "Alguna vez ha insistido en saber dónde está todo el tiempo (Si=1 y No=0)"
local etiqueta5 "Alguna vez le ha vigilado cómo gasta el dinero (Si=1 y No=0)"
local etiqueta6 "Alguna vez la ha ignorado (Si=1 y No=0)"

local etiqueta7 "Alguna vez no ha contado con ella para reuniones sociales (Si=1 y No=0)"
local etiqueta8 "Alguna vez no le ha consultado decisiones importantes (Si=1 y No=0) (Si=1 y No=0)"
local etiqueta9 "Alguna vez la ha amenazado con abandonarla (Si=1 y No=0)"
local etiqueta10 "Alguna vez la ha amenazado con quitarle los niños (Si=1 y No=0)"
local etiqueta11"Alguna vez la ha amenazado con quitarle apoyo económico (Si=1 y No=0)"
local etiqueta12"Alguna vez la ha golpeado con un objeto (Si=1 y No=0)"
local etiqueta13 "Alguna vez la ha amenazado con una arma (Si=1 y No=0"
local etiqueta14 "Alguna vez la ha violado (Si=1 y No=0)"
local etiqueta15 "Esposo/compañero consume (consumía) sustancias sicoactivas (Si=1 y No=0)"
local etiqueta16 "En el último año la ha acusado de serle infiel (Si=1 y No=0)"




**# Bookmark #4
* Bucle para realizar las operaciones en cada par de variables
forval i = 1/16 {
    * Tabular la variable original
    tab `original`i'', m 

    * Crear la nueva variable como copia de la original
    gen `nueva`i'' = `original`i''

    * Tabular la nueva variable excluyendo missings
    tab `nueva`i'', m

    * Codificar correctamente Sí=1 y No=0
    replace `nueva`i'' = 1 if `nueva`i'' == 1
    replace `nueva`i'' = 0 if `nueva`i'' == 2

    * Modificar la etiqueta para que se entienda la codificación
    label variable `nueva`i'' "`etiqueta`i''"

}

*Corremos un tab para verificar que quedaran con los mismos datos, pero renombradas
*y bien recodificadas

tab Q1103AA, m
tab Q1103BA, m
tab Q1103DA, m
tab Q1103EA, m
tab Q1103FA, m
tab Q1103GA, m
tab Q1103HA, m
tab Q1103IA, m
tab Q1106AA, m
tab Q1106BA, m
tab Q1106CA, m
tab Q1107CA, m
tab Q1107FA, m
tab Q1107IA, m

tab Q1122, m
tab Q1103BB, m

tab algunaVezCeloso, m
tab algunaAcusaInfiel, m
tab limitaFamilia, m
tab saberDondeEsta, m
tab vigilaGastoDinero, m
tab ignorado, m	
tab ellaEnreunionesSociales, m
tab consultaDecisionesI, m
tab amenazaAbandonarla, m
tab amenazaQuitarleNinos, m
tab amenazaQuitarApoyoEcon, m
tab algunaVezGolpeado, m
tab algunaVezAmenazoArma, m
tab algunaVezHaViolado, 
tab esposoConsumeSustancias ,m
tab ultimoAnoAcusaInfiel, m

}



*--------A. Estadisticas descriptivas de las variables creadas------------------




asdoc tab algunaVezCeloso, m  save(tabularNuevasVariables.doc) replace 
asdoc tab algunaAcusaInfiel, m save(tabularNuevasVariables.doc) append
asdoc tab limitaFamilia, m save(tabularNuevasVariables.doc) append
asdoc tab saberDondeEsta, m save(tabularNuevasVariables.doc) append
asdoc tab vigilaGastoDinero, m save(tabularNuevasVariables.doc) append
asdoc tab ignorado, m	save(tabularNuevasVariables.doc) append
asdoc tab ellaEnreunionesSociales, m save(tabularNuevasVariables.doc) append
asdoc tab consultaDecisionesI, m save(tabularNuevasVariables.doc) append
asdoc tab amenazaAbandonarla, m save(tabularNuevasVariables.doc) append
asdoc tab amenazaQuitarleNinos, m save(tabularNuevasVariables.doc) append
asdoc tab amenazaQuitarApoyoEcon, m save(tabularNuevasVariables.doc) append
asdoc tab algunaVezGolpeado, m save(tabularNuevasVariables.doc) append
asdoc tab algunaVezAmenazoArma, m save(tabularNuevasVariables.doc) append
asdoc tab algunaVezHaViolado,  m save(tabularNuevasVariables.doc) append
asdoc tab esposoConsumeSustancias ,m save(tabularNuevasVariables.doc) append
asdoc tab ultimoAnoAcusaInfiel, m save(tabularNuevasVariables.doc) append

*Corremos unas correlaciones para analizar mecanismos interesantes entre estas variables
asdoc correlate   algunaVezCeloso algunaAcusaInfiel limitaFamilia saberDondeEsta vigilaGastoDinero ignorado ellaEnreunionesSociales consultaDecisionesI  amenazaAbandonarla amenazaQuitarleNinos amenazaQuitarApoyoEcon , save(CorrelacionesCool.doc) replace 

*Corremos unas correlaciones para analizar mecanismos interesantes entre estas variables
asdoc correlate esposoConsumeSustancias  algunaVezGolpeado algunaVezAmenazoArma algunaVezHaViolado  , save(CorrelacionesCool2.doc) replace 



*----------------C. Calculo del alpha de Cronbach ------------------------------

*Primero lo corremos con todas las variables 
alpha algunaVezCeloso algunaAcusaInfiel limitaFamilia saberDondeEsta vigilaGastoDinero ignorado ellaEnreunionesSociales consultaDecisionesI amenazaAbandonarla amenazaQuitarleNinos amenazaQuitarApoyoEcon algunaVezGolpeado algunaVezAmenazoArma algunaVezHaViolado ultimoAnoAcusaInfiel esposoConsumeSustancias, item 



*---------e. Calculo del alpha de Cronbach Con variables eliminadas------------
*Nuevo alpha sin la variable
 alpha algunaVezCeloso algunaAcusaInfiel limitaFamilia saberDondeEsta vigilaGastoDinero ignorado ellaEnreunionesSociales consultaDecisionesI amenazaAbandonarla amenazaQuitarleNinos amenazaQuitarApoyoEcon algunaVezGolpeado algunaVezAmenazoArma algunaVezHaViolado esposoConsumeSustancias,item 


 
* Exportar resultados de Alpha de Cronbach a excel*/
return list
putexcel set "resultadosalpha.xlsx", sheet("alpha de cronbach") replace
putexcel A1=("Variable") B1=("Observaciones")C1=("Correlación ítem-prueba") D1=("Correlación ítem-resto")E1=("Covarianza interítem media") F1=("Alpha"), bold border("bottom", "medium", "black")
putexcel A17 =("Escala de prueba"), bold

matrix obs = (4539 \ 4539 \ 4539 \ 4539 \ 4539 \ 4539 \ 4539 \ 4539 \ 4539 \ 4539 \ 4539 \ 4539 \ 4539 \ 4539 \ 4539)

/* Crear una nueva variable en el dataset a partir de la matriz
clear
set obs 15
gen valores = .
forvalues i = 1/15 {
    replace valores = obs[`i',1] in `i'
}

*/
* Obtener matrices de resultados
matrix itemcorr = r(ItemTestCorr)'
matrix itemrcorr = r(ItemRestCorr)'
matrix itemmeancov = r(MeanInterItemCov)'
matrix itemalpha = r(Alpha)'



/*Ubicación de los datos en la celda de excel */
putexcel A2 = ("Celoso") 
putexcel A3 = ("Acusa Infidelidad")
putexcel A4 = ("Limita la Familia")
putexcel A5 = ("Saber Donde está")
putexcel A6 = ("Vigila los gastos")
putexcel A7 = ("Ignora")
putexcel A8 = ("Ella Reuniones Sociales")
putexcel A9 = ("Consulta Decisiones")
putexcel A10 = ("Amenaza Abandonar")
putexcel A11 = ("Amenaza Quitar Hijos")
putexcel A12 = ("Amenaza Quitar Apoyo Económico")
putexcel A13 = ("Golpeado")
putexcel A14 = ("Amenaza con Arma")
putexcel A15 = ("Ha Violado")

putexcel A16= ("Esposo Consume Sustancias")
* Exportar las observaciones y signos a Excel
putexcel B2 = matrix(obs)
* Exportar las matrices de correlación a Excel
putexcel C2= matrix(itemcorr)
putexcel D2 = matrix(itemrcorr)
putexcel E2 = matrix(itemmeancov)
putexcel F2 = matrix(itemalpha)

* Exportar el valor de alpha a la celda F17
putexcel F17 = (r(alpha)), bold



*-----------------F. CREACIÓN DEL ÍNDICE IVM----------------------------------

* Opción 1: Creación del Índice Ponderado
{
* Crear el índice ponderado por tres dimensiones: 
	* 1. Amenazas ()
	* 2. Maltrato Físico
	
	
/* Variables de cada Dimensión:

Psicologico
	algunaVezCeloso
	algunaAcusaInfiel
	limitaFamilia
	saberDondeEsta
	vigilaGastoDinero
	ignorado
	ellaEnreunionesSociales
	consultaDecisionesI
	algunaVezHaViolado
	ultimoAnoAcusaInfiel
	esposoConsumeSustancias
	
Fisico
	algunaVezGolpeado

Amenaza
	amenazaAbandonarla
	amenazaQuitarleNinos
	amenazaQuitarApoyoEcon
	algunaVezAmenazoArma
*/

gen amenaza = 0.25 * amenazaAbandonarla + 0.25* amenazaQuitarleNinos + 0.25* amenazaQuitarApoyoEcon + 0.25* algunaVezAmenazoArma

gen mfisico= algunaVezGolpeado 

gen mpsicologico = 0.10*algunaVezCeloso + 0.10*algunaAcusaInfiel + 0.10*limitaFamilia + 0.10*saberDondeEsta + 0.10*vigilaGastoDinero + 0.10*ignorado + 0.10*ellaEnreunionesSociales + 0.10*consultaDecisionesI + 0.10*algunaVezHaViolado + 0.10*esposoConsumeSustancias


*Se excluyó 6.25*ultimoAnoAcusaInfiel de la dimensión mpsicologico

*CREACION IVM
gen ivm= (amenaza*(1/3) + mfisico*(1/3) + mpsicologico*(1/3))*100

*Estadísticas Descriptivas
tabstat ivm, statistics(mean sd min max median p25 p75)
ssc install asdoc
asdoc tabstat ivm, statistics(mean sd min max median p25 p75) save(ivm_descriptives.doc)

}


*------------------G. IVM por edad y nivel socioeconomico------------------------

{
*Creación de la tabla para IVM - Nivel Socieconomico
asdoc tabstat ivm, statistics(mean sd min max median p25 p75) by(QHWLTHI5) save(ivm_NivelSocioec.doc)

*Creación de la tabla para IVM - Grupos de EDAD
egen grupo_edad = cut(QH03), at(13 22 31 40 50) icodes label
asdoc tabstat ivm, statistics(mean sd min max median p25 p75) by(grupo_edad) save(ivm_grupoedad.doc)

}


*_______________________________________________________________________________
**************************		PUNTO 2		************************************
*________________________________________________________________________________

*--------------------------------------------------------------------------------

*---------------- VALIDEZ CONVERGENTE--------------------------------------------
*Disminución en la autoestima
tab Q1110F
gen dis_autoestima=1 if Q1110F==1
replace dis_autoestima=0 if Q1110F==2
tab Q1110F dis_autoestima

*Enfermó fisicamente
gen enfermo_fisicamente=1 if Q1110J==1
replace enfermo_fisicamente=0 if Q1110J==2
tab Q1110J enfermo_fisicamente

*Enfermó mentalmente
gen enfermo_emocionalmente=1 if Q1110K==1
replace enfermo_emocionalmente=0 if Q1110K==2
tab Q1110K enfermo_emocionalmente

*Frecuencia con la que ha sido agregida
gen frecuencia_agrecion=0 if Q1129==3
replace frecuencia_agrecion=1 if Q1129==2
replace frecuencia_agrecion=2 if Q1129==1

*Violencia conyugal
gen violencia_conyugal=(Q112 6==1) //Indica que ha pensado en separarse por violencia conyugal


label variable dis_autoestima "Disminución en autoestima por lo que hizo el esposo"
label variable enfermo_fisicamente "Enfermo fisicamente por lo que hizo el esposo"
label variable enfermo_fisicamente "Enfermo mentalmente por lo que hizo el esposo"
label variable frecuencia_agrecion "Frecuencia con la que ha sido agredida (0 a 2)"
label variable violencia_conyugal "Ha pensado separarse por violencia conyugal"

*corr dis_autoestima ivm
*reg dis_autoestima ivm, r

* Crear una tabla de correlaciones y guardar en un archivo de Word
* Utilizamos pwcorr para obtener correlaciones y outreg2 para exportarlas
pwcorr dis_autoestima enfermo_fisicamente enfermo_emocionalmente violencia_conyugal ivm, sig

global var_convergente dis_autoestima enfermo_fisicamente enfermo_emocionalmente frecuencia_agrecion violencia_conyugal

foreach var of global var_convergente{
	sum `var'
	//tab `var'
}

*Analisis de correlación por medio de MCO.

* Loop para realizar regresiones y guardar los resultados
foreach var of global var_convergente {
    * Realizar regresión con errores robustos
    reg `var' ivm, robust
	outreg2 using "Tabla_regresion_corregida.doc", append se ///
title ("Modelo de probabilidad lineal como IVM como regresora") ///
ctitle("`var'") label word nonote addnote("Desviacion estandar en parentesis. Se usaron errores estandar robustos en las estimaciones parametricas. *** p<0.01, ** p<0.05, * p<0.1.") nocons bdec(3) nor2
}

log close
exit







 



