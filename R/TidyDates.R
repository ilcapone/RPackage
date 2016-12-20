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
glimpse(a)
b <-  dplyr::count(a, location.continent)
View(b)
v  <- as.character(TLSv1.1_Dataframe$location.continent)
v <- TLSv1.1_Dataframe
v$location.continent <- as.character(v$location.continent)
glimpse(v)
w <-  dplyr::count(v, location.continent)
view(v)
View(w)
y  <- as.character(TLSv1.2_Dataframe$location.continent)
y <- TLSv1.2_Dataframe
y$location.continent <- as.character(y$location.continent)
z <-  dplyr::count(y, location.continent)
View(z)
k  <- as.character(SSLv3_Dataframe$location.continent)
k <- SSLv3_Dataframe
k$location.continent <- as.character(k$location.continent)
m <-  dplyr::count(k, location.continent)
