# File: R_sampling_b.R
# Course: Ch7.R.Sampling
# Section: statisticss from random sampling distribution
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-11-15

# Random Sampling from Normal Distribution with mean of 50 and SD of 2
# n = 25 & 1000 times
# (1) theoretical numbers from normal distribution
x <- seq(44,56,0.1)
d <- dnorm(x,mean = 50, sd = 2)
d.norm <- data.frame(x = x, y = d, label = "normal")
library(ggplot2)
p1 <- ggplot(data = d.norm, aes(x,y))+
  geom_line()+
  labs(title = "Normal Distribution of mean 50 and sd 2",
       x = "Number variable",
       y = "Density")
# (2) n = 25, repeatably sampling 1,000

i <- 0
x.mean <- 0
rnorm(25, mean = 50, sd = 2)
for (i in 1:1000) {
  x.mean[i] <- mean(rnorm(25, mean = 50, sd = 2))
}
d.mean <- data.frame(x = x.mean)
p2 <- ggplot(data = d.mean, aes(x,..density..))+
  geom_histogram()+
  labs(x = "sample mean")

library(gridExtra)
grid.arrange(p1,p2,nrow = 2)


