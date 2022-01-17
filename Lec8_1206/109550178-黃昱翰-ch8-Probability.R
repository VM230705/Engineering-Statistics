# File: 109550178-黃昱翰-ch8-Probability.R
# Course: Ch8.R.Probability
# Author: 黃昱翰
# Date: 2021-12-06
#(1)
n.typhoon<-20
p = 0.1
pro.t <-(1-p)^n.typhoon
pro.t

#(2)
set.seed(1)
n<-8
n.typhoon<-20
m<-0
pp<-0
for (i in 1:n) {
  n.strike<-0
  for (j in 1:n.typhoon) {
    num<-sample(0:99,1)
    if(num<=09){
      n.strike=n.strike+1
    }
  }
  if(n.strike==0) m<-m+1
}
cat(m,'of',n,'are results of number of non-strike typhoon','\n')
pp <- m/8
cat(pp, ' is computed probability', 'Sample number is ', n, '\n')

#(3)
set.seed(1)
n<-2^15
n.typhoon<-20
m<-0
k<-0
count<-0
amount<-0
for (i in 1:n) {
  n.strike<-0
  for (j in 1:n.typhoon) {
    number<-sample(0:99,1)
    if(number<=09){
      n.strike=n.strike+1
    }
  }
  if(n.strike==0){
    m<-m+1
  } 
  if(i==2^4||i==2^5||i==2^6||i==2^7||i==2^8||i==2^9||i==2^10||i==2^11||i==2^12||i==2^13||i==2^14||i==2^15){
    k<-k+1
    count[k] <- m
    amount[k] <- i
  }
}
pro<-0
pro <- count/amount

p = 0.1
pro.t <-(1-p)^n.typhoon

title <- paste("Probability of Typhoon Strike Taiwan")
lpx <- c(2^3,2^15)
lpy <- c(pro.t,pro.t)
data.line <- data.frame(x=lpx, y=lpy)
library(ggplot2)
data <- data.frame(x=amount, y=pro)
ggplot(data = data, aes(x,y))+
  geom_point()+
  labs(title = title,
       x = "Number of Random Sampling",
       y = "Probability of n.strike = 0")+
  geom_line(data = data.line, aes(x,y),
            linetype = 2,
            color = "black",
            size = 1.)+
  theme_bw()
