
df_countries <- function(protocol = c("443.https")){
  str_protocol<- protocol
  
  if (protocol == "443.https") {
    library(countrycode)
    result<-censys_report("ipv4", "443.https.tls.version: \"TLSv1.0\"","location.country_code", 500)
    df_tls1.0<-result$results
    
    result<-censys_report("ipv4", "443.https.tls.version: \"TLSv1.1\"","location.country_code", 500)
    df_tls1.1<-result$results
    
    result<-censys_report("ipv4", "443.https.tls.version: \"TLSv1.2\"","location.country_code", 500)
    df_tls1.2<-result$results
    
    result<-censys_report("ipv4", "443.https.tls.version: \"SSLv3\"","location.country_code", 500)
    df_sslv3<-result$results
    
    df_total<-rbind(df_tls1.0,df_tls1.1,df_tls1.2,df_sslv3)
    
    df_total_por_TLS<-dplyr::full_join(df_tls1.0,df_tls1.1,by="key",fill=0)
    df_total_por_TLS<-dplyr::full_join(df_total_por_TLS,df_tls1.2,by="key",fill=0)
    df_total_por_TLS<-dplyr::full_join(df_total_por_TLS,df_sslv3,by="key",fill=0)
    
    colnames(df_total_por_TLS)<-c("key","TLSv1.0","TLSv1.1","TLSv1.2","SSLv3")
    
    df_total_por_TLS<-dplyr::mutate(df_total_por_TLS,Total=ifelse(is.na(TLSv1.0), 0, TLSv1.0)+ifelse(is.na(TLSv1.1), 0, TLSv1.1)+ifelse(is.na(TLSv1.2), 0, TLSv1.2)+ifelse(is.na(SSLv3), 0, SSLv3))  
  }
  
  return(df_total_por_TLS)
}


#-------------------------------CENSYS REPORTS--------------------------------------




