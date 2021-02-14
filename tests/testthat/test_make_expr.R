test_that("make_expr", {
  local_edition(3)
  x = data.frame(x = 1:3)
  expect_snapshot(make_expr(x), cran = TRUE)
  x = list(1, 3, 4)
  expect_snapshot(make_expr(x), cran = TRUE)
})
