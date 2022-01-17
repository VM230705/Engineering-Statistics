# File: R_Data_visualization_c.R
# Course: Ch4.R.Data.Visualization
# Section: load dataset CO2 in R 
#         geom_boxplot, coord_flip, 
#         facet_wrap, theme_bw
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-25

data()
CO2
library(ggplot2)
ggplot(data = CO2, aes(x = Treatment, y = uptake))+
  geom_boxplot()+
  coord_flip()+
  geom_point(aes(size = conc, color = Plant)
             ,alpha = 0.5)+
  facet_wrap(CO2$Type)+
  labs(title = "Chilled vs Non-chilled"
       , x = "uptake [umol/m^2 sec]")+
  theme_bw()
             