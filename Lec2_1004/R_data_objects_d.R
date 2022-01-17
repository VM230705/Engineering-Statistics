# File: R_data_objects_d.R
# Course: Ch2.R.Data.Objects
# Section: special functions for vector
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-03

# which, return location index
(x <- c(3, 4, 12, 6, 2))
which(x == 12)
which(x > 5)
(y <- x[x > 5])

# prod(),log(),logb(,),factorial,%%, %/%
(x <- c(1,2,3))
prod(x)
log(x)
logb(x,2)
factorial(3)
10%%3
10%/%3

# mean,max,min,var,sd,median,summary
mean(x)
max(x)
min(x)
var(x)
sd(x)
median(x)
s <- summary(x)
s
str(s)
# show 1st quantile
s['1st Qu.']

# sort, rank, order
x <- c(6,3,10,4)
sort(x)
sort(x,decreasing = TRUE)
rank(x)
order(x)

# character paste
paste("A",1:6, sep = "_")
paste("Today is",date())

# logical vector
x <- c(4, 7, 2, 3, 20)
x < 5
x >5 & x < 10

# length of vector
y <- x[x<5]
y
length(y)
