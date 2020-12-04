test_that("expr_extract_lines", {
  local_edition(3)
  expect_snapshot(expr_extract_lines({
    x = 1:10
    lok <- data.table(x = x)
    lok[, mean(x)]
    if (mean > 20) {
      x
    } else {
      y
    }
  }), cran = TRUE)
})
