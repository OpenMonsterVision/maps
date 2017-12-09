library("ggplot2")
library("ggmap")



#Get Philadelphia Crime Data, this takes a while
philCrimeData <- read.csv("~/Downloads/crime.csv",stringsAsFactors = FALSE)
# Get Philly Map, Zoom in slightly
philCrimeMap <- get_map(location = "philadelphia",maptype = "roadmap", zoom = 12)
#Create Map
philCrimeMapGG <- ggmap(philCrimeMap) 
#Create My Address
me <- data.frame(
  Lon = c(-75.112021),
  Lat = c(39.991058),
  Crime = "Me",
  stringsAsFactors = FALSE
)

#Data Needs to be arranged so that the legend prints properly
#Create rapes table
rapes <- philCrimeData[which( philCrimeData$Text_General_Code == 'Rape' ),]
rapes <- rapes[,c("Lat","Lon")]
#Create Crime Col
rapes$Crime <- "Rapes"
#Create Murders Table
murders <- philCrimeData[grep(pattern = "Homicide",philCrimeData$Text_General_Code),]
murders <- murders[,c("Lat","Lon")]
#Create Crime Col
murders$Crime <- "Homicides"
#Bind Tables
Crimes <- rbind(rapes, murders)
#Add Dots
pngf <- philCrimeMapGG +
  #Make Crime dots, There's a lot So make them Transparent
  geom_point(show.legend = TRUE,data = Crimes, aes(x = Lon, y = Lat, color = Crime),size = 0.5, alpha = 0.2) +
  #Make An Outline for the Me dot, 1 unit bigger than the me dot, Don't want this to show up in the legend, Not Transparent
  geom_point(show.legend = NA,data = me, aes(x = Lon, y = Lat), color = "black", size = 3) +
  #Make the Me dot, size 2 compared to our .5 dot Crime dots, Not Transparent
  geom_point(show.legend = TRUE,data = me, aes(x = Lon, y = Lat, color = Crime), size = 2)
#The Legend is created Automagically, By utilizing the Crimes and Me Tables data Structure
#The colors for Murders and Rapes are automagically assigned, Except the Me dot which is specified
final <- pngf +
  xlab(label = "Longitude") +
  ylab(label = "Latitude") +
  ggtitle("Philly",subtitle = "Criminal Activity") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text( hjust = 0.5))

png(filename = 'Philly.png',width=1280, height=1280)
print(final)
dev.off()
