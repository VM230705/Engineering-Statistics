# File: R_descriptive_b.R
# Course: Ch5.R.Descriptive_Statistics
# Section: (0)read datasets from R
#          (1)histogram plot with count
#          (2)histogram plot with density + density curve
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-11-01

# (0)
# datasets: cars
#data()
#data(cars)
#?cars
#names(cars)

# (1)
# histogram plot
library(ggplot2)
n <- length(cars$dist)
#?geom_histogram
#?hist
hisp <- hist(cars$dist, breaks = 20, plot = FALSE)
ggplot(data = cars, aes(dist))+
  geom_histogram(  fill = "red"
                 , alpha = 0.5
                 #,bins = 24)+
                 , breaks = hisp$breaks)+
  labs(title = "Histogram of distance to stop"
       , x = "Distance [ft]", y = "Number of count")+
  theme_bw()
# Y-axis density 
str(data)
?density
density <- density(cars$dist)
data.density <- data.frame(x = density$x, y = density$y)
ggplot(data = cars, aes(dist,..density..))+
  geom_histogram(fill = "blue"
                 , alpha = 0.5
                 , breaks = hisp$breaks)+
  geom_line(data = data.density
            , aes(x,y)
            , color = "red"
            , size = 1)+
  labs(title = "Histogram of distance to stop"
       , x = "Distance [ft]", y = "Density")+
  theme_bw()

#install.packages("gridExtra")
library(gridExtra)
grid.arrange(p1,p2, nrow = 2)
