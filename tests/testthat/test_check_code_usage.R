test_that("check_code_usage", {
  local_edition(3)
  x = expr({
    SUM(y)
  })
  expect_snapshot(check_code_usage(x, valid_vars = "y", valid_functions = "SUM"), cran = TRUE)
  expect_snapshot(check_code_usage(x, valid_vars = "c", valid_functions = "SM"), cran = TRUE)
  expect_snapshot(check_code_usage(x, valid_vars = "y", valid_functions = "SM"), cran = TRUE)
})
