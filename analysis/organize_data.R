#' ---
#' title: "Educational Attainment and Attitudes About Racism in the LGBTQ Community Among LGBTQ People of Color"
#' author: "Janeth Villa
output:
  pdf_document: default
html_document: default
#' ---

#load data
library(haven)
SJS <- read_sav("~/Desktop/Winter 2019/Stats 1/sjs_project/analysis/input/SJSData.sav")




#recode independent variable 1 (level of education)

SJS$educ[SJS$q22a=="REFUSED/BLANK"] <- NA
SJS$educ[SJS$q22a=="1"]<- "Less than HS"
SJS$educ[SJS$q22a=="2"]<- "HS"
SJS$educ[SJS$q22a=="3"|
SJS$q22a=="4"]<- "Some college"
SJS$educ[SJS$q22a=="5"]<- "Bachelors"
SJS$educ[SJS$q22a=="6" |
SJS$q22a== "7"]<- "Grad educ"

SJS$educ<- factor(SJS$educ, levels=c("Less than HS","HS","Some college", 
"Bachelors","Grad educ"))


#recode dependent variable 1 (belief that mainstream LGBT organizations are/are not doing enough work on racial equality)

SJS$racialeq[SJS$q7a=="REFUSED/BLANK"]<- NA
SJS$racialeq[SJS$q7a=="1"]<- "Not doing enough"
SJS$racialeq[SJS$q7a=="2"]<- "Doing enough"


SJS$racialeq<- factor(SJS$racialeq, levels=c("Not doing enough","Doing enough"))


#recode dependent variable 2 (level of comfort/discomfort in LGBT community bc of race)

SJS$comfort[SJS$q15b=="REFUSED/BLANK"]<- NA
SJS$comfort[SJS$q15b=="1"|
SJS$q15b=="2"]<-"Comfortable"
SJS$comfort[SJS$q15b=="5"|
SJS$q15b=="6"]<-"Uncomfortable"
SJS$comfort<- factor(SJS$comfort, levels=c("Comfortable",
"Uncomfortable"))



#recode control variables

#age
SJS$age[SJS$q18g=="REFUSED/BLANK"]<- NA
SJS$age[SJS$q18g=="1919"| SJS$q18g=="1920"| SJS$q18g=="1921"| SJS$q18g=="1922"| SJS$q18g=="1923"|
SJS$q18g=="1924"| SJS$q18g=="1925"| SJS$q18g=="1926"| SJS$q18g=="1927"| SJS$q18g=="1928"|
SJS$q18g=="1929"| SJS$q18g=="1930"| SJS$q18g=="1931"| SJS$q18g=="1932"| SJS$q18g=="1933"
| SJS$q18g=="1934"| SJS$q18g=="1935"| SJS$q18g=="1936"| SJS$q18g=="1937"| SJS$q18g=="1938"|   SJS$q18g=="1939"| SJS$q18g=="1940"]<- "Silent generation"

SJS$age[SJS$q18g=="1941"|SJS$q18g=="1942"|SJS$q18g=="1943"|SJS$q18g=="1944"|SJS$q18g=="1945"|SJS$q18g=="1946"|SJS$q18g=="1947"|SJS$q18g=="1948"|SJS$q18g=="1949"|SJS$q18g=="1950"|SJS$q18g=="1951"|SJS$q18g=="1952"|SJS$q18g=="1953"|SJS$q18g=="1954"|SJS$q18g=="1955"|SJS$q18g=="1956"|SJS$q18g=="1957"|SJS$q18g=="1958"|
SJS$q18g=="1959"|SJS$q18g=="1960"|SJS$q18g=="1961"|SJS$q18g=="1962"|SJS$q18g=="1963"|
SJS$q18g=="1964"]<-"Baby boomer"

SJS$age[SJS$q18g=="1965"|SJS$q18g=="1966"|SJS$q18g=="1967"|SJS$q18g=="1968"|SJS$q18g=="1969"|
SJS$q18g=="1970"|SJS$q18g=="1971"|SJS$q18g=="1972"|SJS$q18g=="1973"|SJS$q18g=="1974"|
SJS$q18g=="1975"|SJS$q18g=="1976"|SJS$q18g=="1977"|SJS$q18g=="1978"|SJS$q18g=="1979"]<-"Gen X"
SJS$age[SJS$q18g=="1980"|SJS$q18g=="1981"|SJS$q18g=="1982"|SJS$q18g=="1983"|SJS$q18g=="1984"|SJS$q18g=="1985"|SJS$q18g=="1986"|SJS$q18g=="1987"|SJS$q18g=="1988"|SJS$q18g=="1989"|SJS$q18g=="1990"|SJS$q18g=="1991"|
SJS$q18g=="1992"|SJS$q18g=="1993"|SJS$q18g=="1994"]<- "Millenial"

SJS$age[SJS$q18g=="1995"|SJS$q18g=="1996"|SJS$q18g=="1997"|SJS$q18g=="1998"]<-"Gen Z"

SJS$age<- factor(SJS$age, levels=c("Silent generation","Baby boomer",
"Gen X","Millenial","Gen Z"))


#race

SJS$race[SJS$q19a1=="1"]<-"Black"
SJS$race[SJS$q19a2=="1"]<-"Latinx"
SJS$race[SJS$q19a3=="1"]<-"API"
SJS$race[SJS$q19a4=="1"]<-"Native"
SJS$race[SJS$q19a6=="1"]<-"Multiracial"
SJS$race<- factor(SJS$race, levels=c("Black","Latinx",
"API","Native","Multiracial"))

#gender
SJS$gender[SJS$q18a1=="1"]<-"Men"
SJS$gender[SJS$q18a2=="1"]<-"Women"
SJS$gender[SJS$q18a3=="1"]<-"Trans mtf"
SJS$gender[SJS$q18a4=="1"]<-"Trans ftm"
SJS$gender[SJS$q18a5=="1"]<-"Other"
SJS$gender<- factor(SJS$gender, levels=c("Men","Women","Trans mtf","Trans ftm",
"Other"))

#political views
SJS$politics[SJS$q21a=="REFUSED/BLANK"]<- NA
SJS$politics[SJS$q21a=="1"]<-"Very liberal"
SJS$politics[SJS$q21a=="2"]<-"Liberal"
SJS$politics[SJS$q21a=="3"]<-"Slightly liberal"
SJS$politics[SJS$q21a=="4"]<-"Slightly conservative"
SJS$politics[SJS$q21a=="5"]<-"Conservative"
SJS$politics[SJS$q21a=="6"]<-"Very conservative"
SJS$politics<- factor(SJS$politics, levels=c("Very liberal","Liberal","Slightly liberal",
                                             "Slightly conservative","Conservative","Very conservative"))

