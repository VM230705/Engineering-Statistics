# File: R_data_io_f.R
# Course: Ch3.R.Data.IO
# Section: basic graphics
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-18

# INSTALL and LOAD PACKAGE
#install.packages("datasets")
library(datasets)
data()

# read data set "iris"
data(iris)
str(iris)
head(iris)

# plot data with plot()
plot(iris$Species)  # categorical variable
plot(iris$Petal.Length)  # quantitative variable
plot(iris$Species, iris$Petal.Width)
plot(iris$Petal.Length, iris$Petal.Width)  # pair
plot(iris)

# plot with options
plot(iris$Petal.Length, iris$Petal.Width
     , col = "red"
     , pch = 19 #資料符號
     , main = "iris: Petal Length vs. Petal Width"
     , xlab = "Petal Length"
     , ylab = "Petal Width")  

# plot formulas with plot()
plot(cos, 0, 2*pi)
plot(exp, 0, 5)
plot(dnorm, -3, 3)


# formula plot with options
plot(dnorm, -3, 3
     , col = "blue"
     , lwd = 5  #線的粗細
     , main = "Standard Normal Distribution"
     , xlab = "X"
     , ylab = "Density")

# clear environment
rm(list = ls())
