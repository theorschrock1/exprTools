test_that("expr_deparse_lines", {
  local_edition(3)
  expect_snapshot(expr_deparse_lines({
    sq <- (function(x) {
      x^2
    })
    sq(2)
    sq(4)
    if (x) { } else {
      y
    }
    }), cran = TRUE)
  })
