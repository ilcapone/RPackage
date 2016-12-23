

############## CEMSYS QUERY ##################


countries_https <- df_countries("443.https")
countries_pop3 <- df_countries("110.pop3.starttls")
countries_smtp <- df_countries("25.smtp.starttls")
countries_imap <- df_countries("143.imap.starttls")

mostSecures <- filter(countries_https, countries_https$puntuacion > 8.5)
ordenados_seguros <-mostSecures[rev(order(mostSecures$puntuacion)),]
ordenados_seguros$key

mostSecures <- filter(countries_https, countries_https$puntuacion < 5.5)
ordenados_inseguros <-mostSecures[rev(order(mostSecures$puntuacion)),]
ordenados_inseguros$key





