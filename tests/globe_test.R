library("threejs")
#############################
# Globe test
#############################

# Flight
data(flights, package="threejs")
dest   <- factor(sprintf("%.2f:%.2f",flights[,3], flights[,4]))
freq <- sort(table(dest), decreasing=TRUE)
frequent_destinations <- names(freq)[1:10]
idx <- dest %in% frequent_destinations
frequent_flights <- flights[idx, ]
ll <- unique(frequent_flights[,3:4])
globejs(lat=ll[,1], long=ll[,2], arcs=frequent_flights,
        arcsHeight=0.3, arcsLwd=2, arcsColor="#ffff00", arcsOpacity=0.15,
        atmosphere=TRUE, color="#00aaff", pointsize=0.5)

## Closer to the previous look and feel
globejs(lat=ll[,1], long=ll[,2], arcs=frequent_flights,
        arcsHeight=0.3, arcsLwd=2, arcsColor="#ffff00", arcsOpacity=0.15,
        atmosphere=TRUE, color="#00aaff", bodycolor="#0000FF", emissive = "#aaeeff", pointsize=0.5)


#CITIES
data(world.cities, package="maps")

earth_dark <- list(img=system.file("images/world.jpg",package="threejs"), 
                   bodycolor="#0011ff",
                   emissive="#0011ff",
                   lightcolor="#99ddff")

h <- 100 # height of the bar
cities <- world.cities[order(world.cities$pop,decreasing=TRUE)[1:1000],]

value <- h * cities$pop / max(cities$pop)
col <- rainbow(10, start=2.8 / 6,end=3.4 / 6)
names(col) <- c()
# Extend palette to data values
col <- col[floor(length(col) * (h - value) / h) + 1]
v <- list(value=value, color=col, cities=cities)

args <- c(earth_dark , list(lat=v$cities$lat, long=v$cities$long, value=v$value, color=v$color, atmosphere=TRUE))
do.call(globejs, args=args)
