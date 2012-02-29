************************************AMBIENTE ESCOLAR********************************

*******************************************************************************************************
****************************************Docentes*******************************************************
*******************************************************************************************************
clear all
 
use "Z:\media\KINGSTON\vinvertidos\docentes inv.dta", clear
log using "Z:\media\KINGSTON\vinvertidos\docentes.txt", replace
drop ii_1  ii_3 ii_4  ii_51 ii_52 ii_53 ii_6 ii_7 ii_8  ii_9 tel�fono_
outsheet using "Z:\media\KINGSTON\v\docentes.csv", comma replace
*Invertir las preguntas que estan formuladas de forma incorrecta	
gen iv_9_i=6-iv_9
drop iv_9
rename iv_9_i iv_9

*Secci�n III

local i=1
while `i' <=23{
gen iii_`i'_re_d=10/3*(iii_`i'-1)
local i=`i'+1
}

***Hallar las frecuencias 

local i=1
while `i' <=23{
egen f_iii_`i'_re_d=count(iii_`i'_re_d), by(iii_`i'_re_d dane)
local i=`i'+1
}

*Secci�n IV

local i=1
while `i' <=8{
gen iv_`i'_re_d=10/3*(iv_`i'-1)
local i=`i'+1
}

local i=9
while `i' <=14{
gen iv_`i'_re_d=5/2*(iv_`i'-1)
local i=`i'+1
}
*** Hallar las frecuencias

local i=1
while `i' <=14{
egen f_iv_`i'_re_d=count(iv_`i'_re_d), by(iv_`i'_re_d dane)
local i=`i'+1
}

*Secci�n V

local i=1
while `i' <=15{
gen v_`i'_re_d=10/3*(v_`i'-1)
local i=`i'+1
}

***Hallar las frecuencias

local i=1
while `i' <=15{
egen f_v_`i'_re_d=count(v_`i'_re_d), by(v_`i'_re_d dane)
local i=`i'+1
}

*Secci�n VI

local i=1
while `i' <=13{
gen vi_`i'_re_d=10/3*(vi_`i'-1)
local i=`i'+1
}

*** Hallar las frecuencias

local i=1
while `i' <=13{
egen f_vi_`i'_re_d=count(vi_`i'_re_d), by(vi_`i'_re_d dane)
local i=`i'+1
}

*Secci�n VII

gen vii_2_re_d=5/2*(vii_2-1)
egen f_vii_2_re_d=count(vii_2_re_d), by(vii_2_re_d dane)


****Crear los global para los collapse

global xlist_data iii_1_re_d iii_2_re_d iii_3_re_d iii_4_re_d iii_5_re_d iii_6_re_d iii_7_re_d iii_8_re_d iii_9_re_d iii_10_re_d iii_11_re_d iii_12_re_d /// 
iii_13_re_d iii_14_re_d iii_15_re_d iii_16_re_d iii_17_re_d iii_18_re_d iii_19_re_d iii_20_re_d iii_21_re_d iii_22_re_d iii_23_re_d ///
iv_1_re_d iv_2_re_d iv_3_re_d iv_4_re_d iv_5_re_d iv_6_re_d iv_7_re_d iv_8_re_d iv_9_re_d iv_10_re_d iv_11_re_d iv_12_re_d iv_13_re_d iv_14_re_d ///
v_1_re_d v_2_re_d v_3_re_d v_4_re_d v_5_re_d v_6_re_d v_7_re_d v_8_re_d v_9_re_d v_10_re_d v_11_re_d v_12_re_d v_13_re_d v_14_re_d v_15_re_d ///
vi_1_re_d vi_2_re_d vi_3_re_d vi_4_re_d vi_5_re_d vi_6_re_d vi_7_re_d vi_8_re_d vi_9_re_d vi_10_re_d vi_11_re_d vi_12_re_d vi_13_re_d ///
vii_2_re_d 

global xlist_frec f_iii_1_re_d f_iii_2_re_d f_iii_3_re_d f_iii_4_re_d f_iii_5_re_d f_iii_6_re_d f_iii_7_re_d f_iii_8_re_d f_iii_9_re_d /// 
f_iii_10_re_d f_iii_11_re_d f_iii_12_re_d f_iii_13_re_d f_iii_14_re_d f_iii_15_re_d f_iii_16_re_d f_iii_17_re_d f_iii_18_re_d /// 
f_iii_19_re_d f_iii_20_re_d f_iii_21_re_d f_iii_22_re_d f_iii_23_re_d ///
f_iv_1_re_d f_iv_2_re_d f_iv_3_re_d f_iv_4_re_d f_iv_5_re_d f_iv_6_re_d f_iv_7_re_d f_iv_8_re_d f_iv_9_re_d f_iv_10_re_d f_iv_11_re_d f_iv_12_re_d f_iv_13_re_d f_iv_14_re_d ///
f_v_1_re_d f_v_2_re_d f_v_3_re_d f_v_4_re_d f_v_5_re_d f_v_6_re_d f_v_7_re_d f_v_8_re_d f_v_9_re_d f_v_10_re_d f_v_11_re_d f_v_12_re_d f_v_13_re_d f_v_14_re_d f_v_15_re_d ///
f_vi_1_re_d f_vi_2_re_d f_vi_3_re_d f_vi_4_re_d f_vi_5_re_d f_vi_6_re_d f_vi_7_re_d f_vi_8_re_d f_vi_9_re_d f_vi_10_re_d f_vi_11_re_d f_vi_12_re_d f_vi_13_re_d ///
f_vii_2_re_d

collapse (sum) $xlist_data (count) $xlist_frec, by(dane)

*** Generar variables promedios

*Secci�n III

local i=1
while `i' <=23{
gen pro_iii_`i'_re_d=iii_`i'_re_d/f_iii_`i'_re_d
local i=`i'+1
}

*Seccion IV

local i=1
while `i' <=14{
gen pro_iv_`i'_re_d=iv_`i'_re_d/f_iv_`i'_re_d
local i=`i'+1
}

*Secci�n V

local i=1
while `i' <=15{
gen pro_v_`i'_re_d=v_`i'_re_d/f_v_`i'_re_d
local i=`i'+1
}

*Secci�n VI

local i=1
while `i' <=13{
gen pro_vi_`i'_re_d=vi_`i'_re_d/f_vi_`i'_re_d
local i=`i'+1
}

*Secci�n VII

gen pro_vii_2_re_d=vii_2_re_d/f_vii_2_re_d


***Medias por pregunta

egen III_d=rowmean(pro_iii_1_re_d pro_iii_2_re_d pro_iii_3_re_d pro_iii_4_re_d pro_iii_5_re_d pro_iii_6_re_d pro_iii_7_re_d pro_iii_8_re_d pro_iii_9_re_d pro_iii_10_re_d pro_iii_11_re_d pro_iii_12_re_d pro_iii_13_re_d pro_iii_14_re_d pro_iii_15_re_d pro_iii_16_re_d pro_iii_17_re_d pro_iii_18_re_d pro_iii_19_re_d pro_iii_20_re_d pro_iii_21_re_d pro_iii_22_re_d pro_iii_23_re_d)
egen IV_d=rowmean(pro_iv_1_re_d pro_iv_2_re_d pro_iv_3_re_d pro_iv_4_re_d pro_iv_5_re_d pro_iv_6_re_d pro_iv_7_re_d pro_iv_8_re_d pro_iv_9_re_d pro_iv_10_re_d pro_iv_11_re_d pro_iv_12_re_d pro_iv_13_re_d pro_iv_14_re_d)
egen V_d=rowmean(pro_v_1_re_d pro_v_2_re_d pro_v_3_re_d pro_v_4_re_d pro_v_5_re_d pro_v_6_re_d pro_v_7_re_d pro_v_8_re_d pro_v_9_re_d pro_v_10_re_d pro_v_11_re_d pro_v_12_re_d pro_v_13_re_d pro_v_14_re_d pro_v_15_re_d)
egen VI_d=rowmean(pro_vi_1_re_d pro_vi_2_re_d pro_vi_3_re_d pro_vi_4_re_d pro_vi_5_re_d pro_vi_6_re_d pro_vi_7_re_d pro_vi_8_re_d pro_vi_9_re_d pro_vi_10_re_d pro_vi_11_re_d pro_vi_12_re_d pro_vi_13_re_d)
egen VII_d=rowmean(pro_vii_2_re_d )

egen Ambi_escol_d=rowmean(III_d IV_d V_d VI_d VII_d)

*Dejar solo los resultados por secci�n

keep dane III_d IV_d V_d VI_d VII_d Ambi_escol_d
gen a�o_d=2012
sum  Ambi_escol_d III_d IV_d V_d VI_d VII_d
codebook Ambi_escol_d III_d IV_d V_d VI_d VII_d

saveold "Z:\media\KINGSTON\vinvertidos\docentes1 inv.dta",replace
outsheet using "Z:\media\KINGSTON\v\docentes1 inv.csv", comma replace
log close
*******************************************************************************************************
*****************************************Estudiantes***************************************************
*******************************************************************************************************

clear
use "Z:\media\KINGSTON\vinvertidos\estudiantes inv.dta", clear
drop telefono
log using "Z:\media\KINGSTON\vinvertidos\estudiantes inv.txt", replace
outsheet using "Z:\media\KINGSTON\v\estudiantes inv.csv", comma replace

*Invertir las preguntas que estan formuladas de forma incorrecta

local i=6
while `i' <=8{
gen vi_`i'_i=5-vi_`i'
drop vi_`i'
rename vi_`i'_i vi_`i'
local i=`i'+1
}

local i=11
while `i' <=16{
gen vi_`i'_i=5-vi_`i'
drop vi_`i'
rename vi_`i'_i vi_`i'
local i=`i'+1
}

	*Secci�n III

local i=1
while `i' <=9{
gen iii_`i'_re_e=10/3*(iii_`i'-1)
local i=`i'+1
}

***Hallar las frecuencias 

local i=1
while `i' <=9{
egen f_iii_`i'_re_e=count(iii_`i'_re_e), by(iii_`i'_re_e dane)
local i=`i'+1
}

*Secci�n IV

local i=1
while `i' <=9{
gen iv_`i'_re_e=10/3*(iv_`i'-1)
local i=`i'+1
}

***Hallar las frecuencias 

local i=1
while `i' <=9{
egen f_iv_`i'_re_e=count(iv_`i'_re_e), by(iv_`i'_re_e dane)
local i=`i'+1
}

*Secci�n V

local i=1
while `i' <=10{
gen v_`i'_re_e=10/3*(v_`i'-1)
local i=`i'+1
}
gen v_11_a_re_e=10/3*(v_11_a-1)
gen v_11_b_re_e=10/3*(v_11_b-1)
gen v_11_c_re_e=10/3*(v_11_c-1)
gen v_11_d_re_e=10/3*(v_11_d-1)
gen v_12_re_e=10/3*(v_12-1)
gen v_13_re_e=10/3*(v_13-1)
gen v_14_re_e=5/2*(v_14-1)
gen v_15_re_e=10/3*(v_15-1)

*** Hallar las Frecuencias

local i=1
while `i' <=10{
egen f_v_`i'_re_e=count(v_`i'_re_e), by(v_`i'_re_e dane)
local i=`i'+1
}
egen f_v_11_a_re_e=count(v_11_a_re_e), by(v_11_a_re_e dane)
egen f_v_11_b_re_e=count(v_11_b_re_e), by(v_11_b_re_e dane)
egen f_v_11_c_re_e=count(v_11_c_re_e), by(v_11_c_re_e dane)
egen f_v_11_d_re_e=count(v_11_d_re_e), by(v_11_d_re_e dane)

local i=12
while `i' <=15{
egen f_v_`i'_re_e=count(v_`i'_re_e), by(v_`i'_re_e dane)
local i=`i'+1
}

*Secci�n VI

local i=1
while `i' <=18{
gen vi_`i'_re_e=10/3*(vi_`i'-1)
local i=`i'+1
}

*Hallar las frecuencias

local i=1
while `i' <=18{
egen f_vi_`i'_re_e=count(vi_`i'_re_e), by(vi_`i'_re_e dane)
local i=`i'+1
}

*Secci�n VII

gen vii_1_re_e=5/2*(vii_1-1)
egen f_vii_1_re_e=count(vii_1_re_e), by(vii_1_re_e dane)


***Crear los global para el collapse

global xlist_data iii_1_re_e iii_2_re_e iii_3_re_e iii_4_re_e iii_5_re_e iii_6_re_e iii_7_re_e iii_8_re_e iii_9_re_e ///
iv_1_re_e iv_2_re_e iv_3_re_e iv_4_re_e iv_5_re_e iv_6_re_e iv_7_re_e iv_8_re_e iv_9_re_e ///
v_1_re_e v_2_re_e v_3_re_e v_4_re_e v_5_re_e v_6_re_e v_7_re_e v_8_re_e v_9_re_e v_10_re_e v_11_a_re_e v_11_b_re_e v_11_c_re_e v_11_d_re_e v_12_re_e v_13_re_e v_14_re_e v_15_re_e ///
vi_1_re_e vi_2_re_e vi_3_re_e vi_4_re_e vi_5_re_e vi_6_re_e vi_7_re_e vi_8_re_e vi_9_re_e vi_10_re_e vi_11_re_e vi_12_re_e vi_13_re_e vi_14_re_e vi_15_re_e vi_16_re_e vi_17_re_e vi_18_re_e ///
vii_1_re_e

global xlist_frec f_iii_1_re_e f_iii_2_re_e f_iii_3_re_e f_iii_4_re_e f_iii_5_re_e f_iii_6_re_e f_iii_7_re_e f_iii_8_re_e f_iii_9_re_e ///
f_iv_1_re_e f_iv_2_re_e f_iv_3_re_e f_iv_4_re_e f_iv_5_re_e f_iv_6_re_e f_iv_7_re_e f_iv_8_re_e f_iv_9_re_e ///
f_v_1_re_e f_v_2_re_e f_v_3_re_e f_v_4_re_e f_v_5_re_e f_v_6_re_e f_v_7_re_e f_v_8_re_e f_v_9_re_e f_v_10_re_e f_v_11_a_re_e f_v_11_b_re_e f_v_11_c_re_e f_v_11_d_re_e f_v_12_re_e f_v_13_re_e f_v_14_re_e f_v_15_re_e ///
f_vi_1_re_e f_vi_2_re_e f_vi_3_re_e f_vi_4_re_e f_vi_5_re_e f_vi_6_re_e f_vi_7_re_e f_vi_8_re_e f_vi_9_re_e f_vi_10_re_e f_vi_11_re_e f_vi_12_re_e f_vi_13_re_e f_vi_14_re_e f_vi_15_re_e f_vi_16_re_e f_vi_17_re_e f_vi_18_re_e ///
f_vii_1_re_e 

collapse (sum) $xlist_data (count) $xlist_frec, by (dane)

*** Generar variables promedios

*Secci�n III

local i=1
while `i' <=9{
gen pro_iii_`i'_re_e=iii_`i'_re_e/f_iii_`i'_re_e
local i=`i'+1
}

*Seccion IV

local i=1
while `i' <=9{
gen pro_iv_`i'_re_e=iv_`i'_re_e/f_iv_`i'_re_e
local i=`i'+1
}

*Secci�n V

local i=1
while `i' <=10{
gen pro_v_`i'_re_e=v_`i'_re_e/f_v_`i'_re_e
local i=`i'+1
}
gen pro_v_11_a_re_e=v_11_a_re_e/f_v_11_a_re_e
gen pro_v_11_b_re_e=v_11_b_re_e/f_v_11_b_re_e
gen pro_v_11_c_re_e=v_11_c_re_e/f_v_11_c_re_e
gen pro_v_11_d_re_e=v_11_d_re_e/f_v_11_d_re_e

local i=12
while `i' <=15{
gen pro_v_`i'_re_e=v_`i'_re_e/f_v_`i'_re_e
local i=`i'+1
}

*Secci�n VI

local i=1
while `i' <=18{
gen pro_vi_`i'_re_e=vi_`i'_re_e/f_vi_`i'_re_e
local i=`i'+1
}

*Secci�n VII

gen pro_vii_1_re_e=vii_1_re_e/f_vii_1_re_e

***Medias por pregunta

egen III_e=rowmean(pro_iii_1_re_e pro_iii_2_re_e pro_iii_3_re_e pro_iii_4_re_e pro_iii_5_re_e pro_iii_6_re_e pro_iii_7_re_e pro_iii_8_re_e pro_iii_9_re_e)
egen IV_e=rowmean(pro_iv_1_re_e pro_iv_2_re_e pro_iv_3_re_e pro_iv_4_re_e pro_iv_5_re_e pro_iv_6_re_e pro_iv_7_re_e pro_iv_8_re_e pro_iv_9_re_e)
egen V_e=rowmean(pro_v_1_re_e pro_v_2_re_e pro_v_3_re_e pro_v_4_re_e pro_v_5_re_e pro_v_6_re_e pro_v_7_re_e pro_v_8_re_e pro_v_9_re_e pro_v_10_re_e pro_v_11_a_re_e pro_v_11_b_re_e pro_v_11_c_re_e pro_v_11_d_re_e pro_v_12_re_e pro_v_13_re_e pro_v_14_re_e pro_v_15_re_e)
egen VI_e=rowmean(pro_vi_1_re_e pro_vi_2_re_e pro_vi_3_re_e pro_vi_4_re_e pro_vi_5_re_e pro_vi_6_re_e pro_vi_7_re_e pro_vi_8_re_e pro_vi_9_re_e pro_vi_10_re_e pro_vi_11_re_e pro_vi_12_re_e pro_vi_13_re_e pro_vi_14_re_e pro_vi_15_re_e pro_vi_16_re_e pro_vi_17_re_e pro_vi_18_re_e)
egen VII_e=rowmean(pro_vii_1_re_e)

egen Ambi_escol_e=rowmean(III_e IV_e V_e VI_e VII_e)

sum  Ambi_escol_e III_e IV_e V_e VI_e
codebook Ambi_escol_e III_e IV_e V_e VI_e 

keep  dane III_e IV_e V_e VI_e VII_e Ambi_escol_e
gen a�o_e=2012


saveold "Z:\media\KINGSTON\vinvertidos\estudiantes1 inv.dta",replace
outsheet using "Z:\media\KINGSTON\v\estudiantes1 inv.csv", comma replace
log close


*******************************************************************************************************
*****************************************Padres********************************************************
*******************************************************************************************************

clear
use "Z:\media\KINGSTON\vinvertidos\padres inv.dta", clear
log using "Z:\media\KINGSTON\vinvertidos\padres inv.txt", replace
drop identinsteducativa telefono
outsheet using "Z:\media\KINGSTON\v\padres inv.csv", comma replace

replace vi_8=. if vi_8==999
replace vi_9=. if vi_9==999
replace vi_10=. if vi_10==999
replace vi_11=. if vi_11==999

*Invertir las preguntas que estan formuladas de forma incorrecta

gen iv_10_i=6-iv_10
drop iv_10
rename iv_10_i iv_10

local i=8
while `i' <=11{
gen vi_`i'_i=5-vi_`i' if vi_`i'!=.
drop vi_`i'
rename vi_`i'_i vi_`i'
local i=`i'+1
}


***Reescalar las variables

*Secci�n III

local i=1
while `i'<=9{
gen iii_`i'_re_p=10/3*(iii_`i'-1)
local i=`i'+1
}
 
 ***Hallar las frecuencias 

local i=1
while `i' <=9{
egen f_iii_`i'_re_p=count(iii_`i'_re_p), by(iii_`i'_re_p dane)
local i=`i'+1
}

*Secci�n IV

local i=1
while `i' <=9{
gen iv_`i'_re_p=10/3*(iv_`i'-1)
local i=`i'+1
}

gen iv_10_re_p=5/2*(iv_10-1)

local i=11
while `i' <=12{
gen iv_`i'_re_p=10/3*(iv_`i'-1)
local i=`i'+1
}

*** Hallar las frecuencias

local i=1
while `i' <=12{
egen f_iv_`i'_re_p=count(iv_`i'_re_p), by(iv_`i'_re_p dane)
local i=`i'+1
}

*Secci�n V

local i=1
while `i' <=5{
gen v_`i'_re_p=10/3*(v_`i'-1)
local i=`i'+1
}

gen v_6_re_p=5/2*(v_6-1)
gen v_7_re_p=5/2*(v_7-1)

gen v_8_re_p=10/3*(v_8-1)
gen v_9_re_p=10/3*(v_9-1)

*** Hallar las frecuencias

local i=1
while `i' <=9{
egen f_v_`i'_re_p=count(v_`i'_re_p), by(v_`i'_re_p dane)
local i=`i'+1
}

*Secci�n VI

local i=1
while `i' <=11{
gen vi_`i'_re_p=10/3*(vi_`i'-1)
local i=`i'+1
}
*** Hallar las frecuencias

local i=1
while `i' <=11{
egen f_vi_`i'_re_p=count(vi_`i'_re_p), by(vi_`i'_re_p dane)
local i=`i'+1
}

*Secci�n VII

local i=1
while `i' <=1{
gen vii_`i'_re_p=5/2*(vii_`i'-1)
local i=`i'+1
}

***Hallar las frecuencias 

local i=1
while `i' <=1{
egen f_vii_`i'_re_p=count(vii_`i'_re_p), by(vii_`i'_re_p dane)
local i=`i'+1
}

***Crear los global para el collapse

global xlist_data iii_1_re_p iii_2_re_p iii_3_re_p iii_4_re_p iii_5_re_p iii_6_re_p iii_7_re_p iii_8_re_p iii_9_re_p ///
iv_1_re_p iv_2_re_p iv_3_re_p iv_4_re_p iv_5_re_p iv_6_re_p iv_7_re_p iv_8_re_p iv_9_re_p iv_10_re_p iv_11_re_p iv_12_re_p ///
v_1_re_p v_2_re_p v_3_re_p v_4_re_p v_5_re_p v_6_re_p v_7_re_p v_8_re_p v_9_re_p ///
vi_1_re_p vi_2_re_p vi_3_re_p vi_4_re_p vi_5_re_p vi_6_re_p vi_7_re_p vi_8_re_p vi_9_re_p vi_10_re_p vi_11_re_p ///
vii_1_re_p 
global xlist_frec f_iii_1_re_p f_iii_2_re_p f_iii_3_re_p f_iii_4_re_p f_iii_5_re_p f_iii_6_re_p f_iii_7_re_p f_iii_8_re_p f_iii_9_re_p ///
f_iv_1_re_p f_iv_2_re_p f_iv_3_re_p f_iv_4_re_p f_iv_5_re_p f_iv_6_re_p f_iv_7_re_p f_iv_8_re_p f_iv_9_re_p f_iv_10_re_p f_iv_11_re_p f_iv_12_re_p ///
f_v_1_re_p f_v_2_re_p f_v_3_re_p f_v_4_re_p f_v_5_re_p f_v_6_re_p f_v_7_re_p f_v_8_re_p f_v_9_re_p ///
f_vi_1_re_p f_vi_2_re_p f_vi_3_re_p f_vi_4_re_p f_vi_5_re_p f_vi_6_re_p f_vi_7_re_p f_vi_8_re_p f_vi_9_re_p f_vi_10_re_p f_vi_11_re_p ///
f_vii_1_re_p 

collapse (sum) $xlist_data (count) $xlist_frec, by (dane)

*** Generar variables promedios

*Secci�n III

local i=1
while `i' <=9{
gen pro_iii_`i'_re_p=iii_`i'_re_p/f_iii_`i'_re_p
local i=`i'+1
}

*Seccion IV

local i=1
while `i' <=12{
gen pro_iv_`i'_re_p=iv_`i'_re_p/f_iv_`i'_re_p
local i=`i'+1
}

*Secci�n V

local i=1
while `i' <=9{
gen pro_v_`i'_re_p=v_`i'_re_p/f_v_`i'_re_p
local i=`i'+1
}

*Secci�n VI

local i=1
while `i' <=11{
gen pro_vi_`i'_re_p=vi_`i'_re_p/f_vi_`i'_re_p
local i=`i'+1
}


*Secci�n VII

local i=1
while `i' <=1{
gen pro_vii_`i'_re_p=vii_`i'_re_p/f_vii_`i'_re_p
local i=`i'+1
}

***Medias por pregunta

egen III_p=rowmean(pro_iii_1_re_p pro_iii_2_re_p pro_iii_3_re_p pro_iii_4_re_p pro_iii_5_re_p pro_iii_6_re_p pro_iii_7_re_p pro_iii_8_re_p pro_iii_9_re_p)
egen IV_p=rowmean(pro_iv_1_re_p pro_iv_2_re_p pro_iv_3_re_p pro_iv_4_re_p pro_iv_5_re_p pro_iv_6_re_p pro_iv_7_re_p pro_iv_8_re_p pro_iv_9_re_p pro_iv_10_re_p pro_iv_11_re_p pro_iv_12_re_p)
egen V_p=rowmean(pro_v_1_re_p pro_v_2_re_p pro_v_3_re_p pro_v_4_re_p pro_v_5_re_p pro_v_6_re_p pro_v_7_re_p pro_v_8_re_p pro_v_9_re_p)
egen VI_p=rowmean(pro_vi_1_re_p pro_vi_2_re_p pro_vi_3_re_p pro_vi_4_re_p pro_vi_5_re_p pro_vi_6_re_p pro_vi_7_re_p pro_vi_8_re_p pro_vi_9_re_p pro_vi_10_re_p pro_vi_11_re_p)
egen VII_p=rowmean(pro_vii_1_re_p)

egen Ambi_escol_p=rowmean(III_p IV_p V_p VI_p VII_p)

keep dane III_p IV_p V_p VI_p VII_p Ambi_escol_p 	
gen a�o_p=2012
sum  Ambi_escol_p III_p IV_p V_p VI_p 
codebook Ambi_escol_p III_p IV_p V_p VI_p 

saveold "Z:\media\KINGSTON\vinvertidos\padres1 inv.dta",replace
outsheet using "Z:\media\KINGSTON\v\padres1 inv.csv", comma replace
log close
******************************************************************************************************
*******************************Unir las diferentes Bases de datos*************************************
******************************************************************************************************


log using "Z:\media\KINGSTON\vinvertidos\merge.txt", replace
cd "Z:\media\KINGSTON\vinvertidos"

use "Z:\media\KINGSTON\vinvertidos\padres1_inv.dta", clear 
merge dane using "Z:\media\KINGSTON\vinvertidos\docentes1 inv.dta" "Z:\media\KINGSTON\vinvertidos\estudiantes1 inv.dta"

egen III_total=rowmean(III_d III_e III_p)
egen IV_total=rowmean(IV_d IV_e IV_p)
egen V_total=rowmean(V_d V_e V_p)
egen VI_total=rowmean(VI_d VI_e VI_p)
egen VII_total=rowmean(VII_d VII_e VII_p)

egen Ambi_escol=rowmean(III_total IV_total V_total VI_total)
keep III_total IV_total V_total VI_total VII_total Ambi_escol
gen a�o=2012
saveold "Z:\media\KINGSTON\vinvertidos\merge.dta",replace
outsheet using "Z:\media\KINGSTON\v\merge.csv", comma replace
log close
