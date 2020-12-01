library(exprTools)
context("expr_extract_call")
test_that("expr_extract_call(expr({\n    assert_all(x)\n    assert_fun(x)\n    x <- assert_mult(x)\n    if (x) {\n        x <- assert_character(x)\n    }\n    fn = function(x) {\n        x + 1\n    }\n}), call_name = \"assert\", grep = TRUE, skip_first = FALSE)", 
    {
        output <- expect_list({
            expr_extract_call(expr({
                assert_all(x)
                assert_fun(x)
                x <- assert_mult(x)
                if (x) {
                  x <- assert_character(x)
                }
                fn = function(x) {
                  x + 1
                }
            }), call_name = "assert", grep = TRUE, skip_first = FALSE)
        })
        expect_equal(test_summary(output), list(length = 4, attributes = list(names = c("", 
            "", "", ""))))
        expect_equal(test_summary(output[[1]]), list("assert_all(x)"))
        expect_equal(test_summary(output[[2]]), list("assert_fun(x)"))
        expect_equal(test_summary(output[[3]]), list("assert_mult(x)"))
        expect_equal(test_summary(output[[4]]), list("assert_character(x)"))
    })
test_that("expr_extract_call(expr(data[, sum(x)]), call_name = \"sum\", grep = FALSE, \n    skip_first = FALSE)", 
    {
        output <- expect_list({
            expr_extract_call(expr(data[, sum(x)]), call_name = "sum", 
                grep = FALSE, skip_first = FALSE)
        })
        expect_equal(test_summary(output), list(length = 1, attributes = list(names = "")))
        expect_equal(test_summary(output[[1]]), list("sum(x)"))
    })
test_that("expr_extract_call(expr(data[, list(sum(x), mean(x))]), call_name = c(\"sum\", \n    \"mean\"), grep = FALSE, skip_first = FALSE)", 
    {
        output <- expect_list({
            expr_extract_call(expr(data[, list(sum(x), mean(x))]), 
                call_name = c("sum", "mean"), grep = FALSE, skip_first = FALSE)
        })
        expect_equal(test_summary(output), list(length = 2, attributes = list(names = c("", 
            ""))))
        expect_equal(test_summary(output[[1]]), list("sum(x)"))
        expect_equal(test_summary(output[[2]]), list("mean(x)"))
    })
