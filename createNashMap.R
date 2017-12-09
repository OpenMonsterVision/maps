library("ggplot2")
library("ggmap")

#Get Nashville Adult Data
nashAdultData <- read.csv("~/data/adult2.csv",stringsAsFactors = FALSE)
# Get Nashville Map
nashAdultMap <- get_map(location = "nashville",maptype = "roadmap", zoom = 12)
#Create Map
nashAdultMapGG <- ggmap(nashAdultMap) 
#Create My Address
me <- data.frame(
  Long = c(-86.74),
  Lat = c(36.22),
  AdultBusiness = "Me",
  stringsAsFactors = FALSE
)
adultGPS <- nashAdultData[,c("Lat","Long")]
adultGPS$AdultBusiness <- "Adult Business"
AdultCommerce <- rbind(me, adultGPS)
final <- nashAdultMapGG +
  geom_point(show.legend = FALSE,data = AdultCommerce, aes(x = Long, y = Lat),size = 3, color = "black") +
  geom_point(show.legend = TRUE,data = AdultCommerce, aes(x = Long, y = Lat, color = AdultBusiness),size = 2) +
  xlab(label = "Longitude") +
  ylab(label = "Latitude") +
  ggtitle("Registered Adult Businesses",subtitle = "Nashville") +
  theme(plot.title = element_text(hjust = 0.5), plot.subtitle = element_text( hjust = 0.5))
final

#Save as PNG
png(filename = 'Nashville.png', width=1000, height=800)
print(final)
dev.off()
