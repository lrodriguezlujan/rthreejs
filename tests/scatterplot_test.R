#####################################################
# Original test (working on previous[CRAN] release) #
#####################################################
library(threejs)

# Points at
# 0, 0, 0  BLACK
# 1, 0, 0  RED
# 0, 1, 0  BLUE 
# 0, 0, 1  GREEN
# 1, 1, 0  RED + BLUE = PURPLE
# 1, 0, 1  RED + GREEN = YELLOW
# 0, 1, 1  BLUE + GREEN = TEAL
# 1, 1, 1  WHITE (actually, light grey)
# 
# (CUBE)
#

x <- matrix( c(0,0,0,
               1,0,0,
               0,1,0,
               0,0,1,
               1,1,0,
               1,0,1,
               0,1,1,
               1,1,1), byrow = T, ncol = 3)

colors <- c("#000000", "#FF0000", "#0000FF", "#00FF00", "#FF00FF", "#FFFF00", "#00FFFF", "#AAAAAA")
# Canvas
scatterplot3js(x, color=colors, labels=sprintf("x=%.2f, y=%.2f, z=%.2f", x[,1], x[,2],x[,3]), renderer="canvas")

# WebGL
scatterplot3js(x, color=colors, labels=sprintf("x=%.2f, y=%.2f, z=%.2f", x[,1], x[,2],x[,3]))

# Canvas plot, 3 different point sizes (non colour matched)
N <- 100
i <- sample(3, N, replace=TRUE)
x <- matrix(rnorm(N * 3), ncol=3)
lab <- c("small", "bigger", "biggest")
scatterplot3js(x, color=rainbow(N), labels=lab[i], size=i, renderer="canvas")

# Helicoidal plot (WEBGL)
z <- seq(-10, 10, 0.1)
x <- cos(z)
y <- sin(z)
scatterplot3js(x,y,z, color=rainbow(length(z)),
               labels=sprintf("x=%.2f, y=%.2f, z=%.2f", x, y, z))

# Helicoidal plot (CANVAS)
z <- seq(-10, 10, 0.1)
x <- cos(z)
y <- sin(z)
scatterplot3js(x,y,z, color=rainbow(length(z)),
               labels=sprintf("x=%.2f, y=%.2f, z=%.2f", x, y, z), renderer="canvas")

# Helicoidal plot (sizes scale with z)
z <- seq(-10, 10, 0.1)
x <- cos(z)
y <- sin(z)
scatterplot3js(x,y,z, color=rainbow(length(z)),
               labels=sprintf("x=%.2f, y=%.2f, z=%.2f", x, y, z), size = (2*(z+20))/50, renderer="canvas")


# Sphere time

x <- matrix( c(0,0,0,
               1,0,0,
               0,1,0,
               0,0,1,
               1,1,0,
               1,0,1,
               0,1,1,
               1,1,1), byrow = T, ncol = 3)

colors <- c("#000000", "#FF0000", "#0000FF", "#00FF00", "#FF00FF", "#FFFF00", "#00FFFF", "#AAAAAA")
# Canvas
scatterplot3js(x, color=colors, labels=sprintf("x=%.2f, y=%.2f, z=%.2f", x[,1], x[,2],x[,3]), r = 0.05, renderer="canvas")
# WebGL
scatterplot3js(x, color=colors, labels=sprintf("x=%.2f, y=%.2f, z=%.2f", x[,1], x[,2],x[,3]), r = 0.05, renderer="webgl")

# Helicoidal plot (sphere radius scale with z)
z <- seq(-10, 10, 0.1)
x <- cos(z)
y <- sin(z)
scatterplot3js(x,y,z, color=rainbow(length(z)),
               labels=sprintf("x=%.2f, y=%.2f, z=%.2f", x, y, z), r = (2*(z+20))/100, renderer="canvas")

z <- seq(-10, 10, 0.1)
x <- cos(z)
y <- sin(z)
scatterplot3js(x,y,z, color=rainbow(length(z)),
               labels=sprintf("x=%.2f, y=%.2f, z=%.2f", x, y, z), r = (2*(z+20))/100, renderer="webgl")


# Mix points and spheres
z <- seq(-10, 10, 0.1)
x <- cos(z)
y <- sin(z)
scatterplot3js(x,y,z, color=rainbow(length(z)),
               labels=sprintf("x=%.2f, y=%.2f, z=%.2f", x, y, z), r = rep(c(1,0),length(z)/2)[1:length(z)] * (2*(z+20))/100, renderer="webgl")

# Column
z <- seq(-10, 10, 0.1)
x <- cos(z)
y <- sin(z)
scatterplot3js(cbind(x,y,z,rep(c(1,0),length(z)/2)[1:length(z)] * (2*(z+20))/100), color=rainbow(length(z)),
               labels=sprintf("x=%.2f, y=%.2f, z=%.2f", x, y, z),renderer="webgl")