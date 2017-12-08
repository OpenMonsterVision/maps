accDeathSed <- read.csv("accDeathsed.csv",stringsAsFactors = FALSE)
accDeathMap <- get_map(location = "connecticut",maptype = "roadmap")
accDeathMapGG <- ggmap(accDeathMap)
accDeathMapGG + 
  geom_point(data = accDeathSed, aes(x = long, y = lat), color = "black", size = 3) +
  geom_point(data = accDeathSed, aes(x = long, y = lat), color = "red", size = 2)
