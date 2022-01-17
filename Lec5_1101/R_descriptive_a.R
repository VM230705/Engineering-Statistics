# File: R_descriptive_a.R
# Course: Ch5.R.Descriptive_Statistics
# Section: (0)read datasets from R
#          (1)stem-and-leaf plot
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-11-01

# (0)
# datasets: cars
data()
data(cars)
?cars
names(cars)

# (1)
# stem-and-leaf plot
install.packages("aplpack")
library(aplpack)
?stem.leaf
# unit: leaf unit = 1
# m =1, standard
# m =2, repeated
stem.leaf(cars$dist, unit = 1, m = 2)
sort(cars$dist)
# comparative
stem.leaf.backback(cars$dist,cars$speed)
