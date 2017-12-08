#Get Accidental Drug Deaths, and plot location on a map
accDeathSed <- read.csv("accDeathsed.csv",stringsAsFactors = FALSE)
accDeathMap <- get_map(location = "connecticut",maptype = "roadmap")
accDeathMapGG <- ggmap(accDeathMap)
accDeathMapGG + 
  geom_point(data = accDeathSed, aes(x = long, y = lat), color = "black", size = 3) +
  geom_point(data = accDeathSed, aes(x = long, y = lat), color = "red", size = 2)


#Get Philadelphia Crime Map
philCrimeData <- read.csv("~/Downloads/crime.csv",stringsAsFactors = FALSE)
philCrimeMap <- get_map(location = "philadelphia",maptype = "roadmap")
philCrimeMapGG <- ggmap(philCrimeMap)

#Plot Murder points on map
philCrimeMapGG + 
  geom_point(data = philCrimeData[grep(pattern = "Homicide",philCrimeData$Text_General_Code),], aes(x = Lon, y = Lat), color = "black", size = 3) +
  geom_point(data = philCrimeData[grep(pattern = "Homicide",philCrimeData$Text_General_Code),], aes(x = Lon, y = Lat), color = "red", size = 2)

