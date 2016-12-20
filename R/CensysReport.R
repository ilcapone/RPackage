
df_countries <- function(protocol = c("443.https","110.pop3.starttls","25.smtp.starttls","143.imap.starttls","995.pop3s","993.imaps")){
  protocol<-c("443.https")
  
  str_protocol<- paste(sep="",protocol,".tls.version:  ")

  library(countrycode)
  str_protocol_use<-paste(sep="",str_protocol,"\"TLSv1.2\"")
  result<-censys_report("ipv4", str_protocol_use,"location.country_code", 500)
  df_tls1.2<-result$results
  
  str_protocol_use<-paste(sep="",str_protocol,"\"TLSv1.1\"")
  result<-censys_report("ipv4", str_protocol_use,"location.country_code", 500)
  df_tls1.1<-result$results
  
  str_protocol_use<-paste(sep="",str_protocol,"\"TLSv1.0\"")
  result<-censys_report("ipv4", str_protocol_use,"location.country_code", 500)
  df_tls1.0<-result$results
  
  str_protocol_use<-paste(sep="",str_protocol,"\"SSLv3\"")
  result<-censys_report("ipv4", str_protocol_use,"location.country_code", 500)
  df_sslv3<-result$results
  
  df_total<-rbind(df_tls1.0,df_tls1.1,df_tls1.2,df_sslv3)
  
  df_total_por_TLS<-dplyr::full_join(df_tls1.0,df_tls1.1,by="key",fill=0)
  df_total_por_TLS<-dplyr::full_join(df_total_por_TLS,df_tls1.2,by="key",fill=0)
  df_total_por_TLS<-dplyr::full_join(df_total_por_TLS,df_sslv3,by="key",fill=0)
  
  colnames(df_total_por_TLS)<-c("key","TLSv1.0","TLSv1.1","TLSv1.2","SSLv3")
  
  df_total_por_TLS<-dplyr::mutate(df_total_por_TLS,Total=ifelse(is.na(TLSv1.0), 0, TLSv1.0)+ifelse(is.na(TLSv1.1), 0, TLSv1.1)+ifelse(is.na(TLSv1.2), 0, TLSv1.2)+ifelse(is.na(SSLv3), 0, SSLv3))  
  puntuacion<-c(TLSv1.2=10,TLSv1.1=7.5,TLSv1.0=5,SSLv3=2.5)
  df_total_por_TLS<-dplyr::mutate(df_total_por_TLS,puntuacion=(ifelse(is.na(TLSv1.2), 0, TLSv1.2)*puntuacion["TLSv1.2"]+ ifelse(is.na(TLSv1.1), 0, TLSv1.1)*puntuacion["TLSv1.1"]+ifelse(is.na(TLSv1.0), 0, TLSv1.0)*puntuacion["TLSv1.0"]+ifelse(is.na(SSLv3), 0, SSLv3)*puntuacion["SSLv3"]) /Total)
  
  return(df_total_por_TLS)
}


#-------------------------------CENSYS REPORTS--------------------------------------




