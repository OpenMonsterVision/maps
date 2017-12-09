#Get Accidental Drug Deaths, and plot location on a map
accDeathSed <- read.csv("accDeathsed.csv",stringsAsFactors = FALSE)
#Get the map from the internet, This is the data needed to create it
accDeathMap <- get_map(location = "connecticut",maptype = "roadmap", zoom = 9)
# This renders the map as a ... well map
accDeathMapGG <- ggmap(accDeathMap)
accDeathMapGG + 
 geom_point(data = accDeathSed, aes(x = long, y = lat), color = "black", size = 3, alpha = .4) +
 geom_point(data = accDeathSed, aes(x = long, y = lat), color = "red", size = 2,alpha = .2) +
  xlab(label = "Longitude") +
  ylab(label = "Latitude") +
  ggtitle("Accidental Drug Deaths",subtitle = "Connecticut") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text( hjust = 0.5))
