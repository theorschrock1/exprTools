test_that("expr_to_json", {
  local_edition(3)
  expect_snapshot(expr_to_json(toJSON(out, null = "null", auto_unbox = T)),
  cran = TRUE)
})
