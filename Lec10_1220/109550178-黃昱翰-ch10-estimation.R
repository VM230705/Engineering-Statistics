# File: 109550178-黃昱翰-ch10-estimation.R
# Course: Ch10.R.Estimation
# Author: 黃昱翰
# Date: 2021-12-20
true.mean <- 50.0
true.sd <- 10.0
n <- 20
number.sample <- 100

mean.yes <- 0.
mean.no <- 0.
upper.yes <- 0.
lower.yes <- 0.
upper.no <- 0.
lower.no <- 0.


i.yes <- 0
i.no <- 0
num.yes <- 0
num.no <- 0
for (i in 1:number.sample) {
  s.data <- rnorm(n,true.mean, true.sd)
  sample.mean <- mean(s.data)
  
  t.star <- qt(0.95, df = n-1)
  B <- t.star*sd(s.data)/sqrt(n)
  
  lower <- sample.mean - B
  upper <- sample.mean + B
  if(true.mean > lower && true.mean < upper){
    i.yes <- i.yes+1
    num.yes[i.yes] <- i
    mean.yes[i.yes] <- sample.mean
    lower.yes[i.yes] <- lower
    upper.yes[i.yes] <- upper
  }
  else{
    i.no <- i.no+1
    num.no[i.no] <- i
    mean.no[i.no] <- sample.mean
    lower.no[i.no] <- lower
    upper.no[i.no] <- upper
  }
}
i.yes
i.no
data.yes <- data.frame(x = num.yes
                       ,y1 = lower.yes
                       ,y2 = upper.yes
                       ,y3 = mean.yes)
data.no <- data.frame(x = num.no
                       ,y1 = lower.no
                       ,y2 = upper.no
                       ,y3 = mean.no)
library(ggplot2)
ggplot(data = data.yes, aes(x))+
  geom_errorbar(aes(ymin = y1, ymax = y2))+
  geom_errorbar(data = data.no
                ,aes(ymin = y1, ymax = y2)
                ,color = "red")+
  geom_point(aes(x,y3))+
  geom_point(data = data.no
             ,aes(x,y3)
             ,color = "red")+
  geom_abline(intercept =  true.mean, slope = 0, linetype = 2)+
  labs(title = "Understanding CL",
       x = "Number of samples",
       y = "Confidence Intervals")
  
