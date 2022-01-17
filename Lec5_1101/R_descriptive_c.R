# File: R_descriptive_c.R
# Course: Ch5.R.Descriptive_Statistics
# Section: (0)create random data with normal distribution
#          (1)skewness
#          (2)kurtosis
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-11-01

#(0) create random data with normal distribution
#?rnorm
xnorm <- rnorm(1000, mean = 0, sd = 1)
data <- data.frame(x = xnorm)
# find density curve
tmp <- density(data$x)
data_den <- data.frame(x = tmp$x, y = tmp$y)
# create ideal normal distribution curve
x <- seq(-3,3,0.01)
x
ideal <- dnorm(x, mean = 0, sd = 1)
ideal
data_ideal <- data.frame(x = x, y = ideal)


ggplot(data = data, aes(x))+
  geom_histogram(data = data,aes(x,..density..),
                 bins = 20)+
  geom_line(data = data_den, aes(x,y), size = 1
            , color = "gray")+
  geom_line(data = data_ideal, aes(x,y), size = 1
            , linetype = 2)

# compute skewness
install.packages("moments")
library(moments)
# (1) skewness
skewness(data$x)
# (2) kurtosis
kurtosis(data$x)
