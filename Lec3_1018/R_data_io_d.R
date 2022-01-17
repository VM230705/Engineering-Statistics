# File: R_data_io_d.R
# Course: Ch3.R.Data.IO
# Section: rio: exporting data
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-18

# INSTALL and LOAD PACKAGE
install.packages("rio")
library(rio)

##-----Exporting data with rio
## checking work directory & set 
getwd()
setwd("D:/110_1_Engineering_Statistics/Ch3.R.DataIO")

# create data frame
a <- c(1,3,5,7,9)
b <- a^2.0
data <- data.frame(numberA = a, numberB = b)
data
## export CSV
export(data,"ro.csv")

## export TXT
export(data,"ro.txt")

## export XLSX
export(data,"ro.xlsx")

## write.csv
write.csv(data,"write.csv")  # open file & check what's different?
write.csv(data,"write.csv",row.names = FALSE) 

## write.table
write.table(data,file = "write.txt"
            , sep = "\t"
            , row.names = FALSE)  # open file & check what's different?
write.table(data,file = "write.txt"
            , sep = "\t"
            , row.names = FALSE
            , quote = FALSE)


# clear environment
rm(list = ls())
