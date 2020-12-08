test_that("check_named_list", {
  local_edition(3)
  expect_snapshot(check_named_list(list(x = c("c", NA_character_), y = 1:5),
  structure = list(x = char(), y = numeric())), cran = TRUE)
  expect_snapshot(check_named_list(list(x = c("c", NA_character_), y = 1:5),
  structure = list(x = char(any.missing = FALSE), y = numeric())), cran = TRUE)
  expect_snapshot(check_named_list(list(x = c("c", NA_character_)), structure = list(
    x = char(), y = numeric())), cran = TRUE)
  expect_snapshot(check_named_list(list(x = c("c", NA_character_)), structure = list(
    x = char(), y = numeric(NULL))), cran = TRUE)
  expect_snapshot(check_named_list(list(x = LETTERS), structure = list(x = subset(
    choices = LETTERS))), cran = TRUE)
  expect_snapshot(check_named_list(list(x = LETTERS), structure = list(x = subset(
    choices = letters))), cran = TRUE)
  expect_snapshot(check_named_list(list(x = 1, y = 1, z = 4), structure = list(x = num(),
  y = num(), z = num())), cran = TRUE)
  expect_snapshot(check_named_list(list(x = 1, y = 1, z = 4, a = 1), structure = list(
    x = num(), y = num(), z = num())), cran = TRUE)
  expect_snapshot(check_named_list(list(x = 1, y = 1, z = 4, a = 1), structure = list(
    x = num(), y = num(), z = num()), extra.items = TRUE), cran = TRUE)
  expect_snapshot(check_named_list(list(x = 1, y = 1, a = 1), structure = list(x = num(),
  y = num(), z = num()), extra.items = TRUE), cran = TRUE)
  expect_snapshot(check_named_list(list(x = 1, y = 1, a = 1), structure = list(x = num(),
  y = num(), z = num(NULL)), extra.items = TRUE), cran = TRUE)
  expect_snapshot(check_named_list(NULL, structure = list(x = num(), y = num(), z = num(
    NULL))), cran = TRUE)
  expect_snapshot(check_named_list(NULL, structure = list(x = num(), y = num(), z = num(
    NULL)), null.ok = TRUE), cran = TRUE)
})
