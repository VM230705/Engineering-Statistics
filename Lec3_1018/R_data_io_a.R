# File: R_data_io_a.R
# Course: Ch3.R.Data.IO
# Section: Entering data
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-18

##-----Entering data
# assigns number 0 through 10 to x1
x1 <- 0:10
x1
# descending order 10:0
x2 <- 10:0
## concatenate, enter multiple values with "c"
x3 <- c(0,1,2,3,4,6)
x3
## seq
?seq  # R help on seq
x4 <- seq(10)
x4 
# specify change in values
x5 <- seq(0,10, by = 2)
x5
## rep, replicate
x6 <- rep(TRUE, 5)
x6
x7 <- rep(c(TRUE,FALSE),3)
x7
## scan
x8 <- scan()  # after running this command, go to console
              # hit enter twice for exit
x8

# clear environment
rm(list = ls())
