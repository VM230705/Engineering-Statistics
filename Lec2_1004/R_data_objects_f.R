# File: R_data_objects_f.R
# Course: Ch2.R.Data.Objects
# Section: Rounding of Numbers
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-03

# pi number in R
pi
# getOption: digit
getOption('digits')
# save options in default
op.default <- options()
str(op.default)
# option, change default digit number
options(digits = 10)
pi

# create the numeric vector
(x <- c(pi,1/3,-1/3,-pi))
# ceiling
ceiling(x)
# floor
floor(x)
# truncate
trunc(x)
# round
round(x,2)
round(x,5)

# Application to checking
# if a number is an integer
(x <- c(1/3, 2, pi, 2.5))
(l <- ceiling(x) == floor(x))
(location.idx <- which(l))

