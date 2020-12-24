test_that("expr_find_call_names", {
  local_edition(3)
  x = expr({
    fd <- (function(x) {
      SUM(x) + SUM(y)
    })
  })
  expect_snapshot(expr_find_call_names(x), cran = TRUE)
  expect_snapshot(expr_find_call_names(x, ignore.wrapper = FALSE), cran = TRUE)
  expect_snapshot(expr_find_call_names(x, ignore = c("<-", "+")), cran = TRUE)
})
