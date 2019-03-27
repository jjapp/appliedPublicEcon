 **MISSING VALUES
 **Replacing missing values for free lunch
 replace sesk=. if sesk==9
 replace ses1=. if ses1==9
 replace ses2=. if ses2==9
 replace ses3=. if ses3==9
 
 **Repacing missing values in their school id
replace schidk=. if schidk==999
replace schid1=. if schid1==999
replace schid2=. if schid2==999
replace schid3=. if schid3==999

**Replacing missing values in their race and sex
replace race=. if race==9
replace sex=. if sex==9

**Replacing missing values for math test scores
replace mathk=. if mathk==999
replace math1=. if math1==999
replace math2=. if math2==999
replace math3=. if math3==999

**Replace missing values for reading test scores
replace readk=. if readk==999
replace read1=. if read1==999
replace read2=. if read2==999
replace read3=. if read3==999

**Replace missing values for class type
replace ctypek=. if ctypek==9
replace ctype1=. if ctype1==9
replace ctype2=. if ctype2==9
replace ctype3=. if ctype3==9

**Replace missing values for star participation
replace stark=. if stark==9
replace star1=. if star1==9
replace star2=. if star2==9
replace star3=. if star3==9

**Replace missing values for year of birth
replace yob=. if yob==9999

**CREATING VARIABLES

**Creating freelunch variables
gen freelunchk = 0
replace freelunchk = 1 if sesk==1

gen freelunch1=0
replace freelunch1=1 if ses1==1

gen freelunch2=0
replace freelunch2=1 if ses2==1

gen freelunch3=0
replace freelunch3=1 if ses3==1

**Creating attrition rate dummy variables
gen attritionk=0
replace attritionk=1 if stark==1 & star1==2
replace attritionk=1 if stark==1 & star2==2
replace attritionk=1 if stark==1 & star3==2

gen attrition1=0
replace attrition1=1 if star1==1 & star2==2 & stark==2
replace attrition1=1 if star1==1 & star3==2 & stark==2

gen attrition2=0
replace attrition2=1 if star2==1 & star3==2 & star1==2 & stark==2

**Creating class size dummy variables
**kintergarden
gen smallk=0
replace smallk=1 if ctypek==1
gen regulark=0
replace regulark=1 if ctypek==2
gen regular_aidek=0
replace regular_aidek=1 if ctypek==3

gen small1=0
replace small1=1 if ctype1==1
gen regular1=0
replace regular1=1 if ctype1==2
gen regular_aide1=0
replace regular_aide1=1 if ctype1==3

gen small2=0
replace small2=1 if ctype2==1
gen regular2=0
replace regular2=1 if ctype2==2
gen regular_aide2=0
replace regular_aide2=1 if ctype2==3

gen small3=0
replace small3=1 if ctype3==1
gen regular3=0
replace regular3=1 if ctype3==2
gen regular_aide3=0
replace regular_aide3=1 if ctype3==3

**Generating entry variables
gen entryk=0
replace entryk=1 if stark==1

gen entry1=0
replace entry1=1 if stark==2 & star1==1

gen entry2=0
replace entry2=1 if stark==2 & star1==2 & star2==1

gen entry3=0
replace entry3=1 if stark==2 & star1==2 & star2==2 & star3==1

** generating white or asian
gen whiteasian=0
replace whiteasian=1 if race==1|race==3

**generating girls
gen girl=0
replace girl=1 if sex==2

**generating age
gen age=1985-yob

**QUESTION 1- TABLE 1
sum freelunchk if entryk==1 & smallk==1
sum freelunchk if entryk==1 & regulark==1
sum freelunchk if entryk==1 & regular_aidek==1

sum freelunch1 if entry1==1 & small1==1
sum freelunch1 if entry1==1 & regular1==1
sum freelunch1 if entry1==1 & regular_aide1==1

sum freelunch2 if entry2==1 & small2==1
sum freelunch2 if entry2==1 & regular2==1
sum freelunch2 if entry2==1 & regular_aide2==1

sum freelunch3 if entry3==1 & small3==1
sum freelunch3 if entry3==1 & regular3==1
sum freelunch3 if entry3==1 & regular_aide3==1

sum whiteasian if entryk==1 & smallk==1
sum whiteasian if entryk==1 & regulark==1
sum whiteasian if entryk==1 & regular_aidek==1

sum whiteasian if entry1==1 & small1==1
sum whiteasian if entry1==1 & regular1==1
sum whiteasian if entry1==1 & regular_aide1==1

sum whiteasian if entry2==1 & small2==1
sum whiteasian if entry2==1 & regular2==1
sum whiteasian if entry2==1 & regular_aide2==1

sum whiteasian if entry3==1 & small3==1
sum whiteasian if entry3==1 & regular3==1
sum whiteasian if entry3==1 & regular_aide3==1

sum attritionk if entryk==1 & smallk==1
sum attritionk if entryk==1 & regulark==1
sum attritionk if entryk==1 & regular_aidek==1

sum attrition1 if entry1==1 & small1==1
sum attrition1 if entry1==1 & regular1==1
sum attrition1 if entry1==1 & regular_aide1==1


sum attrition2 if entry2==1 & small2==1
sum attrition2 if entry2==1 & regular2==1
sum attrition2 if entry2==1 & regular_aide2==1


sum girl if entryk==1 & smallk==1
sum girl if entryk==1 & regulark==1
sum girl if entryk==1 & regular_aidek==1

sum girl if entry1==1 & small1==1
sum girl if entry1==1 & regular1==1
sum girl if entry1==1 & regular_aide1==1

sum girl if entry2==1 & small2==1
sum girl if entry2==1 & regular2==1
sum girl if entry2==1 & regular_aide2==1

sum girl if entry3==1 & small3==1
sum girl if entry3==1 & regular3==1
sum girl if entry3==1 & regular_aide3==1

sum csizek if entryk==1 & smallk==1
sum csizek if entryk==1 & regulark==1
sum csizek if entryk==1 & regular_aidek==1

sum csize1 if entry1==1 & small1==1
sum csize1 if entry1==1 & regular1==1
sum csize1 if entry1==1 & regular_aide1==1

sum csize2 if entry2==1 & small2==1
sum csize2 if entry2==1 & regular2==1
sum csize2 if entry2==1 & regular_aide2==1

sum csize3 if entry3==1 & small3==1
sum csize3 if entry3==1 & regular3==1
sum csize3 if entry3==1 & regular_aide3==1

sum age if entryk==1 & smallk==1
sum age if entryk==1 & regulark==1
sum age if entryk==1 & regular_aidek==1

sum age if entry1==1 & small1==1
sum age if entry1==1 & regular1==1
sum age if entry1==1 & regular_aide1==1

sum age if entry2==1 & small2==1
sum age if entry2==1 & regular2==1
sum age if entry2==1 & regular_aide2==1

sum age if entry3==1 & small3==1
sum age if entry3==1 & regular3==1
sum age if entry3==1 & regular_aide3==1

**CALCULATING TEST SCORES
gen testk=0
replace testk =(mathk_p+readk_p)/2 if mathk_p>0 & readk_p>0
replace testk=mathk_p if mathk_p>0 & readk_p==.
replace testk=readk_p if readk_p>0 & mathk_p==.

gen test1=0
replace test1 =(math1_p+read1_p)/2 if math1_p>0 & read1_p>0
replace test1=math1_p if math1_p>0 & read1_p==.
replace test1=read1_p if read1_p>0 & math1_p==.

gen test2=0
replace test2 =(math2_p+read2_p)/2 if math2_p>0 & read2_p>0
replace test2=math2_p if math2_p>0 & read2_p==.
replace test2=read2_p if read2_p>0 & math2_p==.

gen test3=0
replace test3 =(math3_p+read3_p)/2 if math3_p>0 & read3_p>0
replace test3=math3_p if math3_p>0 & read3_p==.
replace test3=read3_p if read3_p>0 & math3_p==.


**CALCULATING AVERAGE PERCENtiLE SCORES
sum testk if entryk==1 & smallk==1
sum testk if entryk==1 & regulark==1
sum testk if entryk==1 & regular_aidek==1

sum test1 if entry1==1 & small1==1
sum test1 if entry1==1 & regular1==1
sum test1 if entry1==1 & regular_aide1==1

sum test2 if entry2==1 & small2==1
sum test2 if entry2==1 & regular2==1
sum test2 if entry2==1 & regular_aide2==1

sum test3 if entry3==1 & small3==1
sum test3 if entry3==1 & regular3==1
sum test3 if entry3==1 & regular_aide3==1



**QUESTION 2
**Kindergarten regressions and replacing values
replace smallk=. if stark==2
replace regulark=. if stark==2
replace regular_aidek=. if stark==2

replace smallk=. if ctypek==.
replace regulark=. if ctypek==.
replace regular_aidek=. if ctypek==.

**FREELUNCH
reg freelunchk smallk regular_aidek 
test smallk=regular_aidek
**WHITEASIAN
reg whiteasian smallk regular_aidek
test smallk=regular_aidek
**AGE
reg age smallk regular_aidek
test smallk=regular_aidek
**ATTRITION RATE
reg attritionk smallk regular_aidek
test smallk=regular_aidek
**CLASS SIZE
reg csizek smallk regular_aidek
test smallk=regular_aidek
**PERCENTAGE SCORES
reg testk smallk regular_aidek regulark
test smallk=regular_aidek

**First grade regressions and replacing values
replace small1=. if stark==2 & star1==2
replace regular1=. if stark==2 & star1==2
replace regular_aide1=. if stark==2 & star1==2

replace small1=. if stark==1 & star1==2
replace regular1=. if stark==1 & star1==2
replace regular_aide1=. if stark==1 & star1==2

replace small1=. if ctype1==.
replace regular1=. if ctype1==.
replace regular_aide1=. if ctype1==.

**FREELUNCH
reg freelunch1 small1 regular_aide1
test small1=regular_aide1
**WHITEASIAN
reg whiteasian small1 regular_aide1
test small1=regular_aide1
**AGE
reg age small1 regular_aide1 
test small1=regular_aide1
**ATTRITION RATE
reg attrition1 small1 regular_aide1 
test small1=regular_aide1
**CLASS SIZE
reg csize1 small1 regular_aide1 
test small1=regular_aide1
**Percentile Scores
reg test1 small1 regular_aide1 
test small1=regular_aide1

**Second grade Grade replacing the values
replace small2=. if stark==2 & star1==2 &star2==2
replace regular2=. if stark==2 & star1==2 & star2==2
replace regular_aide2=. if stark==2 & star1==2 & star2==2

replace small2=. if stark==2 & star1==1 & star2==2
replace regular2=. if stark==2 & star1==1 & star2==2
replace regular_aide2=. if stark==2 & star1==1 & star2==2

replace small2=. if stark==1 & star1==2 & star2==2
replace regular2=. if stark==1 & star1==2 & star2==2
replace regular_aide2=. if stark==1 & star1==2 & star2==2

replace small2=. if stark==1 & star1==1 & star2==2
replace regular2=. if stark==1 & star1==1 & star2==2
replace regular_aide2=. if stark==1 & star1==1 & star2==2

replace small2=. if ctype2==.
replace regular2=. if ctype2==.
replace regular_aide2=. if ctype2==.

**Second grade regressions without school dummy
**FREELUNCH
reg freelunch2 small2 regular_aide2
test small2=regular_aide2
**WHITEASIAN
reg whiteasian small2 regular_aide2
test small2=regular_aide2
**AGE
reg age small2 regular_aide2 regular2
test small2=regular_aide2
**ATTRITION RATE
reg attrition2 small2 regular_aide2 
test small2=regular_aide2
**CLASS SIZE
reg csize2 small2 regular_aide2 
test small2=regular_aide2
**Percentile Scores
reg test2 small2 regular_aide2 
test small2=regular_aide2

**Third grade Grade replacing the values
replace small3=. if stark==2 & star1==2 & star2==2 & star3==2
replace regular3=. if stark==2 & star1==2 & star2==2 & star3==2
replace regular_aide3=. if stark==2 & star1==2 & star2==2 & star3==2

replace small3=. if stark==2 & star1==1 & star2==2 & star3==2
replace regular3=. if stark==2 & star1==1 & star2==2 & star3==2
replace regular_aide3=. if stark==2 & star1==1 & star2==2 & star3==2

replace small3=. if stark==2 & star1==1 & star2==1 & star3==2
replace regular3=. if stark==2 & star1==1 & star2==1 & star3==2
replace regular_aide3=. if stark==2 & star1==1 & star2==1 & star3==2

replace small3=. if stark==1 & star1==1 & star2==2 & star3==2
replace regular3=. if stark==1 & star1==1 & star2==2 & star3==2
replace regular_aide3=. if stark==1 & star1==1 & star2==2 & star3==2

replace small3=. if stark==1 & star1==1 & star2==1 & star3==2
replace regular3=. if stark==1 & star1==1 & star2==1 & star3==2
replace regular_aide3=. if stark==1 & star1==1 & star2==1 & star3==2

replace small3=. if stark==1 & star1==2 & star2==1 & star3==2
replace regular3=. if stark==1 & star1==2 & star2==1 & star3==2
replace regular_aide3=. if stark==1 & star1==2 & star2==1 & star3==2

replace small3=. if stark==2 & star1==2 & star2==1 & star3==2
replace regular3=. if stark==2 & star1==2 & star2==1 & star3==2
replace regular_aide3=. if stark==2 & star1==2 & star2==1 & star3==2

replace small3=. if stark==1 & star1==2 & star2==2 & star3==2
replace regular3=. if stark==1 & star1==2 & star2==2 & star3==2
replace regular_aide3=. if stark==1 & star1==2 & star2==2 & star3==2

replace small3=. if ctype3==.
replace regular3=. if ctype3==.
replace regular_aide3=. if ctype3==.

**Third Grade regressions without dummies
**FREELUNCH
reg freelunch3 small3 regular_aide3 
test small3=regular_aide3
**WHITEASIAN
reg whiteasian small3 regular_aide3
test small3=regular_aide3
**AGE
reg age small3 regular_aide3  
test small3=regular_aide3
**ATTRITION RATE
**NA
**CLASS SIZE
reg csize3 small3 regular_aide3 
test small3=regular_aide3
**Percentile Scores
reg test3 small3 regular_aide3 
test small3=regular_aide3












**WITH SCHOOL DUMMIES
**KINDERGARTEN
**FREELUNCH
reg freelunchk smallk regular_aidek i.schidk
test smallk=regular_aidek
**WHITEASIAN
reg whiteasian smallk regular_aidek i.schidk
test smallk=regular_aidek
**AGE
reg age smallk regular_aidek i.schidk
test smallk=regular_aidek
**ATTRITION
reg attritionk smallk regular_aidek i.schidk
test smallk=regular_aidek
**CLASS SIZE
reg csizek smallk regular_aidek i.schidk
test smallk=regular_aidek
**PERCENTILE SCORES
reg testk smallk regular_aidek i.schidk
test smallk=regular_aidek

**FIRST GRADE
**FREELUNCH
reg freelunch1 small1 regular_aide1 i.schid1
test small1=regular_aide1
**WHITEASIAN
reg whiteasian small1 regular_aide1 i.schid1
test small1=regular_aide1
**AGE
reg age small1 regular_aide1 i.schid1
test small1=regular_aide1
**ATTRITION RATE
reg attrition1 small1 regular_aide1 i.schid1
test small1=regular_aide1
**CLASS SIZE
reg csize1 small1 regular_aide1 i.schid1
test small1=regular_aide1
**Percentile Scores
reg test1 small1 regular_aide1 i.schid1
test small1=regular_aide1

**SECOND GRADE

**FREELUNCH
reg freelunch2 small2 regular_aide2 i.schid2
test small2=regular_aide2
**WHITEASIAN
reg whiteasian small2 regular_aide2 i.schid2
test small2=regular_aide2
**AGE
reg age small2 regular_aide2 i.schid2
test small2=regular_aide2
**ATTRITION RATE
reg attrition2 small2 regular_aide2 i.schid2
test small2=regular_aide2
**CLASS SIZE
reg csize2 small2 regular_aide2 i.schid2
test small2=regular_aide2
**Percentile Scores
reg test2 small2 regular_aide2 i.schid2
test small2=regular_aide2

**THIRD GRADE
**FREELUNCH
reg freelunch3 small3 regular_aide3 i.schid3
test small3=regular_aide3
**WHITEASIAN
reg whiteasian small3 regular_aide3 i.schid3
test small3=regular_aide3
**AGE
reg age small3 regular_aide3 i.schid3
test small3=regular_aide3
**ATTRITION RATE
**NA
**CLASS SIZE
reg csize3 small3 regular_aide3 i.schid3
test small3=regular_aide3
**Percentile Scores
reg test3 small3 regular_aide3 i.schid3
test small3=regular_aide3

**QUESTION3
**Robust standard errors are used due to footnote
**KINTERGARDEN
reg testk smallk regular_aidek,robust
reg testk smallk regular_aidek i.schidk, robust
reg testk smallk regular_aidek whiteasian girl freelunchk i.schidk, robust
**FIRST GRADE
reg test1 small1 regular_aide1, robust
reg test1 small1 regular_aide1 i.schid1, robust
reg test1 small1 regular_aide1 whiteasian girl freelunchk i.schid1, robust

reg test2 small2 regular_aide2, robust
reg test2 small2 regular_aide2 i.schid2, robust
reg test2 small2 regular_aide2 whiteasian girl freelunchk i.schid2, robust

reg test3 small3 regular_aide3, robust
reg test3 small3 regular_aide3 i.schid3, robust
reg test3 small3 regular_aide3 whiteasian girl freelunchk i.schid3, robust


**QUESTION 4 
**4a
**- Kindergarten to first grade
sum id if smallk==1 & small1==1
sum id if smallk==1 & regular1==1
sum id if smallk==1 & regular_aide1==1

sum id if regulark==1 & small1==1
sum id if regulark==1 & regular1==1
sum id if regulark==1 & regular_aide1==1

sum id if regular_aidek==1 & small1==1
sum id if regular_aidek==1 & regular1==1
sum id if regular_aidek==1 & regular_aide1==1

**First grade to second grade 
sum id if small1==1 & small2==1
sum id if small1==1 & regular2==1
sum id if small1==1 & regular_aide2==1

sum id if regular1==1 & small2==1
sum id if regular1==1 & regular2==1
sum id if regular1==1 & regular_aide2==1

sum id if regular_aide1==1 & small2==1
sum id if regular_aide1==1 & regular2==1
sum id if regular_aide1==1 & regular_aide2==1

**Second grade to third grade
sum id if small2==1 & small3==1
sum id if small2==1 & regular3==1
sum id if small2==1 & regular_aide3==1

sum id if regular2==1 & small3==1
sum id if regular2==1 & regular3==1
sum id if regular2==1 & regular_aide3==1

sum id if regular_aide2==1 & small3==1
sum id if regular_aide2==1 & regular3==1
sum id if regular_aide2==1 & regular_aide3==1

**Question 4b
gen ctype_assigned=0
replace ctype_assigned=1 if ctypek==1
replace ctype_assigned=2 if ctypek==2
replace ctype_assigned=3 if ctypek==3

replace ctype_assigned=1 if ctypek==. & ctype1==1
replace ctype_assigned=2 if ctypek==. & ctype1==2
replace ctype_assigned=3 if ctypek==. & ctype1==3

replace ctype_assigned=1 if ctypek==. & ctype1==. & ctype2==1
replace ctype_assigned=2 if ctypek==. & ctype1==. & ctype2==2
replace ctype_assigned=3 if ctypek==. & ctype1==. & ctype2==3

replace ctype_assigned=1 if ctypek==. & ctype1==. & ctype2==. & ctype3==1
replace ctype_assigned=2 if ctypek==. & ctype1==. & ctype2==. & ctype3==2
replace ctype_assigned=3 if ctypek==. & ctype1==. & ctype2==. & ctype3==3

**Question 4c
corr ctype_assigned ctypek 
corr ctype_assigned ctype1
corr ctype_assigned ctype2
corr ctype_assigned ctype3
reg ctypek ctype_assigned
reg ctype1 ctype_assigned
reg ctype2 ctype_assigned
reg ctype3 ctype_assigned

**Question 4e
**KINTERGARDEN INITIAL ASSIGNMENT
gen small_assigned=0
replace small_assigned=1 if ctype_assigned==1

gen regular_assigned=0
replace regular_assigned=1 if ctype_assigned==2

gen regular_aide_assigned=0
replace regular_aide_assigned=1 if ctype_assigned==3

**IV REGRESSIONS
reg testk small_assigned regular_aide_assigned
ivregress 2sls test1 (small1 regular_aide1 = small_assigned regular_aide_assigned)
ivregress 2sls test2 (small2 regular_aide2 = small_assigned regular_aide_assigned)
ivregress 2sls test3 (small3 regular_aide3 = small_assigned regular_aide_assigned)
