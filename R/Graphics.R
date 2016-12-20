

############## Graphics ##################


#library("raster")
#adm<-getData('GADM', country='ESP', level=4)
#cat<-(adm[adm$NAME_1=="Cataluña",])
#plot(cat, bg="dodgerblue", axes=T)
#plot(cat, lwd=10, border="skyblue", add=T)
#plot(cat, col="green4", add=T)
#grid()
#cat$valors<-rnorm(1:length(cat$NAME_4), 10, 3)
#plot(cat, col=cat$valors, add=T)

#library(ggmap)
#library(maptools)
#library(maps)

#ej<-get_map(location="España", source="google", maptype="terrain", zoom=5)
#ggmap(ej)
#ej<-get_map(location=c(right=-85, left=-121, bottom=13, top=33), source="osm", color="bw")
#ggmap(ej)

#myLocation <- "University of Washington"
#myLocation <- c(lon = -95.3632715, lat = 29.7632836)
#myLocation <- c(-130, 30, -105, 50)
#geocode("University of Washington")
#myMap <- get_map(location=myLocation, source="google", maptype="hybrid", zoom=5)
#ggmap(myMap)
#ggmap(myMap)+geom_point(aes(x = Longitude, y = Latitude), data = data, alpha = .5, color="darkred", size = 3)
#geom_point(aes(x = lon, y = lat, size = offense, colour = offense), data = )
#ggmap(myMap)

#wordMap<-get_map(location="Europe", source="google", maptype="satellite", zoom=3)
#ggmap(wordMap)


library(rworldmap)
sPDF <- joinCountryData2Map( countries , joinCode = "ISO2" , nameJoinColumn = "key")
#mapCountryData( sPDF, nameColumnToPlot="puntuacion" )

#par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
#'Vhigh', 'High','Med', 'Low'

#creating a user defined colour palette
op <- palette(c('red','orange','yellow','green'))
#find quartile breaks
cutVector <- quantile(sPDF@data[["puntuacion"]],na.rm=TRUE)
#classify the data to a factor
sPDF@data[["puntuacion_categories"]] <- cut(sPDF@data[["puntuacion"]], cutVector, include.lowest=TRUE )
#rename the categories
levels(sPDF@data[["puntuacion_categories"]]) <- c('Vhigh', 'High','Med', 'Low')
#mapping
mapCountryData( sPDF, nameColumnToPlot='puntuacion_categories' , catMethod='categorical' , mapTitle='TLS Vulneravilities' , colourPalette='palette', oceanCol='lightblue', missingCountryCol='white')




#map("world", fill=TRUE, col="white", bg="lightblue", ylim=c(-60, 90), mar=c(0,0,0,0))
#points(long_V1.2,lat_V1.2, col="red", pch=16)
#points(long_V1.1,lat_V1.1, col="blue", pch=16)
#points(long_V1.0,lat_V1.0, col="yellow", pch=16)

##############

#library(ggplot2)
#qplot(x = location.continent, y = n, data = b)
#qplot(x = location.continent, data = mpg, fill= drv)

#g <- qplot(x = key, y = SSLv3 , data = countries)
#g <- ggplot(countries, aes(key, SSLv3, color = class))
#g + geom_bar()


