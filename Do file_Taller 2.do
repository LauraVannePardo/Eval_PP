*==============================================================================*
*				 		EVALUACION POLITICA PUBICA   2024-2					   *
*							TALLER 2 DO file								   *
* 	POR: Laura Pardo, José E González, Julián Pulido  Luis Castellanos   	   *
* 							6 de Mayo  DE 2024							       *
* 							 	STATA 18.0									   *  
*==============================================================================*

cls
clear all
cap log close
set more off
*________________________________________________________________________________
*Establecemos un directorio de trabajo

cd "/Users/User/Library/CloudStorage/OneDrive-Universidaddelosandes/2024-2 Evaluación de Políticas Públicas/Talleres/Taller 2"

cd "C:\Users\Heitz\Desktop\Evaluación de Impacto  EGOB\Taller 2"

log using "taller2.log", replace /*Empezar el log file*/

use "VIF_ENDS2010.dta", clear

*_______________________________________________________________________________
**************************		PUNTO 1			*********************************
*________________________________________________________________________________

*Codificación sin Loop
{
***Qué datos contiene la base?**
describe
summarize 

*________________________ Variable Nueva 1_______________________________________

*Creacion de las nuevas variables 
*Hacemos un tab de la variable original 
tab Q1103AA, m 
*Creamos una variable nueva que sea la copia de la original 
gen algunaVezCeloso= Q1103AA

*Hacemos un tab para si quedo bien creada la variable excluyendo missings 
tab algunaVezCeloso, m
*Hacemos la codificacion correcta Si=1 y No =0 
replace algunaVezCeloso = 1 if algunaVezCeloso == 1
replace algunaVezCeloso = 0 if algunaVezCeloso == 2

*Modificamos la etiqueta para que se entienda la codificacion 

label variable algunaVezCeloso "Alguna vez se ha puesto celoso si habla con otro hombre: Sí=1, No=0"


*________________________ Variable Nueva 2_______________________________________
*Creacion de las nuevas variables 
*Hacemos un tab de la variable original 
tab Q1103BA, m 
*Creamos una variable nueva que sea la copia de la original 
*drop algunaAcusaInfiel
gen algunaAcusaInfiel= Q1103BA

*Hacemos un tab para si quedo bien creada la variable excluyendo missings 
tab algunaAcusaInfiel, m
*Hacemos la codificacion correcta Si=1 y No =0 
replace algunaAcusaInfiel = 1 if  algunaAcusaInfiel == 1
replace algunaAcusaInfiel = 0 if algunaAcusaInfiel == 2

*Modificamos la etiqueta para que se entienda la codificacion 

label variable algunaAcusaInfiel  "Alguna vez la ha acusado de serle infiel: Sí=1, No=0"



*________________________ Variable Nueva 3_______________________________________

*Creacion de las nuevas variables 
*Hacemos un tab de la variable original 
tab Q1103DA, m 
*Creamos una variable nueva que sea la copia de la original 
*drop algunaAcusaInfiel
gen limitaFamilia= Q1103DA

*Hacemos un tab para si quedo bien creada la variable excluyendo missings 
tab limitaFamilia, m
*Hacemos la codificacion correcta Si=1 y No =0 
replace limitaFamilia = 1 if  limitaFamilia == 1
replace limitaFamilia = 0 if limitaFamilia == 2

*Modificamos la etiqueta para que se entienda la codificacion 

label variable limitaFamilia "Alguna vez ha tratado de limitarle el trato con la familia: Sí=1, No=0"

}



*-----Creamos un proceso automático (loop) que recodifique las variables ------

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


*Estadisticas Descriptivas
*(POR COMPLETAR)



*----------------Calculo del alpha de Cronbach ------------------------------
{
  alpha algunaVezCeloso algunaAcusaInfiel limitaFamilia saberDondeEsta vigilaGastoDinero ignorado ellaEnreunionesSociales consultaDecisionesI amenazaAbandonarla amenazaQuitarleNinos amenazaQuitarApoyoEcon algunaVezGolpeado algunaVezAmenazoArma algunaVezHaViolado ultimoAnoAcusaInfiel esposoConsumeSustancias, item /*inlcuyendo más  variables, mejora el resultado pero tiene sentido económico?*/


*Calculo del alpha de Cronbach sin la variable que la empeora
alpha algunaVezCeloso algunaAcusaInfiel limitaFamilia saberDondeEsta vigilaGastoDinero ignorado ellaEnreunionesSociales consultaDecisionesI amenazaAbandonarla amenazaQuitarleNinos amenazaQuitarApoyoEcon algunaVezGolpeado algunaVezAmenazoArma algunaVezHaViolado ultimoAnoAcusaInfiel, item /*inlcuyendo más  variables, mejora el resultado pero tiene sentido económico?*/

*Nota: Aqui el ultimoAnoAcusaInfiel me saca 0.8217, si la eliminara deberia subir el alpha, pero eso no ocurre 
}



*-----------------CREACIÓN DEL INDICADOR IVM----------------------------------

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

gen amenaza = 6.25*amenazaAbandonarla + 6.25*amenazaQuitarleNinos +	6.25*amenazaQuitarApoyoEcon + 6.25*algunaVezAmenazoArma

gen mfisico= 6.25*algunaVezGolpeado 

gen mpsicologico = 6.25*algunaVezCeloso + 6.25*algunaAcusaInfiel + 6.25*limitaFamilia + 6.25*saberDondeEsta + 6.25*vigilaGastoDinero + 6.25*ignorado + 6.25*ellaEnreunionesSociales + 6.25*consultaDecisionesI + 6.25*algunaVezHaViolado + 6.25*esposoConsumeSustancias


*Se excluyó 6.25*ultimoAnoAcusaInfiel de la dimensión mpsicologico

*CREACION IVM
gen ivm= amenaza + mfisico + mpsicologico

order ivm algunaVezCeloso algunaAcusaInfiel limitaFamilia saberDondeEsta vigilaGastoDinero ignorado ellaEnreunionesSociales consultaDecisionesI algunaVezHaViolado	ultimoAnoAcusaInfiel esposoConsumeSustancias algunaVezGolpeado amenazaAbandonarla amenazaQuitarleNinos amenazaQuitarApoyoEcon algunaVezAmenazoArma
}

* Opción 2: Creación del Índice usando PCA

{
* Paso 1: Verificación de la correlación entre las variables (opcional)
corr algunaVezCeloso algunaAcusaInfiel limitaFamilia saberDondeEsta vigilaGastoDinero ignorado ellaEnreunionesSociales consultaDecisionesI algunaVezHaViolado esposoConsumeSustancias algunaVezGolpeado amenazaAbandonarla amenazaQuitarleNinos amenazaQuitarApoyoEcon algunaVezAmenazoArma

* Paso 2: Ejecución del Análisis de Componentes Principales (PCA)
pca algunaVezCeloso algunaAcusaInfiel limitaFamilia saberDondeEsta vigilaGastoDinero ignorado ellaEnreunionesSociales consultaDecisionesI algunaVezHaViolado esposoConsumeSustancias algunaVezGolpeado amenazaAbandonarla amenazaQuitarleNinos amenazaQuitarApoyoEcon algunaVezAmenazoArma

* Paso 3: Predicción del índice basado en el primer componente principal
predict IVM_PCA, score

order ivm IVM_PCA


}


*------------------IVM por edad y nivel socioeconomico------------------------

corr ivm QH03 QHWLTHI5
corr IVM_PCA QH03 QHWLTHI5

graph matrix ivm QH03 QHWLTHI5, half
scatter ivm QH03

graph matrix IVM_PCA QH03 QHWLTHI5, half
scatter IVM_PCA QH03
