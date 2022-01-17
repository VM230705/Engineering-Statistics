# File: R_data_io_g.R
# Course: Ch3.R.Data.IO
# Section: basic graphics-scatter plot
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-18

# INSTALL and LOAD PACKAGE
#install.packages("datasets")
library(datasets)
data()

# read data set "mtcats"
data(mtcars)
head(mtcars)

# Good to first check univariate distributions
hist(mtcars$wt)
hist(mtcars$mpg)

# Basic X-Y plot for two quantitative variables
plot(mtcars$wt, mtcars$mpg)

# plot with options
plot(mtcars$wt, mtcars$mpg
     , pch = 19
     , cex = 1.5   # make 150% size
     , col = "red"
     , main = "MPG as function of weight of cars"
     , xlab = "Weight in 1000 pounds"
     , ylab = "MPG")

# clear environment
rm(list = ls())
