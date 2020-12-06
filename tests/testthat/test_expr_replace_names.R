test_that("expr_replace_names", {
  local_edition(3)
  x = expr(data[, .(sum(x), sum(x), sum(x), na.rm = TRUE)])
  expect_snapshot(expr_replace_names(x, find = "sum", replace = "max"),
  cran = TRUE)
  expect_snapshot(expr_replace_names(x, find = "sum", replace = "max",
    vars.only = TRUE), cran = TRUE)
  x = expr(data[, .(x(x), sum(x), sum(x), na.rm = TRUE)])
  expect_snapshot(expr_replace_names(x, find = "x", replace = "x_new"),
  cran = TRUE)
  expect_snapshot(expr_replace_names(x, find = "x", replace = "x_new",
    calls.only = TRUE), cran = TRUE)
  x = expr({
    fn
    x <- fn(x)
    y <- lapply(x, function(x) fn(x) - 1)
    f2 <- (function(x) {
      -fn(x)
    })
    if (fn()) {
      y
    } else {
      x
    }
  })
  expect_snapshot(expr_replace_names(x, "fn", "new_fn"), cran = TRUE)
  expect_snapshot(expr_replace_names(x, "fn", "new_fn", vars.only = TRUE),
  cran = TRUE)
  expect_snapshot(expr_replace_names(x, "fn", "new_fn", calls.only = TRUE),
  cran = TRUE)
})
