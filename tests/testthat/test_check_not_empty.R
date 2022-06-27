test_that("check_not_empty", {
  local_edition(3)
  expect_snapshot(check_not_empty(x = "", message = "Must have a value"),
  cran = TRUE)
  expect_snapshot(check_not_empty(x = NULL, message = "Must have a value"),
  cran = TRUE)
  expect_snapshot(check_not_empty(x = character(),
  message = "Must have a value"), cran = TRUE)
  expect_snapshot(check_not_empty(x = NA, message = "Must have a value"),
  cran = TRUE)
  expect_snapshot(check_not_empty(x = c("valid", "sd"),
  max_len = 1), cran = TRUE)
  expect_snapshot(check_not_empty(x = c("valid"),
  max_len = 1), cran = TRUE)
})
