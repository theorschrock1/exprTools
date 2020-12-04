test_that("expr_extract_named_bracket", {
  local_edition(3)
  name = ".SD"
  x = expr(data[, .(.SD[, sum(mpg)]), by = .(am)])
  expect_snapshot(expr_extract_named_bracket(x, name), cran = TRUE)
  x = expr(data[, .(.SD_543[, sum(mpg)]), by = .(am)])
  expect_snapshot(expr_extract_named_bracket(x, name, grep = FALSE), cran = TRUE)
  expect_snapshot(expr_extract_named_bracket(x, name, grep = TRUE), cran = TRUE)
  x = expr(.SD[, .(.SD[, sum(mpg)]), by = .(am)])
  expect_snapshot(expr_extract_named_bracket(x, name, skip_first = TRUE), cran = TRUE)
  expect_snapshot(expr_extract_named_bracket(x, name, skip_first = FALSE), cran = TRUE)
})
