
############## CEMSYS AUTH ##################


devtools::install_github("hrbrmstr/censys")

library(httr)
library(censys)
library(purrr)
library("XML")
library("plyr")
library("ggplot2")
library("gridExtra")
library(dplyr)

Sys.setenv(CENSYS_API_ID = "950dd34b-a475-4ac3-af0d-e39c8a0f4946", CENSYS_API_SECRET = "HlHy4bCBlIYHScZ1JExmai1m3EsOCDOI")


CENSYS_API_URL <- "https://www.censys.io/api/v1/"
