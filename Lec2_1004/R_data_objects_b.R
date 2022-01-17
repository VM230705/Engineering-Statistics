# File: R_data_objects_b.R
# Course: Ch2.R.Data.Objects
# Section: coercing types
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-03

# Automatic coercing
(co1 <- c(1, "b", TRUE))
typeof(co1)

# Coerce numeric to integer
(co2 <- 5)
typeof(co2)
(co3 <- as.integer(co2))
typeof(co3)

# Coerce character to numeric
(co4 <- c("1","2","3"))
typeof(co4)
(co5 <- as.numeric(co4))
typeof(co5)

# Coerce matrix to data frame
(co6 <- matrix(1:9, nrow = 3))
is.matrix(co6)
(co7 <- as.data.frame(co6))
str(co7)
is.data.frame(co7)
