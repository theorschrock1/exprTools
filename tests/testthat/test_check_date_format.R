test_that("check_date_format", {
  local_edition(3)
  expect_snapshot(check_date_format("2022-01-01", format = "ymd"),
  cran = TRUE)
  expect_snapshot(check_date_format("20-01-01", format = "ymd"),
  cran = TRUE)
  expect_snapshot(check_date_format("01/01/2022", format = "ymd"),
  cran = TRUE)
  expect_snapshot(check_date_format("01/30/2022", format = "dmy"),
  cran = TRUE)
  expect_snapshot(check_date_format("01/12/2022", format = "dmy"),
  cran = TRUE)
  expect_snapshot(check_date_format("01/12/2022 12:12:10", format = "dmy"),
  cran = TRUE)
  expect_snapshot(check_date_format("01/12/2022 12:12:10", format = "dmy_hms"),
  cran = TRUE)
})
