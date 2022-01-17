# File: R_data_io_c.R
# Course: Ch3.R.Data.IO
# Section: rio: importing data
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-18

# INSTALL and LOAD PACKAGE
install.packages("rio")
library(rio)

##-----Importing data with rio
## checking work directory & set 
getwd()
##setwd("D:/110_1_Engineering_Statistics/Ch3.R.DataIO")

## TXT
rio_txt <- import("weatherdata.txt")
View(rio_txt)
head(rio_txt)
str(rio_txt)  # data frame
rain <- rio_txt$Rain

## CSV, comma separated values
rio_csv <- import("weatherdata.csv")
head(rio_csv)

## XLSX
rio_xlsx <- import("weatherdata.xlsx")
head(rio_xlsx)

## read.csv
r_csv <- read.csv("weatherdata.csv")
head(r_csv)

## convert
install.packages("jsonlite")
library(jsonlite)
convert("weatherdata.csv","weatherdata.json")

# clear environment
rm(list = ls())
