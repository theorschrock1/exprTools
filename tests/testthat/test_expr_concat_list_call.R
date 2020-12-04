test_that("expr_concat_list_call", {
  local_edition(3)
  x = expr(list(mpg, cyl))
  y = expr(list(am, vs))
  expect_snapshot(expr_concat_list_call(x, y), cran = TRUE)
})
