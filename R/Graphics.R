

############## Graphics ##################


library("raster")
adm<-getData('GADM', country='ESP', level=4)
cat<-(adm[adm$NAME_1=="",])
plot(cat, bg="dodgerblue", axes=T)
plot(cat, lwd=10, border="skyblue", add=T)
plot(cat, col="green4", add=T)
grid()
cat$valors<-rnorm(1:length(cat$NAME_4), 10, 3)
plot(cat, col=cat$valors, add=T)

library(ggmap)
library(maptools)
library(maps)

ej<-get_map(location="España", source="google", maptype="terrain", zoom=5)
ggmap(ej)
ej<-get_map(location=c(right=-85, left=-121, bottom=13, top=33), source="osm", color="bw")
ggmap(ej)

#myLocation <- "University of Washington"
myLocation <- c(lon = -95.3632715, lat = 29.7632836)
#myLocation <- c(-130, 30, -105, 50)
#geocode("University of Washington")
myMap <- get_map(location=myLocation, source="google", maptype="hybrid", zoom=5)
ggmap(myMap)
#ggmap(myMap)+geom_point(aes(x = Longitude, y = Latitude), data = data, alpha = .5, color="darkred", size = 3)
geom_point(aes(x = lon, y = lat, size = offense, colour = offense), data = )
ggmap(myMap)

wordMap<-get_map(location="Europe", source="google", maptype="satellite", zoom=3)
ggmap(wordMap)

library(rworldmap)
newmap <- getMap(resolution = "low")
plot(newmap, xlim = c(-20, 59), ylim = c(35, 71), asp = 1)

map("world", fill=TRUE, col="white", bg="lightblue", ylim=c(-60, 90), mar=c(0,0,0,0))
points(long_V1.2,lat_V1.2, col="red", pch=16)


