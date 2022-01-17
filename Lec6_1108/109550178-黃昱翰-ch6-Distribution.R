# File: 109550178-黃昱翰-ch6-Distribution.R
# Course: Ch6.R.Distribution
# Author: 黃昱翰
# Date: 2021-11-08

#(1)
d <- c(37.0, 37.5, 38.1, 40.0, 40.2, 40.8, 41.0, 42.0, 43.1, 43.9,
       44.1, 44.6, 45.0, 46.1, 47.0, 50.2, 55.0, 56.0, 57.0, 58.0,
       62.0, 64.3, 68.8, 70.1, 74.5)
data <- data.frame(x = d)
density <- density(d)
data.density <- data.frame(x = density$x, y = density$y)

library(MASS)
#weibull
fit.weibull <- fitdistr(d,"weibull")
shape <- fit.weibull$estimate[1]
scale <- fit.weibull$estimate[2]
x<-seq(20,80,0.1)
d.weibull <- dweibull(x, shape = shape, scale = scale)
#normal
fit.normal <- fitdistr(d,"normal")
mean <- fit.normal$estimate[1]
sd <- fit.normal$estimate[2]
d.normal <- dnorm(x, mean = mean, sd = sd)
fit <- data.frame(x = x, wei = d.weibull, nor = d.normal)

library(ggplot2)
ggplot(data = data,aes(x,y))+
  labs(title = "Fitting Distribution",
       x = "Material Strength",
       y = "Density")+
  scale_x_continuous(breaks = seq(25,100,25))+
  geom_line(data = data.density, aes(x,y),
            color = "black",
            size =1.0)+
  geom_line(data = fit, aes(x,wei), # weibull
            color = "red",
            size =1.0)+
  geom_line(data = fit, aes(x,nor), # normal
            color = "black",
            size =1.0,
            linetype = 2)+
  theme_bw()

#(2)
ggplot()+
  aes(sample = d)+
  stat_qq(distribution = qnorm)+
  stat_qq_line(line.p = c(0.25, 0.75), col = "blue")+
  labs(title = "QQplot",
       x = "Theoretical Normal Distribution Quantile",
       y = "Observed Data")
