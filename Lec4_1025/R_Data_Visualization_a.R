# File: R_Data_visualization_a.R
# Course: Ch4.R.Data.Visualization
# Section: load dataset BOD in R 
#         geom_point, geom_line,
#         ggtitle, xlab, ylab
#         ggsave
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-25

install.packages("ggplot2")
library(ggplot2)

# load datasets in R: BOD
data()
# Biochemical Oxygen Demand
head(BOD)
?BOD
names(BOD)
# Time- time of measurement [days]
# biochemical oxygen demand [mg/l]


ggplot(data = BOD,
       mapping = aes(x = Time, y = demand))+
  geom_point(size = 3, color = "blue", shape = 1)+
  geom_line(size = 1, color = "red", linetype = 1)+
  xlab("Time [days]")+
  ylab("Deman [mg/L]")+
  ggtitle("Biochemical Oxygen Demand")
# get working directory
  getwd()
  setwd("D:/110_1_Engineering_Statistics/Ch4.R.Visualization")
  ggsave("R_Data_Visualization_a.png")

