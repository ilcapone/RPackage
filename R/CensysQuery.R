

############## CEMSYS SEARCH ##################

#check_api <- function() {

#  id <- Sys.getenv("CENSYS_API_ID")
#  secret <- Sys.getenv("CENSYS_API_SECRET")

#  if (id == "" | secret == "") {
#   stop("Both CENSYS_API_ID and CENSYS_API_SECRET must be present in the R environment.")
# }

#  return(httr::authenticate(id, secret))

#}

#
#censys_search <- function(index=c("ipv4", "websites", "certificates"),
#                          query, page=1, fields=NULL) {
#
#  index <- match.arg(index, c("ipv4", "websites", "certificates"))

# result <- httr::POST(CENSYS_API_URL %s+% "search/" %s+% index, body=list(query=query,page=page, fields=fields), encode="json", check_api())

#  httr::stop_for_status(result)

#  srs <- jsonlite::fromJSON(content(result, as="text"), flatten=TRUE)

#  class(srs) <- c("censys_srch_res", class(srs))

#  srs

#}
#-----------------------------------------------------------------


devtools::install_github("hrbrmstr/censys")

library(httr)
library(censys)
library(purrr)
library("XML")
library("plyr")
library("ggplot2")
library("gridExtra")
library(dplyr)

#950dd34b-a475-4ac3-af0d-e39c8a0f4946
#HlHy4bCBlIYHScZ1JExmai1m3EsOCDOI
Sys.setenv(CENSYS_API_ID = "950dd34b-a475-4ac3-af0d-e39c8a0f4946", CENSYS_API_SECRET = "HlHy4bCBlIYHScZ1JExmai1m3EsOCDOI")

#Sys.setenv(CENSYS_API_ID = "a995ad09-8f97-4e2b-bfc0-17376f1587f3", CENSYS_API_SECRET = "cqCj7NI9CqhFB4vnfUQH77vpVsYyWyMJ")

CENSYS_API_URL <- "https://www.censys.io/api/v1/"

#location.country_code: DE and protocols: ("23/telnet" or "21/ftp")
#25.smtp.starttls.tls.cipher_suite.name
#censys_data <- censys_search("ipv4", "location.country_code: DE and protocols: (\"23/telnet\" or \"21/ftp\")", 2, c("ip", "location.country", "autonomous_system.asn", "location.latitude", "location.longitude"))
#censys_data_TLS_NULL <- censys_search("ipv4", "25.smtp.starttls.tls.cipher_suite.id: 0x000000	", 2, c("ip", "location.country", "autonomous_system.asn", "location.latitude", "location.longitude","25.smtp.starttls.tls.version","25.smtp.starttls.tls.cipher_suite.name"))
#censys_data_TLS_NULL <- censys_search("ipv4", "25.smtp.starttls.tls.cipher_suite.id: 0x000001	", 2, c("ip", "location.country", "autonomous_system.asn", "location.latitude", "location.longitude","25.smtp.starttls.tls.version","25.smtp.starttls.tls.cipher_suite.name"))
#protocols: ("443/https" or "993/imaps" or "995/pop3s")

#censys_data <- censys_search("ipv4", "not 443.https.tls.validation.browser_trusted: true", 2, c("ip", "location.country", "autonomous_system.asn", "location.latitude", "location.longitude"))
#censys_data_TLS <- censys_search("ipv4", "25.smtp.starttls.tls.cipher_suite.id: 0x0035", 2, c("ip", "location.country", "autonomous_system.asn", "location.latitude", "location.longitude","25.smtp.starttls.tls.version","25.smtp.starttls.tls.cipher_suite.name"))
#censys_data_hhtps<- censys_search("ipv4", "protocols: (\"443/https\")", 2, c("ip", "location.country", "autonomous_system.asn", "location.latitude", "location.longitude","443.https.tls.version"))
#censys_data_imaps <- censys_search("ipv4", "protocols: (\"993/imaps\")", 2, c("ip", "location.country", "autonomous_system.asn", "location.latitude", "location.longitude","993.imaps.tls.tls.version"))
#censys_data_pop3s <- censys_search("ipv4", "protocols: (\"995/pop3s\")", 2, c("ip", "location.country", "autonomous_system.asn", "location.latitude", "location.longitude","995.pop3s.tls.tls.version"))
#--------------
censys_data_TLSv1.0_https <- censys_search("ipv4", "443.https.tls.version: \"TLSv1.0\"", 2, c("ip", "location.continent", "autonomous_system.asn", "location.latitude", "location.longitude"))
version <- rep("TLSv1.0", 100)
protocol <- rep("htps", 100)
censys_data_TLSv1.0_https$results <- cbind(censys_data_TLSv1.0_https$results,version)
censys_data_TLSv1.0_https$results <- cbind(censys_data_TLSv1.0_https$results,protocol)
Dataframe_TLSv1.0_https <- select(censys_data_TLSv1.0_https$results, location.continent, version, protocol)


censys_data_TLSv1.1_https <- censys_search("ipv4", "443.https.tls.version: \"TLSv1.1\"", 2, c("ip", "location.continent", "autonomous_system.asn", "location.latitude", "location.longitude"))
version <- rep("TLSv1.1", 100)
protocol <- rep("htps", 100)
censys_data_TLSv1.1_https$results <- cbind(censys_data_TLSv1.1_https$results,version)
censys_data_TLSv1.1_https$results <- cbind(censys_data_TLSv1.1_https$results,protocol)
Dataframe_TLSv1.1_https <- select(censys_data_TLSv1.1_https$results, location.continent, version, protocol)

censys_data_TLSv1.2_https <- censys_search("ipv4", "443.https.tls.version: \"TLSv1.2\"", 2, c("ip", "location.continent", "autonomous_system.asn", "location.latitude", "location.longitude"))
version <- rep("TLSv1.2", 100)
protocol <- rep("htps", 100)
censys_data_TLSv1.2_https$results <- cbind(censys_data_TLSv1.2_https$results,version)
censys_data_TLSv1.2_https$results <- cbind(censys_data_TLSv1.2_https$results,protocol)
Dataframe_TLSv1.2_https <- select(censys_data_TLSv1.2_https$results, location.continent, version, protocol)

censys_data_SSLv3_https <- censys_search("ipv4", "443.https.tls.version: \"SSLv3\"", 2, c("ip", "location.continent", "autonomous_system.asn", "location.latitude", "location.longitude"))
version <- rep("SSLv3", 100)
protocol <- rep("htps", 100)
censys_data_SSLv3_https$results <- cbind(censys_data_SSLv3_https$results,version)
censys_data_SSLv3_https$results <- cbind(censys_data_SSLv3_https$results,protocol)
Dataframe_SSLv3_https <- select(censys_data_SSLv3_https$results, location.continent, version, protocol)

#--------------
censys_data_TLSv1.0_imaps <- censys_search("ipv4", "993.imaps.tls.tls.version: \"TLSv1.0\"", 2, c("ip", "location.continent", "autonomous_system.asn", "location.latitude", "location.longitude"))
version <- rep("TLSv1.0", 100)
protocol <- rep("imaps", 100)
censys_data_TLSv1.0_imaps$results <- cbind(censys_data_TLSv1.0_imaps$results,version)
censys_data_TLSv1.0_imaps$results <- cbind(censys_data_TLSv1.0_imaps$results,protocol)
Dataframe_TLSv1.0_imaps <- select(censys_data_TLSv1.0_imaps$results, location.continent, version, protocol)

censys_data_TLSv1.1_imaps <- censys_search("ipv4", "993.imaps.tls.tls.version: \"TLSv1.1\"", 2, c("ip", "location.continent", "autonomous_system.asn", "location.latitude", "location.longitude"))
version <- rep("TLSv1.1", 100)
protocol <- rep("imaps", 100)
censys_data_TLSv1.1_imaps$results <- cbind(censys_data_TLSv1.1_imaps$results,version)
censys_data_TLSv1.1_imaps$results <- cbind(censys_data_TLSv1.1_imaps$results,protocol)
Dataframe_TLSv1.1_imaps <- select(censys_data_TLSv1.1_imaps$results, location.continent, version, protocol)

censys_data_TLSv1.2_imaps <- censys_search("ipv4", "993.imaps.tls.tls.version: \"TLSv1.2\"", 2, c("ip", "location.continent", "autonomous_system.asn", "location.latitude", "location.longitude"))
version <- rep("TLSv1.0", 100)
protocol <- rep("imaps", 100)
censys_data_TLSv1.2_imaps$results <- cbind(censys_data_TLSv1.2_imaps$results,version)
censys_data_TLSv1.2_imaps$results <- cbind(censys_data_TLSv1.2_imaps$results,protocol)
Dataframe_TLSv1.2_imaps <- select(censys_data_TLSv1.2_imaps$results, location.continent, version, protocol)

censys_data_SSLv3_imaps <- censys_search("ipv4", "993.imaps.tls.tls.version: \"SSLv3\"", 2, c("ip", "location.continent", "autonomous_system.asn", "location.latitude", "location.longitude"))
version <- rep("SSLv3", 100)
protocol <- rep("imaps", 100)
censys_data_SSLv3_imaps$results <- cbind(censys_data_SSLv3_imaps$results,version)
censys_data_SSLv3_imaps$results <- cbind(censys_data_SSLv3_imaps$results,protocol)
Dataframe_SSLv3_imaps <- select(censys_data_SSLv3_imaps$results, location.continent, version, protocol)

#--------------
censys_data_TLSv1.0_pop3s <- censys_search("ipv4", "995.pop3s.tls.tls.version: \"TLSv1.0\"", 2, c("ip", "location.continent", "autonomous_system.asn", "location.latitude", "location.longitude"))
version <- rep("TLSv1.0", 100)
protocol <- rep("pop3s", 100)
censys_data_TLSv1.0_pop3s$results <- cbind(censys_data_TLSv1.0_pop3s$results,version)
censys_data_TLSv1.0_pop3s$results <- cbind(censys_data_TLSv1.0_pop3s$results,protocol)
Dataframe_TLSv1.0_pop3s <- select(censys_data_TLSv1.0_pop3s$results, location.continent, version, protocol)

censys_data_TLSv1.1_pop3s <- censys_search("ipv4", "995.pop3s.tls.tls.version: \"TLSv1.1\"", 2, c("ip", "location.continent", "autonomous_system.asn", "location.latitude", "location.longitude"))
version <- rep("TLSv1.1", 100)
protocol <- rep("pop3s", 100)
censys_data_TLSv1.1_pop3s$results <- cbind(censys_data_TLSv1.1_pop3s$results,version)
censys_data_TLSv1.1_pop3s$results <- cbind(censys_data_TLSv1.1_pop3s$results,protocol)
Dataframe_TLSv1.1_pop3s <- select(censys_data_TLSv1.1_pop3s$results, location.continent, version, protocol)

censys_data_TLSv1.2_pop3s <- censys_search("ipv4", "995.pop3s.tls.tls.version: \"TLSv1.2\"", 2, c("ip", "location.continent", "autonomous_system.asn", "location.latitude", "location.longitude"))
version <- rep("TLSv1.2", 100)
protocol <- rep("pop3s", 100)
censys_data_TLSv1.2_pop3s$results <- cbind(censys_data_TLSv1.2_pop3s$results,version)
censys_data_TLSv1.2_pop3s$results <- cbind(censys_data_TLSv1.2_pop3s$results,protocol)
Dataframe_TLSv1.2_pop3s <- select(censys_data_TLSv1.2_pop3s$results, location.continent, version, protocol)

censys_data_SSLv3_pop3s <- censys_search("ipv4", "995.pop3s.tls.tls.version: \"SSLv3\"", 2, c("ip", "location.continent", "autonomous_system.asn", "location.latitude", "location.longitude"))
version <- rep("SSLv3", 100)
protocol <- rep("pop3s", 100)
censys_data_SSLv3_pop3s$results <- cbind(censys_data_SSLv3_pop3s$results,version)
censys_data_SSLv3_pop3s$results <- cbind(censys_data_SSLv3_pop3s$results,protocol)
Dataframe_SSLv3_pop3s <- select(censys_data_SSLv3_pop3s$results, location.continent, version, protocol)

Full_Dataframe <- bind_rows(Dataframe_SSLv3_https, Dataframe_SSLv3_imaps, Dataframe_SSLv3_pop3s, Dataframe_TLSv1.0_https, Dataframe_TLSv1.0_imaps, Dataframe_TLSv1.0_pop3s, Dataframe_TLSv1.1_https, Dataframe_TLSv1.1_imaps, Dataframe_TLSv1.1_pop3s, Dataframe_TLSv1.1_pop3s, Dataframe_TLSv1.2_https, Dataframe_TLSv1.2_imaps, Dataframe_TLSv1.2_pop3s)





#censys_data_TLS_NULL <- censys_search("ipv4", "25.smtp.starttls.tls.cipher_suite.id: 0x000002	", 2, c("ip", "location.country", "autonomous_system.asn", "location.latitude", "location.longitude","25.smtp.starttls.tls.version","25.smtp.starttls.tls.cipher_suite.name"))
#column <- 25.smtp.starttls.tls.version
#+tls_V1.2 <- filter(censys_data_TLS$results, grepl(pattern= ".*TLSv1.2.*", x=`25.smtp.starttls.tls.version`, ignore.case=T))
#tls_V1.0 <- filter(censys_data_TLS$results, grepl(pattern= ".*TLSv1.0.*", x=`25.smtp.starttls.tls.version`, ignore.case=T))
#tls_V1.1 <- filter(censys_data_TLS$results, grepl(pattern= ".*TLSv1.1.*", x=`25.smtp.starttls.tls.version`, ignore.case=T))
###
#https_tls_V1.2 <- filter(censys_data_TLS$results, grepl(pattern= ".*TLSv1.2.*", x=`443.https.tls.version`, ignore.case=T))
#https_tls_V1.0 <- filter(censys_data_TLS$results, grepl(pattern= ".*TLSv1.0.*", x=`443.https.tls.version`, ignore.case=T))
#https_tls_V1.1 <- filter(censys_data_TLS$results, grepl(pattern= ".*TLSv1.1.*", x=`443.https.tls.version`, ignore.case=T))
#imaps_tls_V1.2 <- filter(censys_data_TLS$results, grepl(pattern= ".*TLSv1.2.*", x=`993.imaps.tls.tls.version`, ignore.case=T))
#imaps_tls_V1.0 <- filter(censys_data_TLS$results, grepl(pattern= ".*TLSv1.0.*", x=`993.imaps.tls.tls.version`, ignore.case=T))
#imaps_tls_V1.1 <- filter(censys_data_TLS$results, grepl(pattern= ".*TLSv1.1.*", x=`993.imaps.tls.tls.version`, ignore.case=T))
#pop3s_tls_V1.2 <- filter(censys_data_TLS$results, grepl(pattern= ".*TLSv1.2.*", x=`995.pop3s.tls.tls.version`, ignore.case=T))
#pop3s_tls_V1.0 <- filter(censys_data_TLS$results, grepl(pattern= ".*TLSv1.0.*", x=`995.pop3s.tls.tls.version`, ignore.case=T))
#pop3s_tls_V1.1 <- filter(censys_data_TLS$results, grepl(pattern= ".*TLSv1.1.*", x=`995.pop3s.tls.tls.version`, ignore.case=T))



#tls_V1.2 <- select(censys_data_TLS$results, `25.smtp.starttls.tls.version`)
#censys_data$results
#View(censys_data$results)
View(censys_data_TLS$results)
#View(censys_data_TLS_NULL$results)

long_V1.2 <- tls_V1.2$location.longitude
long_V1.0 <- tls_V1.0$location.longitude
long_V1.1 <- tls_V1.1$location.longitude
lat_V1.0 <- tls_V1.0$location.latitude
lat_V1.1 <- tls_V1.1$location.latitude
lat_V1.2 <- tls_V1.2$location.latitude

#Cout de nº of servers with TLS_v1.0 in a specific county
length(which(tls_V1.0$location.country == "Japan"))
length(which(tls_V1.0$location.country == "Romania"))
length(which(tls_V1.0$location.country == "Canada"))
length(which(tls_V1.0$location.country == "Unite States"))
length(which(tls_V1.0$location.country == "United States"))
length(which(tls_V1.0$location.country == "China"))
length(which(tls_V1.0$location.country == "Germany"))
length(which(tls_V1.0$location.country == "Taiwan"))

#Cout de nº of servers with TLS_v1.2 in a specific county
length(which(tls_V1.0$location.country == "Japan"))
length(which(tls_V1.0$location.country == "Romania"))
length(which(tls_V1.0$location.country == "Canada"))
length(which(tls_V1.0$location.country == "Unite States"))
length(which(tls_V1.0$location.country == "United States"))
length(which(tls_V1.0$location.country == "China"))
length(which(tls_V1.0$location.country == "Germany"))
length(which(tls_V1.0$location.country == "Taiwan"))

#Cout de nº of servers with TLS_v1.0 in a specific county
length(which(tls_V1.0$location.country == "Japan"))
length(which(tls_V1.0$location.country == "Romania"))
length(which(tls_V1.0$location.country == "Canada"))
length(which(tls_V1.0$location.country == "Unite States"))
length(which(tls_V1.0$location.country == "United States"))
length(which(tls_V1.0$location.country == "China"))
length(which(tls_V1.0$location.country == "Germany"))
length(which(tls_V1.0$location.country == "Taiwan"))




