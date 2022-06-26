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
})
