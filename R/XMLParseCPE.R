

#install.packages("XML")
#install.packages("plyr")
#install.packages("ggplot2")
#install.packages("gridExtra")

require("XML")
require("plyr")
require("ggplot2")
require("gridExtra")

#library("XML")
#library("plyr")
#library("ggplot2")
#library("gridExtra")

fileUrl= "C:/Program Files/R/CountryVulnerabilities/data/official-cpe-dictionary_v2.3.xml"
doc<-xmlParse(fileUrl)
rootNode<-xmlRoot(doc)

Madhu2012=ldply(xmlToList(fileUrl), data.frame)

