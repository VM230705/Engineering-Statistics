# File: R_data_io_b.R
# Course: Ch3.R.Data.IO
# Section: Printing data on screen
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-18

##-----Printing data 
## print
x <- 1
print(x)
print("Number is")
print("Number is",x)  ##Fail
print(paste("Number is",x))
## cat
cat("Number is",x)
cat("Today","is",date(),sep = "\n","\n")
cat("Today","is",date(),sep = "\t","\n")
cat("Today","is",date(),sep = " ","\n")
## cat into file
##set working directory windows:\ ,Rstudio:/
getwd()
setwd("C:/NYCU/Engineering_Statistics/Lec3_1018")
cat("Number is",x,file = "test.txt","\n")
cat("Today","is",date(),file = "test.txt"
    ,sep = " "
    ,"\n"
    ,append = TRUE)

##sprintf
pi
sprintf("%f",pi)
sprintf("%5.2f",pi)
sprintf("%05.2f",pi)
sprintf("%-5.2f",pi) #砍掉空白格
sprintf("%+5.2f",pi)
sprintf("%e",pi)
sprintf("%.2e",pi)
sprintf("%d",pi)
sprintf("%s is %f","Testing number is",pi)

# clear environment
rm(list = ls())
