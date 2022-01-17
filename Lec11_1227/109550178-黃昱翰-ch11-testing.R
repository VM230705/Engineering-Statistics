# File: 109550178-黃昱翰-ch11-testing.R
# Course: Ch11.R.Hypothesis_Testing
# Author: 黃昱翰
# Date: 2021-12-27
data(iris)
d <- iris
index.setosa <- which(d$Species == "setosa")
index.versicolor <- which(d$Species == "versicolor")
d.setosa <- d$Sepal.Length[index.setosa]
d.versicolor <- d$Sepal.Length[index.versicolor]

# (1) data normality test, shapiro.test()
# H0: the hypothesis of normality
shapiro.test(d.setosa)
shapiro.test(d.versicolor)

# (2) make a box plot to see the distribution properties of two data
library(ggplot2)
ggplot(data = d, aes(Species,Sepal.Length))+
  geom_boxplot()+
  coord_flip()+
  geom_point()+
  labs(title = "Boxplot",
       x = "Species",
       y = "Sepal Length(mm)")

# (3) H0: mu1 - mu2 = 0; Ha: mu1 - mu2 < 0
#z test
library(BSDA)
var.test(d.setosa, d.versicolor, ratio = 1)
sd.setosa <- sd(d.setosa)
sd.versicolor <- sd(d.versicolor)
z.test(d.versicolor, d.setosa, alternative = "two.sided",
       sigma.x = sd.versicolor, sigma.y = sd.setosa,
       mu = 0, conf.level = 0.95)
