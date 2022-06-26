test_that("check_json", {
  local_edition(3)
  expect_snapshot(check_json(x = "[1,3]", check_numeric(len = 2)),
  cran = TRUE)
  expect_snapshot(check_json(x = "[1,3]", check_numeric(len = 1)),
  cran = TRUE)
  expect_snapshot(check_json(x = "{\"one\":[1,3]}", check_named_list(
    structure = list(one = numeric()))), cran = TRUE)
  expect_snapshot(check_json(x = "{\"one\":[1,3]}", check_named_list(
    structure = list(two = numeric()))), cran = TRUE)
  x <- jsonlite::toJSON(list(inputId = "dfs", label = "Date", value = NULL,
    min = "2021-01-01", max = "2022-01-01", format = "yyyy-mm-dd",
    startview = "month"), null = "null")
  expect_snapshot(check_json(x, check_named_list(structure = list(
    inputId = string(), label = string(), value = date_format(NULL,
      format = "ymd"), min = date_format(NULL, format = "ymd"), max = date_format(
      NULL, format = "ymd"), format = string(date("yyyy-mm-dd")),
    startview = choice("month", choices = c("month", "year", "decade"))))),
  cran = TRUE)
})
