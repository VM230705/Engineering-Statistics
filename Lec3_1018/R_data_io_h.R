# File: R_data_io_g.R
# Course: Ch3.R.Data.IO
# Section: basic graphics-histogram
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-18

# INSTALL and LOAD PACKAGE
#install.packages("datasets")
library(datasets)
data()

# read data set "iris"
data(iris)
head(iris)

# basic histograms
hist(iris$Sepal.Length)

# histogram by group
# put graphs in 3 rows and 1 column
par(mfrow = c(3,1))
hist(iris$Petal.Width [iris$Species == "setosa"]
     , xlim = c(0,3)
     , breaks = 9
     , main = "Petal Width for Setosa"
     , xlab = ""
     , col = "blue")

hist(iris$Petal.Width [iris$Species == "versicolor"]
     , xlim = c(0,3)
     , breaks = 9
     , main = "Petal Width for Versicolor"
     , xlab = ""
     , col = "red")

hist(iris$Petal.Width [iris$Species == "virginica"]
     , xlim = c(0,3)
     , breaks = 9
     , main = "Petal Width for Virginica"
     , xlab = ""
     , col = "green")

par(mfrow = c(1,1))
# frequency false
hist(iris$Petal.Width [iris$Species == "virginica"]
     , xlim = c(0,3)
     , breaks = 9
     , main = "Petal Width for Virginica"
     , xlab = ""
     , col = "green"
     , freq = FALSE)


# clear environment
rm(list = ls())
