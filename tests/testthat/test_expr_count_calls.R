test_that("expr_count_calls", {
  local_edition(3)
  x = expr(fn(fn(x, y = fn(fn(x)))))
  expect_snapshot(expr_count_calls(x, call_name = "fn"), cran = TRUE)
  expect_snapshot(expr_count_calls(x, call_name = "x"), cran = TRUE)
})
