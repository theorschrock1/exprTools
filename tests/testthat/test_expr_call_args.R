test_that("expr_call_args", {
  local_edition(3)
  x = expr(list(mpg = 4 + 1, cyl = 4, am = "g", vs = "f"))
  expect_snapshot(expr_call_args(x), cran = TRUE)
})
