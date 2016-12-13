

#install.packages("XML")
#install.packages("plyr")
#install.packages("ggplot2")
#install.packages("gridExtra")

#require("XML")
#require("plyr")
#require("ggplot2")
#require("gridExtra")

library("XML")
library("plyr")
library("ggplot2")
library("gridExtra")

fileUrl= "C:/Program Files/R/CountryVulnerabilities/data/official-cpe-dictionary_v2.3.xml"
#doc<-xmlParse(fileUrl)
treedoc = xmlRoot(xmlTreeParse(fileUrl))
xmlName(treedoc)
xmlSApply(treedoc,xmlValue)

#rootNode<-xmlRoot(doc)

#xmlToDataFrame( getNodeSet(doc, "//value"),  colClasses=c("character","numeric"))

#cpe <- ldply(xmlToList(fileUrl), data.frame)

#Madhu2012=ldply(xmlToList(fileUrl), data.frame)

