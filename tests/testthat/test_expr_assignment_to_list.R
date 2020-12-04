test_that("expr_assignment_to_list", {
  local_edition(3)
  x <- call_args(expr({
    g = (function(x) x + 3)
    c = g(1)
    b = c + 1
  }))
  expect_snapshot(expr_assignment_to_list(x), cran = TRUE)
  x <- call_args(expr({
    g = (function(x) x + 3)
    c = (function(y) {
      x + 3
    })
    if (y == 1) {
      x
    } else {
      y
    }
  }))
  expect_snapshot(expr_assignment_to_list(x), cran = TRUE)
  expect_snapshot(expr_assignment_to_list(x, make.names = FALSE), cran = TRUE)
})
