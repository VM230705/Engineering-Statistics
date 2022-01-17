# File: R_probability_a.R
# Course: Ch8.R.Probability
# Section: venn diagram
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-12-05

# install package
install.packages("VennDiagram")
library(grid)
library(futile.logger)
library(VennDiagram)

# Event A: sample number: 50
A <- sample(x=1:100, size=50, replace=FALSE)
# Event B: sample number: 50
B <- sample(x=1:100, size=50, replace=FALSE)
# Event C: sample number: 50
C <- sample(x=1:100, size=50, replace=FALSE)

D <- sample(x=1:100, size=50, replace=FALSE)
E <- sample(x=1:100, size=50, replace=FALSE)


colors <- c('red','blue','orange','purple','yellow')

getwd()
#setwd("D:/110_1_Engineering_Statistics/Ch8.R.Probability")
# Make Venn Diagram from list of groups
venn.diagram(x= list(A,B,C,D,E),
             category.names = c("A","B","C","D","E"),
             filename = "Venn.png",
             imagetype = "png",
             fill = colors,
             cat.col = colors,
             cat.cex = 2
             )


