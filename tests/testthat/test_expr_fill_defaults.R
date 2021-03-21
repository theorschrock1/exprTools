test_that("expr_fill_defaults", {
  local_edition(3)
  expect_snapshot(expr_fill_defaults(expr(cor(x = 1:4))), cran = TRUE)
  fn = (function(x, y = 4, ...) { })
  expect_snapshot(expr_fill_defaults(expr(fn(x = 1:4, c = 3))), cran = TRUE)
  })
