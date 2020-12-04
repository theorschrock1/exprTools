test_that("expr_find_integers", {
  local_edition(3)
  x = expr(list(1L, 1, T, "a", 1.04, fun("x")))
  expect_snapshot(expr_find_integers(x), cran = TRUE)
})
