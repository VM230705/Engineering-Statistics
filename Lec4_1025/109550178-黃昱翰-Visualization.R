# File: R_Data_visualization_d.R
# Course: Ch4.R.Data.Visualization
# Author: 黃昱翰
# Date: 2021-10-25

library(rio)
getwd()

xlsx <- import("weatherdata.xlsx")
View(xlsx)
str(xlsx)
head(xlsx)
names(xlsx)

library(lubridate)
date <- xlsx$Date
dt <- mdy_hms(date)
str(dt)

data1 <- data.frame(time = dt
                   , RH = xlsx$RH)
str(data1)

data2 <- data.frame(time=dt
                    ,Rain=xlsx$Rain)
str(data2)

library(gridExtra)
library(ggplot2)
Sys.setlocale("LC_ALL", "English")
p1 <- ggplot(data = data1, aes(time, RH))+
  geom_point(size = 1, shape = 15, alpha = 2)+
  labs(title = "Relative Humidity June-Oct 2020"
       , x = "Date-Time"
       , y = "RH [%]")
p2 <- ggplot(data = data2, aes(time, Rain))+
  geom_bar(stat = "identity", color = "blue")+
  labs(title = "Precipitation June-Oct 2020"
       , x = "Date-Time"
       , y = "Precipitation [mm]")

grid.arrange(p1,p2,nrow = 2)
ggsave("109550178Visualization.png")

