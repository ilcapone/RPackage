temp_join <- full_join(temp2, temp3, by = cls)
temp_join$cvss
class(temp_join$cvss)
temp_join$cvss  <- as.character(tmp$cvss)
temp_join$cvss  <- as.character(temp$cvss)
temp_join <- full_join(temp2, temp3, by = cls)
temp_join$cvss  <- as.character(temp_join$cvss)
class(temp_join$cvss)
rjson::fromJSON(temp_join$cvss[1])
class(rjson::fromJSON(temp_join$cvss[1]))
temp_join$cvss  <- rjson::fromJSON(as.character(temp_join$cvss))
temp_join$cvss[1]
temp_join$cvss[1]$base_metrics$score
temp_join$cvss[3]$base_metrics$score
