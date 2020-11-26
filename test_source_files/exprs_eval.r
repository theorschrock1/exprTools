library(exprTools)
init <- NULL
x <- exprs(x <- 3, y <- 4, z <- x + y)
exprs_eval(x)
