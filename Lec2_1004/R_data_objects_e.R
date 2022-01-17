# File: R_data_objects_e.R
# Course: Ch2.R.Data.Objects
# Section: Matrix
# Author: vvn weian chao, CoLLab cc, vvnchao@gmail.com
# Date: 2021-10-03

# dim, diag
x <- 1:20
(A <- matrix(x, ncol = 4))
dim(A)
diag(A)

# * operator
(B <- matrix(x*x, ncol = 5))
dim(B)
A*B # do not work
BT <- t(B)
dim(BT)
A*BT # multiplication of elements

# matrix multiplication i,j x j,i
dim(A)
dim(B)
C <- A%*%B
dim(C)
C
