test_that("expr_replace_call", {
  local_edition(3)
  x = expr(fn(fn(x)))
  expect_snapshot(expr_replace_call(x, call_name = "fn", replacement = "new_fn",
    first.only = TRUE), cran = TRUE)
  expect_snapshot(expr_replace_call(x, call_name = "fn", replacement = "new_fn",
    first.only = FALSE), cran = TRUE)
  x = expr({
    x = fn(x)
    fn(fn(x))
    fn
  })
  expect_snapshot(expr_replace_call(x, call_name = "fn", replacement = "new_fn",
    first.only = FALSE), cran = TRUE)
})
