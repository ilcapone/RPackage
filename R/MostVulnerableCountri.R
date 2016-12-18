

############## Query builder ##################

#0x000000,0x000001,0x000002,0x000003,0x000004,0x000005,0x000006,0x000007,0x000008,0x000009,0x00000A,0x00000B,0x00000C,0x00000D,0x00000E,0x00000F
#
#
#
#
#
#
#


library("XML")
library("plyr")
library("ggplot2")
library("gridExtra")

QC_ServiceTipe <- function(Servertipe)
{
  httpServerTipe <- paste("80.http.get.headers.server:", Servertipe, sep=" ")
  httpServerTipe
}


QC_ProtocolandPort <- function(protocol, port)
{
  #TODO create a sofisticate SHEARCH
  portsandProtocol <- paste('\"',port, "/", protocol,'\"', sep="")
  protocols <- paste("and protocols:", portsandProtocol, sep=" ")
  protocols
}


QC_ <- function()
{
  #TODO create a sofisticate SHEARCH
  portsandProtocol <- paste('\"',port, "/", protocol,'\"', sep="")
  protocols <- paste("and protocols:", portsandProtocol, sep=" ")
  protocols
}
