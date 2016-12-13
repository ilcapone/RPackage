

library(httr)
library(censys)
library(purrr)
library(dplyr)

Sys.setenv(CENSYS_API_ID = "a995ad09-8f97-4e2b-bfc0-17376f1587f3", CENSYS_API_SECRET = "cqCj7NI9CqhFB4vnfUQH77vpVsYyWyMJ")


CENSYS_API_URL <- "https://www.censys.io/api/v1/"

check_api <- function() {
  
  id <- Sys.getenv("CENSYS_API_ID")
  secret <- Sys.getenv("CENSYS_API_SECRET")
  
  if (id == "" | secret == "") {
    stop("Both CENSYS_API_ID and CENSYS_API_SECRET must be present in the R environment.")
  }
  
  return(httr::authenticate(id, secret))
  
}


censys_search <- function(index=c("ipv4", "websites", "certificates"),
                          query, page=1, fields=NULL) {
  
  index <- match.arg(index, c("ipv4", "websites", "certificates"))
  
  result <- httr::POST(CENSYS_API_URL %s+% "search/" %s+% index, body=list(query=query,page=page, fields=fields), encode="json", check_api())
  
  httr::stop_for_status(result)
  
  srs <- jsonlite::fromJSON(content(result, as="text"), flatten=TRUE)
  
  class(srs) <- c("censys_srch_res", class(srs))
  
  srs
  
}

censys_data <- censys_search("ipv4", "80.http.get.headers.server: Apache", 2, c("ip", "location.country", "autonomous_system.asn"))
