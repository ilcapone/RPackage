
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

Sys.setenv(CENSYS_API_ID = "", CENSYS_API_SECRET = "")


CENSYS_API_URL <- "https://www.censys.io/api/v1/"
