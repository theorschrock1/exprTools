test_that("expr_build_formula", {
  local_edition(3)
  lhs <- c("a", "b", "c")
  rhs <- c("x", "y", "z")
  expect_snapshot(expr_build_formula(lhs, rhs), cran = TRUE)
})
