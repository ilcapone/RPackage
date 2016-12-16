

############## Query builder ##################

library("ggplot2")

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
