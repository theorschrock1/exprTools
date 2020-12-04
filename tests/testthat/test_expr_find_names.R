test_that("expr_find_names", {
  local_edition(3)
  x = expr(data[, .(sum(mpg), mean(vs)), by = .(am)])
  expect_snapshot(expr_find_names(x), cran = TRUE)
})
