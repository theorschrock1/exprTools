test_that("expr_replace", {
  local_edition(3)
  x = expr(data[, .(x, "x", x, na.rm = TRUE)])
  expect_snapshot(expr_replace(x, find = "x", replacement = expr(
    y)), cran = TRUE)
  expect_snapshot(expr_replace(x, find = expr(x), replacement = expr(
    y)), cran = TRUE)
  expect_snapshot(expr_replace(x, find = expr(x), replacement = exprs(
    z, t)), cran = TRUE)
  expect_snapshot(expr_replace(x, find = expr(x), replacement = exprs(
    1, 1)), cran = TRUE)
  expect_snapshot(expr_replace(x, find = TRUE, replacement = FALSE),
  cran = TRUE)
})
