# File: 109550178-黃昱翰-ch9-Regression.R
# Course: Ch9.R.Regression
# Author: 黃昱翰
# Date: 2021-12-13

#(1)
library(rio)
getwd()
data <- cars
str(data)

library(ggplot2)
ggplot(data = data, aes(speed,dist))+
  geom_point()+
  labs(title = "Scatter plots example",
       x = "Speed, mph",
       y = "Distance, ft")


# start to find a straight line by LS method
# y = a + bx
model <- lm(dist ~ speed, data = data)
summary(model)
a <- model$coefficients[1]
b <- model$coefficients[2]
n <- length(cars$speed)

anova <- anova(model)
anova
SSE <- anova$`Sum Sq`[2]
SSR <- anova$`Sum Sq`[1]
SSTo <- SSE + SSR
r.square <- round(1 - SSE/SSTo,2)
sqrt(r.square)
se <- round(sqrt(SSE/(n-2)),2)

text.intercept <- as.character(round(a,2))
text.slope <- as.character(round(b,2))
text.r2.line <- as.character(r.square)
text.se.line <- as.character(se)
label.line <- paste("dist=", text.intercept," + ",text.slope,"x speed" )
cap.line <- paste("r^2:",text.r2.line,"se:",text.se.line,"(line)")
pre.x <- seq(0,30,0.01)
pre.y <- a+pre.x*b
data.line <- data.frame(x=pre.x, y=pre.y, label = label.line)

# start to find a curve
data$speed <- log(data$speed)
data$dist <- log(data$dist)

ggplot(data = data, aes(speed,dist))+
  geom_point()+
  labs(title = "Scatter plots example",
       x = "ln(Speed), mph",
       y = "ln(Distance), ft")

# start to fitting line
model2 <- lm(dist~speed, data = data)
summary(model2)
e <- exp(1)
a2 <- e^model2$coefficients[1]
b2 <- model2$coefficients[2]
a2
b2

#compute SSE for curve line
SSE2 <- 0
SSTo2 <- 0
ymean <- mean(cars$dist)
for (i in 1:n) {
  ypre <- a2*cars$speed[i]^b2
  SSE2 = SSE2 + (cars$dist[i]-ypre)^2
  SSTo2 = SSTo2 + (cars$dist[i]-ymean)^2
}
r.square2 <- round(1 - SSE2/SSTo2,2)
se2 <- round(sqrt(SSE2/(n-2)),2)




sub.text <- expression(paste("r"^"2",":",0.65," se: ",15.38,"(line) r"^"2",":", 0.66," se:",15.22,"(curve)"))

# predict curve line

pre.x2 <- seq(0,30,0.01)
pre.y2 <- a2*pre.x2^b2

text.intercept2 <- as.character(round(a2,2))
text.slope2 <- as.character(round(b2,2))
text.r2.curve <- as.character(r.square2)
text.se.curve <- as.character(se2)
label.curve <- paste("dist=", text.intercept2," * speed ^",text.slope2)
cap.curve <- paste("r^2:",text.r2.curve,"se:",text.se.curve,"(line)")
data.curve <- data.frame(x=pre.x2, y=pre.y2, label = label.curve)

data.plot <- rbind.data.frame(data.line, data.curve)

curve <- data.frame(x=pre.x2,y=pre.y2)
data <- cars
str(data)  # look the structure of data
ggplot(data = data, aes(speed,dist))+
  geom_point()+
  #geom_abline(slope = b, intercept = a, color = "red")+
  geom_line(data = data.plot
            , aes(x,y, color = label)
            , size = 0.6)+
  labs(title = "Scatter plots example",
       subtitle = sub.text,
       #caption = "Power Transformations",
       x = "Speed, mph",
       y = "Dist, ft")+
  scale_color_discrete(name = "Label")
  

