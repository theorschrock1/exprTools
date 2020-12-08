# expr_call_modity

    Code
      expr_call_modify(expr(fn(1, 3, 4)), a = 10)
    Output
      fn(a = 10, b = 3, c = 4)

---

    Code
      expr_call_modify(expr(fn(1, 3, 4)), f = 3)
    Error <simpleError>
      fn does not support argument/s: [f]. Valid arguments are [a,b,c,d,e]

# expr_call_modity_with_dots

    Code
      expr_call_modify(call_expr, f = 3, a = zap())
    Output
      fn(b = 3, c = 4, f = 3)

