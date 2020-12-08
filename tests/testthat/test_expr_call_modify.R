test_that("expr_call_modity",{
  local_edition(3)
  fn = function(a, b, c, d = 0, e = 0) {
    return(a + b + c + d + e)
  }
  call = expr(fn(1, 3, 4))

  expect_snapshot(
    expr_call_modify(expr(fn(1, 3, 4)), a = 10)
  )
  expect_snapshot(
  expr_call_modify(expr(fn(1, 3, 4)), f = 3)
)
})
test_that("expr_call_modity_with_dots",{
  local_edition(3)
  fn = function(a, b, c, d = 0, e = 0, ...) {
    return(a + b + c + d + e)
  }
  call_expr = expr(fn(1, 3, 4))
expect_snapshot(
  expr_call_modify(call_expr, f = 3, a = zap())
  )
})
