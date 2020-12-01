library(exprTools)
init <- NULL
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
expr_extract_call(expr(data[, sum(x)]), call_name = "sum", grep = FALSE, 
    skip_first = FALSE)
expr_extract_call(expr(data[, list(sum(x), mean(x))]), call_name = c("sum", 
    "mean"), grep = FALSE, skip_first = FALSE)
