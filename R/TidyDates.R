#temp_join <- full_join(temp2, temp3, by = cls)
#temp_join$cvss
#class(temp_join$cvss)
#temp_join$cvss  <- as.character(tmp$cvss)
#temp_join$cvss  <- as.character(temp$cvss)

#temp_join <- full_join(temp2, temp3, by = cls)
#temp_join$cvss  <- as.character(temp_join$cvss)
#class(temp_join$cvss)
#rjson::fromJSON(temp_join$cvss[1])
#class(rjson::fromJSON(temp_join$cvss[1]))
#temp_join$cvss  <- rjson::fromJSON(as.character(temp_join$cvss))
#temp_join$cvss[1]
#temp_join$cvss[1]$base_metrics$score
#temp_join$cvss[3]$base_metrics$score

## Creating new tidy data frames

a  <- as.character(TLSv1.0_Dataframe$location.continent)
a <- TLSv1.0_Dataframe
a$location.continent <- as.character(a$location.continent)
Count_TLSv1.0 <-  dplyr::count(a, location.continent)

v  <- as.character(TLSv1.1_Dataframe$location.continent)
v <- TLSv1.1_Dataframe
v$location.continent <- as.character(v$location.continent)
Count_TLSv1.1 <-  dplyr::count(v, location.continent)

y  <- as.character(TLSv1.2_Dataframe$location.continent)
y <- TLSv1.2_Dataframe
y$location.continent <- as.character(y$location.continent)
Count_TLSv1.2 <-  dplyr::count(y, location.continent)

k  <- as.character(SSLv3_Dataframe$location.continent)
k <- SSLv3_Dataframe
k$location.continent <- as.character(k$location.continent)
Count_SSLv3 <-  dplyr::count(k, location.continent)

Full_Dataframe <- bind_rows(a, Dataframe_SSLv3_imaps, Dataframe_SSLv3_pop3s, Dataframe_TLSv1.0_https, Dataframe_TLSv1.0_imaps, Dataframe_TLSv1.0_pop3s, Dataframe_TLSv1.1_https, Dataframe_TLSv1.1_imaps, Dataframe_TLSv1.1_pop3s, Dataframe_TLSv1.2_https, Dataframe_TLSv1.2_imaps, Dataframe_TLSv1.2_pop3s)

