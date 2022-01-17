# File: 109550178-黃昱翰-IO.R
# Course: Ch3.R.IO
# Section: Homework3
# Author: 黃昱翰
# Date: 2021-10-18

library(rio)
 
rio_xlsx <- import("weatherdata.xlsx")
#(a)
rain <- rio_xlsx$Rain
max(rain)
line <- which(rain == max(rain))
date <- rio_xlsx$Date[line]
date
length(date)

#(b)
cat("The data number: ", length(date) ,file = "Output.txt","\n")
cat("The maximum rainfall per 5 min: ", max(rain), "mm", file = "Output.txt","\n"
    ,append = TRUE);
cat("The date and time: ", date, file = "Output.txt","\n"
    ,append = TRUE)
