# File: R_distribution_b.R
# Course: Ch6.R.Distribution
# Section: Poisson distribution
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-11-08

x <- 0:10
dp <- dpois(x, lambda = 4.5)
data <- data.frame(x = x, y= dp)
ggplot(data = data, aes(x,y))+
  geom_bar(stat = "identity", color = "black")+
  scale_x_continuous(breaks = seq(0, 10, by = 1))+
  labs(title = "Poisson distribution",
       x = "Number of captured in trap",
       y = "Probability")+
  theme_bw()

