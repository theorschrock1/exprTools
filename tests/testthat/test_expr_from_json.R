test_that("expr_from_json", {
  local_edition(3)
  expect_snapshot(expr_from_json(expr_to_json(toJSON(out, null = "null", auto_unbox = T))), cran = TRUE)
  expect_snapshot(expr_from_json(expr_to_json(check_named_list(structure = list(type = string("langauge"),
  attributes = list(), value = char(null.ok = T))))), cran = TRUE)
})
