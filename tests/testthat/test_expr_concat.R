test_that("expr_concat", {
  local_edition(3)
  x = expr({
    x = 3
  })
  y = expr({
    y = 4
  })
  expect_snapshot(expr_concat(y, x), cran = TRUE)
  x = expr(list(x = 3))
  y = expr(list(y = 3))
  expect_snapshot(expr_concat(y, x), cran = TRUE)
})
