# File: R_data_objects_a.R
# Course: Ch2.R.Data.Objects
# Section: Data Format, Data Structures
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-03

##-----data formats
# numeric
n1 <- 5  # double precision by default
n1
typeof(n1)
# character
c1 <- "c"
c1
typeof(c1)
# logical
l1 <- TRUE
l1
typeof(l1)
l2 <- F
l2
typeof(l2)
# object.size
size <- object.size(l2)
print(size, units = "b")
# objects(), ls(), rm()
objects()
ls()
rm(list = ls())
# Ctrl + L, clear console

##-----------data structures
# vector, numeric, is.vector
v1 <- c(1,2,3,4,5)
v1
is.vector(v1)
# vector, character
v2 <- c("a","b","c")
v2
is.vector(v2)
# Matrix, two dimensions, same length
?matrix
m1 <- matrix(c("a","b","c","d","e","f"), nrow = 2)
m1
# byrow is TRUE
m2 <- matrix(c("a","b","c","d","e","f")
             , nrow = 2
             , byrow = TRUE)
m2
# Array
# Give data, then dimensions (rows, columns, tables)
a1 <- array(c(1:24), c(4,3,2))
a1
# Data frame, can combine vectors of the same length
numeric <- c(1,2,3)
character <- c("a","b","c")
logical <- c(T,F,T)
dfa <- cbind(numeric,character,logical)
dfa # Matrix of one data type
dfb <- as.data.frame(dfa)
dfb # makes a data frame with three different data types
View(dfb)
str(dfb)
dfb$numeric
dfb$character
# List
o1 <- c(1,2,3)
o2 <- c("a","b","c","d")
o3 <- c(T,F,T,T,F)
list1 <- list(o1,o2,o3)
list1
str(list1)

list2 <- list(o1,o2,o3,list1)
list2
str(list2)
