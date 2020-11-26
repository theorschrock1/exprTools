library(exprTools)
context("exprs_eval")
test_that("x <- exprs(x <- 3, y <- 4, z <- x + y)\nexprs_eval(x)", 
    {
        output <- expect_list({
            x <- exprs(x <- 3, y <- 4, z <- x + y)
            exprs_eval(x)
        })
        expect_equal(test_summary(output), list(length = 3, attributes = list(names = c("", 
            "", ""))))
        expect_equal(test_summary(output[[1]]), list(sum = 3, 
            min = 3, max = 3, avg = 3, N = 1, class = "numeric", 
            anyMissing = FALSE))
        expect_equal(test_summary(output[[2]]), list(sum = 4, 
            min = 4, max = 4, avg = 4, N = 1, class = "numeric", 
            anyMissing = FALSE))
        expect_equal(test_summary(output[[3]]), list(sum = 7, 
            min = 7, max = 7, avg = 7, N = 1, class = "numeric", 
            anyMissing = FALSE))
    })
