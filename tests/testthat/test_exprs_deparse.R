test_that("exprs_deparse", {
  local_edition(3)
  x = exprs(lapply(x, function(x) x * x), glue("something {x}"))
  expect_snapshot(exprs_deparse(x), cran = TRUE)
})
