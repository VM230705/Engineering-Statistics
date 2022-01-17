# File: 109550178-黃昱翰-ch5-Descriptive
# Course: Ch5.R.Descriptive_Statistics
# Author: 黃昱翰
# Date: 2021-11-01

data <- c(37.0, 37.5, 38.1, 40.0, 40.2, 40.8, 41.0, 42.0, 43.1, 43.9,
        44.1, 44.6, 45.0, 46.1, 47.0, 50.2, 55.0, 56.0, 57.0, 58.0,
        62.0, 64.3, 68.8, 70.1, 74.5)
data

#(1)
#density curve x,y
den <- density(data)
#convert data.frame
data.den <- data.frame(x = den$x, y = den$y) #for geom_line
#original data covert to data frame
data.hist <- data.frame(data = data)
#determine breaks for histogram
hist.tmp <- hist(data, breaks=5, FALSE)

#y axis unit = density
library(ggplot2)

ggplot(data = data.hist, aes(data,..density..))+
  geom_histogram(fill = "blue"
                 , alpha = 0.5
                 , breaks = hist.tmp$breaks)+
  geom_line(data = data.den
            , aes(x,y)
            , color = "red"
            , size = 1)+
  labs(title = "Histogram of Density curve of data"
       , x = "Measurement data[MPa]", y = "Density")+
  theme_bw()

#(2)
library(moments)
skewness(data)
kurtosis(data)

#(3)
ggplot(data = data.hist, aes(data))+
  geom_boxplot(outlier.color = "red",
               outlier.shape = 20,
               outlier.size = 3,
               coef = 1)+
  labs(title = "Boxplot of data"
       , x = "Measurement data[MPa]")+
  scale_y_discrete()+
  theme_bw()

library(gridExtra)
grid.arrange(g1,g2, nrow = 2)
