test_that("check_call_names", {
  local_edition(3)
  x = expr(SUM(x) + MN(y))
  expect_snapshot(check_call_names(x, "SUM"), cran = TRUE)
  x = expr({
    x <- SUM(x) + MN(y)
  })
  expect_snapshot(check_call_names(x, call_names = "SUM"), cran = TRUE)
  expect_snapshot(check_call_names(x, call_names = "SUM", ignore.assignments = "="),
  cran = TRUE)
})
