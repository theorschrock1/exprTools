test_that("expr_find_constants", {
  local_edition(3)
  x = expr(list(1L, T, "a", 1.04, fun("x")))
  expect_snapshot(expr_find_constants(x), cran = TRUE)
})
