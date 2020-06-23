swirl()
getwd()
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileURL, destfile = "/Users/arunvenkatraman/Desktop/Coursera_R/Testing/ProgAssignmentWeek4/ProgAssignmentWeek4/datum.csv" , method = "curl")
list.files()
datum <- read.csv("datum.csv")
library("codebook")
a <- datum$FES
sum(is.nan(a))
a
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileURL, destfile = "FData.xlsx", method = "curl")

fileURL <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
install.packages("XML")
library("XML")
DatXML <- xmlTreeParse(fileURL, useInternal = TRUE)
rootNode <- xmlRoot(DatXML)
xmlName(rootNode)
DatXML
zipc <- xpathSApply(rootNode, "//zipcode", xmlValue)
zipcod <- zipc == "21231"
sum(zipcod)
fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileURL, destfile = "CData.csv", method = "curl")
DT <- read.table("CData.csv", sep = ",")

mean(DT$pwgtp15,by=DT$SEX)


rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2]


tapply(DT$pwgtp15,DT$SEX,mean)


DT[,mean(pwgtp15),by=SEX]


mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)


sapply(split(DT$pwgtp15,DT$SEX),mean)


install.packages("RMySQL")
library(RMySQL)

UcscDB <- dbConnect(MySQL(), user = "genome", 
                    host = "genome-mysql.cse.ucsc.edu")
result <- dbGetQuery(UcscDB, "show databases;"); dbDisconnect(UcscDB);
result

UcscDB <- dbConnect(MySQL(), user = "genome", db ="hg19",
                    host = "genome-mysql.cse.ucsc.edu")
AllTables <- dbListTables(UcscDB)
length(AllTables)
AllTables[1:5]
dbDisconnect(UcscDB)
