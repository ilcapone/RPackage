
############## r-net-tools/net.security  ##################

#View(cpes)

#str(cves)
#head(cves$cvss)
#head(cves$cpe.software)
#jsonlite::fromJSON(cves$cpe.softwar[3])
#class(cves$cpe.softwar[3])
#jsonlite::fromJSON(as.character(cves$cpe.softwar[3]))
#temp <- filter(cves, grepl(pattern= ".*TLS.*", x="." , ignore.case=T))
#-----------------------------------------------------------------

devtools::install_github(repo = "r-net-tools/net.security")
library(net.security)
View(cves)
#Serch for description
temp2 <- filter(cves, grepl(pattern= ".*TLS.*", x=description, ignore.case=T))

#Serch for cpe.sofware
temp3 <- filter(cves, grepl(pattern= ".*TLS.*", x=cpe.software, ignore.case=T))
#TODO c(list from CVEs rows)
#temp_join <- full_join(temp2, temp3, by = "cve")
