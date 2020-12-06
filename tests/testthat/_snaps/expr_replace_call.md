# expr_replace_call

    Code
      expr_replace_call(x, call_name = "fn", replacement = "new_fn", first.only = TRUE)
    Output
      new_fn(fn(x))

---

    Code
      expr_replace_call(x, call_name = "fn", replacement = "new_fn", first.only = FALSE)
    Output
      new_fn(new_fn(x))

---

    Code
      expr_replace_call(x, call_name = "fn", replacement = "new_fn", first.only = FALSE)
    Output
      {
          x = new_fn(x)
          new_fn(new_fn(x))
          fn
      }

