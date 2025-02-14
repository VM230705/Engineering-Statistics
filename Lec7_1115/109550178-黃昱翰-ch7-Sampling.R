# File: 109550178-黃昱翰-ch7-Sampling.R
# Course: Ch7.R.Sampling
# Author: 黃昱翰
# Date: 2021-11-15

library(rio)
d <- import("weatherdata.xlsx")
names(d)

library(dplyr)
d.temp <- d %>%
  select(Temperature)#ctrl + shift + F10

str(d.temp)

#(1)
library(MASS)
# log-normal
fit.lnorm <- fitdistr(d.temp$Temperature,densfun = "lognormal")
mean <- fit.lnorm$estimate[1]
sd <- fit.lnorm$estimate[2]
x <- seq(10,40,0.1)
y <- dlnorm(x, meanlog = mean, sdlog = sd)
d.lnorm <- data.frame(x = x, y = y, label = "lnorm")

# density curve
density <- density(d.temp$Temperature)
data.density <- data.frame(x = density$x
                           , y = density$y
                           , label = "density curve")

data.plot <- rbind.data.frame(d.lnorm, data.density)

library(ggplot2)

ggplot(data = d.temp, aes(Temperature,..density..)) +
  geom_histogram(binwidth = 0.5,
                 fill = "black",
                 color = "white",
                 size =0.1,
                 alpha = 0.8)+
  geom_line(data = data.plot
            , aes(x,y, color = label)
            , size = 0.6)+
  labs(title = "June 01-Sept. 30 2020 Rainfall",
       x = "Rainfall [mm]",
       y = "Density")+
  scale_color_discrete(name = "Lines")+
  theme_bw()

library(moments)
skewness(d.temp)
kurtosis(d.temp)

#(2)
summary(d.temp)

n <- 10
nt <- 1000
np <- length(d.temp$Temperature)
# do loop for sampling nt times, n data per one time
d.mean.10 <- 0.0
i <- 0
for (i in 1:nt) {
  d.index <- sample(1:np,n)
  d.sample <- d.temp$Temperature[d.index]
  d.mean.10[i] <- mean(d.sample)
}
d.mean.10 <- as.data.frame(d.mean.10)
n <- 50
nt <- 1000
np <- length(d.temp$Temperature)
# do loop for sampling nt times, n data per one time
d.mean.50 <- 0.0
i <- 0
for (i in 1:nt) {
  d.index <- sample(1:np,n)
  d.sample <- d.temp$Temperature[d.index]
  d.mean.50[i] <- mean(d.sample)
}
d.mean.50 <- as.data.frame(d.mean.50)

n <- 100
nt <- 1000
np <- length(d.temp$Temperature)
# do loop for sampling nt times, n data per one time
d.mean.100 <- 0.0
i <- 0
for (i in 1:nt) {
  d.index <- sample(1:np,n)
  d.sample <- d.temp$Temperature[d.index]
  d.mean.100[i] <- mean(d.sample)
}
d.mean.100 <- as.data.frame(d.mean.100)


# plot histogram to check the shape, is it bell shape?
library(ggplot2)
p1 <- ggplot(data = d.mean.10, aes(d.mean.10))+
  geom_histogram(bins = 30)+
  labs(x = "sample mean, random sampling n = 10, 1000 times")
p2 <- ggplot(data = d.mean.50, aes(d.mean.50))+
  geom_histogram(bins = 30)+
  labs(x = "sample mean, random sampling n = 50, 1000 times")
p3 <- ggplot(data = d.mean.100, aes(d.mean.100))+
  geom_histogram(bins = 30)+
  labs(x = "sample mean, random sampling n = 100, 1000 times")

library(gridExtra)
grid.arrange(p1,p2,p3,nrow =3)

