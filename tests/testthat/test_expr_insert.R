test_that("expr_insert", {
  local_edition(3)
  x = expr(list(c("a", "b", "c"), 1:5, TRUE))
  y <- expr(unlist)
  expect_snapshot(expr_insert(x, y, c(1)), cran = TRUE)
  y <- expr(LETTERS[1:3])
  expect_snapshot(expr_insert(x, y, c(2)), cran = TRUE)
  expect_snapshot(expr_insert(x, y, c(2, 4)), cran = TRUE)
})
