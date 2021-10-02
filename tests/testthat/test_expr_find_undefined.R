test_that("expr_find_undefined", {
  local_edition(3)
  x = expr({
    x = y * 2
    if (x == 1) {
      out = 1
    } else if (x >= 1) {
      1
    } else {
      NULL
    }
    out + 1
  })
  expect_snapshot(expr_find_undefined(x, init_vars = "y"), cran = TRUE)
  expect_snapshot(expr_find_undefined(x, init_vars = NULL), cran = TRUE)
  x = expr({
    x = y * x
    x
  })
  expect_snapshot(expr_find_undefined(x, init_vars = NULL), cran = TRUE)
  expect_snapshot(expr_find_undefined(x, init_vars = "x"), cran = TRUE)
  expect_snapshot(expr_find_undefined(x, init_vars = "y"), cran = TRUE)
  expect_snapshot(expr_find_undefined(x, init_vars = c("y", "x")), cran = TRUE)
  x = expr({
    x = y * x
    c
  })
  expect_snapshot(expr_find_undefined(x, init_vars = c("y", "x")), cran = TRUE)
  expect_snapshot(expr_find_undefined(x, init_vars = c("y", "x", "c")), cran = TRUE)
  expect_snapshot(expr_find_undefined(x=expr(c), init_vars = c('y', 'x', 'c')), cran = TRUE)
  expect_snapshot(expr_find_undefined(x=expr(a), init_vars = c('y', 'x', 'c')),cran=TRUE)
})
