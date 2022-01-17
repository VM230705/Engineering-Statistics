# File: 109550178-黃昱翰-objects.R
# Course: Ch2.R.Data.Objects
# Section: Homework2
# Author: 黃昱翰
# Date: 2021-10-04
set.seed(1)
math.score <- sample(0:100, 80, replace = TRUE)
math.score

#(a)
student1_30 <- math.score[1:30]
mean(student1_30)
sd(student1_30)

#(b)
pass <- math.score[math.score >= 60]
length(pass)
which(math.score>=60)

#(c)
max(math.score)
min(math.score)
which(math.score == max(math.score))
which(math.score == min(math.score))

#(d)
math.score_sorted = sort(math.score, decreasing = TRUE)
top10 = math.score_sorted[1:10]
mean(top10)
sd(top10)

#(e)
s <- summary(math.score)
s["1st Qu."]

