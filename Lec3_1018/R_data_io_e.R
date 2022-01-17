# File: R_data_io_e.R
# Course: Ch3.R.Data.IO
# Section: datasets
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-18

# INSTALL and LOAD PACKAGE
install.packages("datasets")
library(datasets)
data()

# read data set "iris"
?iris
data(iris)
str(iris)
head(iris)

data("CO2")
?CO2
CO2
# output data set as TXT format
library(rio)
export(iris,"iris.txt")



# clear environment
rm(list = ls())
