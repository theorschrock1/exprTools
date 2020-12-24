test_that("check_undefined_variables", {
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
  expect_snapshot(check_undefined_variables(x, init_vars = "y"), cran = TRUE)
  expect_snapshot(check_undefined_variables(x, init_vars = NULL), cran = TRUE)
  x = expr({
    x = y * x
    x
  })
  expect_snapshot(check_undefined_variables(x, init_vars = NULL), cran = TRUE)
  expect_snapshot(check_undefined_variables(x, init_vars = "x"), cran = TRUE)
  expect_snapshot(check_undefined_variables(x, init_vars = "y"), cran = TRUE)
  expect_snapshot(check_undefined_variables(x, init_vars = c("y", "x")), cran = TRUE)
  x = expr({
    x = y * x
    c
  })
  expect_snapshot(check_undefined_variables(x, init_vars = c("y", "x")), cran = TRUE)
  expect_snapshot(check_undefined_variables(x, init_vars = c("y", "x", "c")), cran = TRUE)
  env(x = 1, y = 3)
  expect_snapshot(check_undefined_variables(x, init_vars = NULL, env = env(x = 1, y = 3)),
  cran = TRUE)
  expect_snapshot(check_undefined_variables(x, init_vars = NULL, env = env(x = 1, y = 3)),
  cran = TRUE)
})
