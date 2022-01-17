# File: R_data_io_g.R
# Course: Ch3.R.Data.IO
# Section: basic graphics-overlaying plot
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-18

# INSTALL and LOAD PACKAGE
#install.packages("datasets")
library(datasets)
data()

# read data set "iris"
data(iris)
head(iris)

# Good to first check univariate distributions
hist(iris$Sepal.Length)

# plot with options
hist(iris$Sepal.Length
     , breaks = 14
     , freq = FALSE
     , col = "red"
     , main = "Histogram of iris"
     , xlab = "Sepal Length")

# add a normal distribution
x <- iris$Sepal.Length
curve(dnorm(x, mean = mean(x), sd = sd(x))
      , col = "black"
      , lwd = 2
      , add = TRUE)

# add two kernel density estimator
lines(density(x), col = "blue", lwd = 2)
# smooth curve, adjust
lines(density(x, adjust = 3), col = "green", lwd = 2)

# Add a rug plot
rug(iris$Sepal.Length, lwd = 2, col = "gray" )

# clear environment
rm(list = ls())
