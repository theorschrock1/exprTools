test_that("expr_find_logical", {
  local_edition(3)
  x = expr(list(1L, 1, T, F, TRUE, "a", 1.04, fun("x")))
  expect_snapshot(expr_find_logical(x, unique = FALSE), cran = TRUE)
  expect_snapshot(expr_find_logical(x, unique = TRUE), cran = TRUE)
})
