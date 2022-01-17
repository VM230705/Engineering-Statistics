# File: R_distribution_b.R
# Course: Ch6.R.Distribution
# Section: (1) Quantile-Quantile plot manually
#          (2) stat_qq, stat_qq_line
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-11-08

# read input data
d <- c(20,23,7,1,15,29,24,13,19,12,32,6,11,18)
d.sort <- sort(d)
#(1) qqplot
n <- length(d)
i <- 1:n
xi <- (i-0.5)/n
x.norm.quantile <- qnorm(xi)#mean=0 .sd=1
data <- data.frame(x = x.norm.quantile, y = d.sort)
# find line slope and intercept
y <- quantile(d.sort, c(0.25, 0.75), type = 5)
x <- qnorm( c(0.25, 0.75)) 
slope <- diff(y)/diff(x)
int <- y[1] - slope * x[1]

library(ggplot2)
p1<-ggplot(data = data, aes(x,y))+
  geom_point(size = 2.0, alpha = 0.5)+
  geom_abline(slope = slope, intercept = int,
              color = "blue", size = 1)+
  labs(title = "QQplot",
       x = "Theoretical Normal Distribution Quantile",
       y = "Observed Data")

p2<-ggplot()+
  aes(sample = d.sort)+
  stat_qq(distribution = qnorm)+
  stat_qq_line(line.p = c(0.25, 0.75), col = "blue")+
  labs(title = "QQplot",
       x = "Theoretical Normal Distribution Quantile",
       y = "Observed Data")

library(gridExtra)
grid.arrange(p1,p2,nrow = 2)
