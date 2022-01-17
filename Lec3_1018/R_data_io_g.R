# File: R_data_io_g.R
# Course: Ch3.R.Data.IO
# Section: basic graphics-bar chart
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-18

# INSTALL and LOAD PACKAGE
#install.packages("datasets")
library(datasets)
data()

# read data set "mtcars"
?mtcars
data(mtcars)
str(mtcars)
head(mtcars)

# barplot
barplot(mtcars$wt)  # doesn't work
# need a table with frequencies for each category
weight <- table(mtcars$wt)
str(weight)
barplot(weight)
plot(weight)

# clear environment
rm(list = ls())
