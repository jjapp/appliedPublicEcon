*Question 1 c
use "\\files\users\ecan\Desktop\ps1.dta", clear

*mean for education - years of education
sum ed if child>0
sum ed if child==0
*mean for nonwhite - if hispanic or black it is 1
sum nonwhite if child>0
sum nonwhite if child==0
*mean for age - age of the women
sum age if child>0
sum age if child==0
*mean for work - if worked last year
sum work if child>0
sum work if child==0
*mean for earn - annual earning
sum earn if child>0
sum earn if child==0

*Question 1 d
*mean for education - years of education
sum ed if child==1
sum ed if child>1
*mean for nonwhite - if hispanic or black it is 1
sum nonwhite if child==1
sum nonwhite if child>1
*mean for age - age of the women
sum age if child==1
sum age if child>1
*mean for work - if worked last year
sum work if child==1
sum work if child>1
*mean for earn - annual earnings
sum earn if child==1
sum earn if child>1

*Question 2
generate child=1 if children>0
replace child=0 if children==0
generate post1993=1 if year>1993
replace post1993=0 if year<1994

*Question 2 part a
**Obtaning the means for annual labor participation for women with children
sum work if child==1 & year==1991
sum work if child==1 & year==1992
sum work if child==1 & year==1993
sum work if child==1 & year==1994
sum work if child==1 & year==1995
sum work if child==1 & year==1996

collapse (mean) work, by(post1993 child)

**Obtaning the means for annual labor participation for women without children
sum work if child==0 & year==1991
sum work if child==0 & year==1992
sum work if child==0 & year==1993
sum work if child==0 & year==1994
sum work if child==0 & year==1995
sum work if child==0 & year==1996

*Question 2 d & e
**Obtaining the means for post 1993 and pre 1993 for control and treatment groups
sum work if child==1 & post1993==1
sum work if child==1 & post1993==0
sum work if child==0 & post1993==1
sum work if child==0 & post1993==0

*Question 2 f
sum work if children==1 & post1993==1
sum work if children==1 & post1993==0
sum work if children>1 & post1993==1
sum work if children>1 & post1993==0

*Question 2 g
generate interactionterm=post1993*child
reg work child post1993 interactionterm
reg work child post1993 interactionterm ed urate nonwhite age

*Question 2 h
use "\\files\users\ecan\Desktop\ps1.dta", clear
drop if year>1993
generate child=1 if children>0
replace child=0 if children==0
generate postplacebo=1 if year>1991
replace postplace=0 if year==1991
generate interactionterm2=postplacebo*child
reg work postplacebo child interactionterm2
reg work postplacebo child interactionterm2 urate ed nonwhite age
