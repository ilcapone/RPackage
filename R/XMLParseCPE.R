

#install.packages("XML")
#install.packages("plyr")
#install.packages("ggplot2")
#install.packages("gridExtra")

devtools::install_github(repo = "r-net-tools/net.security")

#require("XML")
#require("plyr")
#require("ggplot2")
#require("gridExtra")

library("XML")
library("plyr")
library("ggplot2")
library("gridExtra")


fileUrl= "data/official-cpe-dictionary_v2.3.xml"
fileUr2= "data/cves.xml"
#doc<-xmlParse(fileUrl)
treedoc = xmlRoot(xmlTreeParse(fileUr2))
xmlName(treedoc)
xmlSApply(treedoc,xmlValue)

ldply(xmlToList(treedoc), data.frame)
#rootNode<-xmlRoot(doc)

#xmlToDataFrame( getNodeSet(doc, "//value"),  colClasses=c("character","numeric"))

#cpe <- ldply(xmlToList(fileUrl), data.frame)

#Madhu2012=ldply(xmlToList(fileUrl), data.frame)

