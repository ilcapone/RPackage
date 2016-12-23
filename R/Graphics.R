

############## Graphics ##################



library(ggplot2)
library(rworldmap)

paint_map <- function(countries){
  
  library(rworldmap)
  par(mai=c(0,0,0.2,0),xaxs="i",yaxs="i")
  sPDF <- joinCountryData2Map( countries , joinCode = "ISO2" , nameJoinColumn = "key")
  op <- palette(c('red','orange','yellow','green'))
  cutVector <- quantile(sPDF@data[["puntuacion"]],na.rm=TRUE)
  sPDF@data[["puntuacion_categories"]] <- cut(sPDF@data[["puntuacion"]], cutVector, include.lowest=TRUE )
  levels(sPDF@data[["puntuacion_categories"]]) <- c('Vhigh', 'High','Med', 'Low')
  mapCountryData( sPDF, nameColumnToPlot='puntuacion_categories' , catMethod='categorical' , mapTitle='TLS Vulneravilities' , colourPalette='palette',  oceanCol='lightblue', missingCountryCol='white')
  
}

qplot(x = key, y = puntuacion, data = ordenados_seguros)
qplot(x = key, y = puntuacion, data = ordenados_inseguros)

