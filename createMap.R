#Get Accidental Drug Deaths, and plot location on a map
accDeathSed <- read.csv("accDeathsed.csv",stringsAsFactors = FALSE)
accDeathMap <- get_map(location = "connecticut",maptype = "roadmap")
accDeathMapGG <- ggmap(accDeathMap)
accDeathMapGG + 
  geom_point(data = accDeathSed, aes(x = long, y = lat), color = "black", size = 3) +
  geom_point(data = accDeathSed, aes(x = long, y = lat), color = "red", size = 2)


#Get Philadelphia Crime Map
philCrimeData <- read.csv("~/Downloads/crime.csv",stringsAsFactors = FALSE)
# Get Philly Map, Zoom in slightly
philCrimeMap <- get_map(location = "philadelphia",maptype = "roadmap", zoom = 12)
#Create Map
philCrimeMapGG <- ggmap(philCrimeMap)
#Plot Dots on Map
philCrimeMapGG + 
#Add Murdery Dots
  #Very Transparent black dot, for darkening and border
  geom_point(data = philCrimeData[grep(pattern = "Homicide",philCrimeData$Text_General_Code),], aes(x = Lon, y = Lat), color = "black", size = 1, alpha = 0.05) +
  #Actual Murder Dot
  geom_point(data = philCrimeData[grep(pattern = "Homicide",philCrimeData$Text_General_Code),], aes(x = Lon, y = Lat), color = "red", size = 0.5, alpha = 0.2) + 
  #Very Transparent black dot, for darkening and border
  geom_point(data = philCrimeData[which( philCrimeData$Text_General_Code == 'Rape' ),], aes(x = Lon, y = Lat), color = "black", size = 1, alpha = 0.05) +
  #Rape Dot
  geom_point(data = philCrimeData[which( philCrimeData$Text_General_Code == 'Rape' ),], aes(x = Lon, y = Lat), color = "green", size = 0.5, alpha = 0.2)

