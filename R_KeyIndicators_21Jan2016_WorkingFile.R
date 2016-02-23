########################    R - ROUTINE FOR KEY INDICATORS    ###################### 

 
## 01. Download of data

GDP01_LCU_current <- read.csv("/home/ileeo/Scrivania/R_stuff/KeyIndicators_RacheleBrivio/001_GDP by Type of Expenditure at current prices - National currency.csv", header=T, sep=",")
GDP02_USD_current <- read.csv("/home/ileeo/Scrivania/R_stuff/KeyIndicators_RacheleBrivio/002_GDP by Type of Expenditure at current prices - US dollars.csv", header=T, sep=",")
GDP03_LCU_2005 <- read.csv("/home/ileeo/Scrivania/R_stuff/KeyIndicators_RacheleBrivio/003_GDP by Type of Expenditure at constant (2005) prices - National currency.csv", header=T, sep=",")
GDP04_USD_2005 <- read.csv("/home/ileeo/Scrivania/R_stuff/KeyIndicators_RacheleBrivio/004_GDP by Type of Expenditure at constant (2005) prices - US dollars.csv", header=T, sep=",")

GDPpercap05 <- read.csv("/home/ileeo/Scrivania/R_stuff/KeyIndicators_RacheleBrivio/005_Per capita GDP at current prices - US dollars.csv", header=T, sep=",")

GVA06_LCU_current <- read.csv("/home/ileeo/Scrivania/R_stuff/KeyIndicators_RacheleBrivio/006_Gross Value Added by Kind of Economic Activity at current prices - National currency.csv", header=T, sep=",")
GVA07_USD_current <- read.csv("/home/ileeo/Scrivania/R_stuff/KeyIndicators_RacheleBrivio/007_Gross Value Added by Kind of Economic Activity at current prices - US dollars.csv" , header=T, sep=",")
GVA08_LCU_2005 <- read.csv("/home/ileeo/Scrivania/R_stuff/KeyIndicators_RacheleBrivio/008_Gross Value Added by Kind of Economic Activity at constant (2005) prices - National currency.csv" , header=T, sep=",")
GVA09_USD_2005 <- read.csv("/home/ileeo/Scrivania/R_stuff/KeyIndicators_RacheleBrivio/009_Gross Value Added by Kind of Economic Activity at constant (2005) prices - US dollars.csv", header=T, sep=",")

GFCF010_LCU_current <- read.csv("/home/ileeo/Scrivania/R_stuff/KeyIndicators_RacheleBrivio/010_Gross Fixed Capital Formation by Type of Expenditure at current prices - National currency.csv", header=T, sep=",")
GFCF011_USD_current <- read.csv("/home/ileeo/Scrivania/R_stuff/KeyIndicators_RacheleBrivio/011_Gross Fixed Capital Formation by Type of Expenditure at current prices - US dollars.csv", header=T, sep=",")
GFCF012_LCU_2005 <- read.csv("/home/ileeo/Scrivania/R_stuff/KeyIndicators_RacheleBrivio/012_Gross Fixed Capital Formation by Type of Expenditure at constant (2005) prices - National currency.csv", header=T, sep=",")
GFCF013_USD_2005 <- read.csv("/home/ileeo/Scrivania/R_stuff/KeyIndicators_RacheleBrivio/013_Gross Fixed Capital Formation by Type of Expenditure at constant (2005) prices - US dollars.csv", header=T, sep=",")



## 02. Divide the Value of the files by 1 million (except for GDP per capita) - This way, Value is expressed in Millions

install.packages("dplyr")
library(dplyr)

GDP01_LCU_current_mutate <- mutate(GDP01_LCU_current, Value_millions=Value/1000000)   
GDP02_USD_current_mutate <- mutate(GDP02_USD_current, Value_millions=Value/1000000)
GDP03_LCU_2005_mutate <- mutate(GDP03_LCU_2005, Value_millions=Value/1000000)
GDP04_USD_2005_mutate <- mutate(GDP04_USD_2005, Value_millions=Value/1000000)

GVA06_LCU_current_mutate <- mutate(GVA06_LCU_current, Value_millions=Value/1000000)
GVA07_USD_current_mutate <- mutate(GVA07_USD_current, Value_millions=Value/1000000)
GVA08_LCU_2005_mutate <- mutate(GVA08_LCU_2005, Value_millions=Value/1000000)
GVA09_USD_2005_mutate <- mutate(GVA09_USD_2005, Value_millions=Value/1000000)

GFCF010_LCU_current_mutate <- mutate(GFCF010_LCU_current, Value_millions=Value/1000000)
GFCF011_USD_current_mutate <- mutate(GFCF011_USD_current, Value_millions=Value/1000000)
GFCF012_LCU_2005_mutate <- mutate(GFCF012_LCU_2005, Value_millions=Value/1000000)
GFCF013_USD_2005_mutate <- mutate(GFCF013_USD_2005, Value_millions=Value/1000000)


## 03. Deleting variable 'Value' that has become useless.

GDP01_LCU_current_mutate$Value <- NULL
GDP02_USD_current_mutate$Value <- NULL
GDP03_LCU_2005_mutate$Value <- NULL
GDP04_USD_2005_mutate$Value <- NULL

GVA06_LCU_current_mutate$Value <- NULL
GVA07_USD_current_mutate$Value <- NULL
GVA08_LCU_2005_mutate$Value <- NULL
GVA09_USD_2005_mutate$Value <- NULL

GFCF010_LCU_current_mutate$Value <- NULL 
GFCF011_USD_current_mutate$Value <- NULL
GFCF012_LCU_2005_mutate$Value <- NULL
GFCF013_USD_2005_mutate$Value <- NULL




## 04. Selecting the variables we are interested in.

GDP_LCU_current.1 <- subset(GDP01_LCU_current_mutate, Item=="Gross Domestic Product (GDP)")
GDP_USD_current.1 <- subset(GDP02_USD_current_mutate, Item=="Gross Domestic Product (GDP)")
GDP_LCU_2005.1 <- subset(GDP03_LCU_2005_mutate, Item=="Gross Domestic Product (GDP)")
GDP_USD_2005.1 <- subset(GDP04_USD_2005_mutate, Item=="Gross Domestic Product (GDP)")

GDPpercap05.1 <- subset(GDPpercap05, Item=="Gross Domestic Product (GDP)")

GVA_LCU_current.1 <- subset(GVA06_LCU_current_mutate, Item=="Agriculture, hunting, forestry, fishing (ISIC A-B)")
GVA_USD_current.1 <- subset(GVA07_USD_current_mutate, Item=="Agriculture, hunting, forestry, fishing (ISIC A-B)")
GVA_LCU_2005.1 <- subset(GVA08_LCU_2005_mutate, Item=="Agriculture, hunting, forestry, fishing (ISIC A-B)")
GVA_USD_2005.1 <- subset(GVA09_USD_2005_mutate, Item=="Agriculture, hunting, forestry, fishing (ISIC A-B)")

GFCF_LCU_current.1 <- subset(GFCF010_LCU_current_mutate, Item=="Gross fixed capital formation (including Acquisitions less disposals of valuables)")
GFCF_USD_current.1 <- subset(GFCF011_USD_current_mutate, Item=="Gross fixed capital formation (including Acquisitions less disposals of valuables)")
GFCF_LCU_2005.1 <- subset(GFCF012_LCU_2005_mutate, Item=="Gross fixed capital formation (including Acquisitions less disposals of valuables)")
GFCF_USD_2005.1 <- subset(GFCF013_USD_2005_mutate, Item=="Gross fixed capital formation (including Acquisitions less disposals of valuables)")


## 05 Reshaping the object in 'wide' format.

install.packages("reshape2")
library(reshape2)

GDP_LCU_current.2 <- dcast(GDP_LCU_current.1, Country.or.Area + Year ~ Item, value.var="Value_millions")
GDP_USD_current.2 <- dcast(GDP_USD_current.1, Country.or.Area + Year ~ Item, value.var="Value_millions")
GDP_LCU_2005.2 <- dcast(GDP_LCU_2005.1, Country.or.Area + Year ~ Item, value.var="Value_millions")
GDP_USD_2005.2 <- dcast(GDP_USD_2005.1, Country.or.Area + Year ~ Item, value.var="Value_millions")

GDPpercap05_USD <- dcast(GDPpercap05, Country.or.Area + Year ~ Item, value.var="Value")

GVA_LCU_current.2 <- dcast(GVA_LCU_current.1, Country.or.Area + Year ~ Item, value.var="Value_millions")
GVA_USD_current.2 <- dcast(GVA_USD_current.1, Country.or.Area + Year ~ Item, value.var="Value_millions")
GVA_LCU_2005.2 <- dcast(GVA_LCU_2005.1, Country.or.Area + Year ~ Item, value.var="Value_millions")
GVA_USD_2005.2 <- dcast(GVA_USD_2005.1, Country.or.Area + Year ~ Item, value.var="Value_millions")

GFCF_LCU_current.2 <- dcast(GFCF_LCU_current.1, Country.or.Area + Year ~ Item, value.var="Value_millions")
GFCF_USD_current.2 <- dcast(GFCF_USD_current.1, Country.or.Area + Year ~ Item, value.var="Value_millions")
GFCF_LCU_2005.2 <- dcast(GFCF_LCU_2005.1, Country.or.Area + Year ~ Item, value.var="Value_millions")
GFCF_USD_2005.2 <- dcast(GFCF_USD_2005.1, Country.or.Area + Year ~ Item, value.var="Value_millions")



## 06. Changing the new variable's name.

install.packages("data.table")
library(data.table)

setnames(GDP_LCU_current.2, "Gross Domestic Product (GDP)", "GDP")
setnames(GDP_USD_current.2, "Gross Domestic Product (GDP)", "GDP_USD")
setnames(GDP_LCU_2005.2, "Gross Domestic Product (GDP)", "GDP_2005")
setnames(GDP_USD_2005.2, "Gross Domestic Product (GDP)", "GDP_USD2005")

setnames(GDPpercap05_USD, "Gross Domestic Product (GDP)", "GDP_percap_USD")

setnames(GVA_LCU_current.2, "Agriculture, hunting, forestry, fishing (ISIC A-B)", "AFF_VA")
setnames(GVA_USD_current.2, "Agriculture, hunting, forestry, fishing (ISIC A-B)", "AFF_VA_USD")
setnames(GVA_LCU_2005.2, "Agriculture, hunting, forestry, fishing (ISIC A-B)", "AFF_VA2005")
setnames(GVA_USD_2005.2, "Agriculture, hunting, forestry, fishing (ISIC A-B)", "AFF_VA_USD2005")

setnames(GFCF_LCU_current.2, "Gross fixed capital formation (including Acquisitions less disposals of valuables)", "GFCF")
setnames(GFCF_USD_current.2, "Gross fixed capital formation (including Acquisitions less disposals of valuables)", "GFCF_USD")
setnames(GFCF_LCU_2005.2, "Gross fixed capital formation (including Acquisitions less disposals of valuables)", "GFCF_2005")
setnames(GFCF_USD_2005.2, "Gross fixed capital formation (including Acquisitions less disposals of valuables)", "GFCF_USD2005")



## 07. Merging all the objects into one.
GDPmerge1 <- merge(GDP_LCU_current.2, GDP_USD_current.2, by=c("Country.or.Area", "Year"),all=TRUE) 
GDPmerge2 <- merge(GDP_LCU_2005.2, GDP_USD_2005.2, by=c("Country.or.Area", "Year"),all=TRUE)
GDPmerge <- merge(GDPmerge1, GDPmerge2, by=c("Country.or.Area", "Year"),all=TRUE)

GDP <- merge(GDPmerge, GDPpercap05_USD, by=c("Country.or.Area", "Year"),all=TRUE)

GVAmerge1 <- merge(GVA_LCU_current.2, GVA_USD_current.2, by=c("Country.or.Area", "Year"),all=TRUE)
GVAmerge2 <- merge(GVA_LCU_2005.2, GVA_USD_2005.2, by=c("Country.or.Area", "Year"),all=TRUE)
GVA <- merge(GVAmerge1, GVAmerge2, by=c("Country.or.Area", "Year"), all=TRUE)

GFCFmerge1 <- merge(GFCF_LCU_current.2, GFCF_USD_current.2, by=c("Country.or.Area", "Year"),all=TRUE)
GFCFmerge2 <- merge(GFCF_LCU_2005.2, GFCF_USD_2005.2, by=c("Country.or.Area", "Year"),all=TRUE)
GFCF <- merge(GFCFmerge1, GFCFmerge2, by=c("Country.or.Area", "Year"),all=TRUE)

GVA_GFCF <- merge(GVA, GFCF, by=c("Country.or.Area", "Year"),all=TRUE)

KeyIndicatorsVariables <- merge(GDP, GVA_GFCF, by=c("Country.or.Area", "Year"),all=TRUE)




## 08. Adding new variables including calculations based on the original variables. 

KeyIndicators <- mutate(KeyIndicatorsVariables, 
                        Def_GDP =GDP/GDP_2005, 
                        Def_GDP_USD =GDP_USD/GDP_USD2005,
                        Def_GFCF = GFCF/GFCF_2005,
                        Def_GFCF_USD =GFCF_USD/GFCF_USD2005,
                        Def_AFF_VA = AFF_VA/AFF_VA2005,
                        Def_AFF_VA_USD = AFF_VA_USD/AFF_VA_USD2005,
                        EX_Rate_USD = GDP/GDP_USD,
                        INV_Ratio_USD = GFCF_USD/GDP_USD,
                        INV_Ratio_USD2005 =GFCF_USD2005/GDP_USD2005,
                        AFF_VA_GDPShare_USD =AFF_VA_USD/GDP_USD,
                        AFF_VA_GDPShare_USD2005 =AFF_VA_USD2005/GDP_USD2005,
                        Population_thousands = GDP_USD*1000/GDP_percap_USD,
                        GDP_percap_USD2005=GDP_USD2005*1000/Population_thousands)




## 09. Setting a new name for the 'Country.or.Area'  variable (= 'Country').

setnames(KeyIndicators, "Country.or.Area", "Country")




## 10. Creation of a copy of the KeyIndicators file and changing of the Country names into FAOSTAT Contry names:

install.packages("DataCombine")
library(DataCombine)
install.packages("car")
library(car)
install.packages("plyr")
library(plyr)

KeyIndicators.names <- KeyIndicators

KeyIndicators.names$Country <- mapvalues(KeyIndicators.names$Country, from=c("Bolivia", 
                                                                             "Former Ethiopia", 
                                                                             "Former Sudan", 
                                                                             "Former USSR",
                                                                             "Former Yugoslavia", 
                                                                             "Iran, Islamic Republic of", 
                                                                             "Netherlands Antilles (former)",
                                                                             "United Kingdom of Great Britain and Northern Ireland", 
                                                                             "United Republic of Tanzania: Mainland", 
                                                                             "United States",
                                                                             "China: Hong Kong SAR",
                                                                             "China: Macao SAR"), 
                                         to=c("Bolivia (Plurinational State of)",
                                              "Ethiopia PDR",
                                              "Sudan",
                                              "USSR",
                                              "Yugoslav SFR",
                                              "Iran (Islamic Republic of)",
                                              "Netherlands Antilles",
                                              "United Kingdom",
                                              "United Republic of Tanzania",
                                              "United States of America",
                                              "China, Hong Kong SAR",
                                              "China, Macao SAR"))




## 11. Deleting the Country names not included in FAOSTAT and the former Countries in order to avoid double-countings.

KeyIndicators.names.1 <- KeyIndicators.names[!KeyIndicators.names$Country=="United Republic of Tanzania: Zanzibar", ]
KeyIndicators.names.1 <- KeyIndicators.names.1[!KeyIndicators.names.1$Country=="Yemen: Former Democratic Yemen", ]
KeyIndicators.names.1 <- KeyIndicators.names.1[!KeyIndicators.names.1$Country=="Yemen: Former Yemen Arab Republic", ]

KeyIndicators.names.1 <- KeyIndicators.names.1[!(KeyIndicators.names.1$Country=="USSR" & KeyIndicators.names.1$Year==1990), ]
KeyIndicators.names.1 <- KeyIndicators.names.1[!(KeyIndicators.names.1$Country=="Czechoslovakia" & KeyIndicators.names.1$Year==1990), ]
KeyIndicators.names.1 <- KeyIndicators.names.1[!(KeyIndicators.names.1$Country=="Yugoslav SFR" & KeyIndicators.names.1$Year==1990), ]

KeyIndicators.names.1 <- KeyIndicators.names.1[!(KeyIndicators.names.1$Country=="Ethiopia PDR" & KeyIndicators.names.1$Year==1990), ]
KeyIndicators.names.1 <- KeyIndicators.names.1[!(KeyIndicators.names.1$Country=="Ethiopia PDR" & KeyIndicators.names.1$Year==1991), ]
KeyIndicators.names.1 <- KeyIndicators.names.1[!(KeyIndicators.names.1$Country=="Ethiopia PDR" & KeyIndicators.names.1$Year==1992), ]
KeyIndicators.names.1 <- KeyIndicators.names.1[!(KeyIndicators.names.1$Country=="Ethiopia PDR" & KeyIndicators.names.1$Year==1993), ]



## 12. Importing FAOSTAT codes file and merging it with Key Indicator's Country names

IND_Flatfile2015 <- read.csv("/home/ileeo/Scrivania/R_stuff/KeyIndicators_RacheleBrivio/IND_Flatfile2015.csv", header=T)
IND_Flatfile2015_select<- subset(IND_Flatfile2015, select=c("Country", "Year", "FAOCode", "region", "regioncode", "region2", "subregion", "subregioncode", "developing", "LLDC", "LDC", "LIFDC", "NFIDC", "SIDS", "OECD", "EU", "MAFAP", "BRICS", "FAO_member"))
KeyIndicators_FAOSTAT <- merge(KeyIndicators.names.1, IND_Flatfile2015_select, by=c("Country", "Year"),all.x=TRUE)
colnames(IND_Flatfile2015_select)[colnames(IND_Flatfile2015_select)=="GDP_percap_USD"] <- "GDP_percap_USD_FAO"
KeyIndicators_FAOSTAT <- merge(KeyIndicators.names.1, IND_Flatfile2015_select, by=c("Country", "Year"))



## 13. Changing the variables' order

KeyIndicators_FAOSTAT.1 <- KeyIndicators_FAOSTAT  # backup Copy of the 'KeyIndicators_FAOSTAT' object

install.packages("DataCombine")
library(DataCombine)


KeyIndicators_FAOSTAT.1 <- KeyIndicators_FAOSTAT.1[c(28,1,2,3,4,6,5,27,7,12,14,13,15,8,10,9,11,23,24,25,26,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,16,17,18,19,20,21,22)]    # Changing variables' order




## 14. Adding growth rates for GDP_USD and GDP_USD2005 and ordering those new variables according to our needs

# Please, export KeyIndicators_FAOSTAT.1 and do a quick check in Excel that row
# ordering in terms of Years is ok. In particular, no years missing/gap within series
# write.csv(KeyIndicators_FAOSTAT.1,file="KeyIndicators_FAOSTAT.1.csv",row.names=FALSE)

KeyIndicators_FAOSTAT.1_Growth <-transform(KeyIndicators_FAOSTAT.1, GDP_growth_USD=ave(GDP_USD, Country, 
                                                                                       FUN=function(x) c(NA,exp(diff(log(x)))-1)))
KeyIndicators_FAOSTAT.1_Growth.a <-transform(KeyIndicators_FAOSTAT.1_Growth, GDP_growth_USD2005=ave(GDP_USD2005, Country, 
                                                                                                    FUN=function(x) c(NA,exp(diff(log(x)))-1)))

KeyIndicators_FAOSTAT.1_OrderedVariables <- KeyIndicators_FAOSTAT.1_Growth.a [c(
                                                                                "Country",
                                                                                "Year",
                                                                                "GDP",
                                                                                "GDP_USD",
                                                                                "GDP_USD2005",
                                                                                "GDP_2005",
                                                                                "GDP_growth_USD",
                                                                                "GDP_growth_USD2005",
                                                                                "Population_thousands",
                                                                                "GDP_percap_USD",
                                                                                "GDP_percap_USD2005",
                                                                                "GFCF",
                                                                                "GFCF_2005",
                                                                                "GFCF_USD",
                                                                                "GFCF_USD2005",
                                                                                "AFF_VA",
                                                                                "AFF_VA2005",
                                                                                "AFF_VA_USD",
                                                                                "AFF_VA_USD2005",
                                                                                "INV_Ratio_USD",
                                                                                "INV_Ratio_USD2005",
                                                                                "AFF_VA_GDPShare_USD",
                                                                                "AFF_VA_GDPShare_USD2005",
                                                                                "FAOCode",
                                                                                "region",
                                                                                "regioncode",
                                                                                "region2",
                                                                                "subregion",
                                                                                "subregioncode",
                                                                                "developing",
                                                                                "LLDC",
                                                                                "LDC",
                                                                                "LIFDC",
                                                                                "NFIDC",
                                                                                "SIDS",
                                                                                "OECD",
                                                                                "EU",
                                                                                "MAFAP",                                                                                                                                                                            "Def_GDP",
                                                                                "Def_GDP_USD",
                                                                                "Def_GFCF",
                                                                                "Def_GFCF_USD",
                                                                                "Def_AFF_VA",
                                                                                "Def_AFF_VA_USD",
                                                                                "EX_Rate_USD")]




View(KeyIndicators_FAOSTAT.1_OrderedVariables)




## 15. Ordering the dataset per both Country and Year

KeyIndicators_FAOSTAT_order <- with(KeyIndicators_FAOSTAT.1_OrderedVariables, order(Country, -Year))

KI <- KeyIndicators_FAOSTAT.1_OrderedVariables[KeyIndicators_FAOSTAT_order, ]


View(KI)                                 ## FINAL FILE ####
