test_that("expr_find_strings", {
  local_edition(3)
  x = expr(list(1L, T, "a", 1.04, fun("x")))
  expect_snapshot(expr_find_strings(x), cran = TRUE)
})
