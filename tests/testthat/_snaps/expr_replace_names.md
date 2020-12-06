# expr_replace_names

    Code
      expr_replace_names(x, find = "sum", replace = "max")
    Output
      data[, .(max(x), max(x), max(x), na.rm = TRUE)]

---

    Code
      expr_replace_names(x, find = "sum", replace = "max", vars.only = TRUE)
    Output
      data[, .(sum(x), sum(x), sum(x), na.rm = TRUE)]

---

    Code
      expr_replace_names(x, find = "x", replace = "x_new")
    Output
      data[, .(x_new(x_new), sum(x_new), sum(x_new), na.rm = TRUE)]

---

    Code
      expr_replace_names(x, find = "x", replace = "x_new", calls.only = TRUE)
    Output
      data[, .(x_new(x), sum(x), sum(x), na.rm = TRUE)]

---

    Code
      expr_replace_names(x, "fn", "new_fn")
    Output
      {
          new_fn
          x <- new_fn(x)
          y <- lapply(x, function(x) new_fn(x) - 1)
          f2 <- (function(x) {
              -new_fn(x)
          })
          if (new_fn()) {
              y
          }
          else {
              x
          }
      }

---

    Code
      expr_replace_names(x, "fn", "new_fn", vars.only = TRUE)
    Output
      {
          new_fn
          x <- fn(x)
          y <- lapply(x, function(x) fn(x) - 1)
          f2 <- (function(x) {
              -fn(x)
          })
          if (fn()) {
              y
          }
          else {
              x
          }
      }

---

    Code
      expr_replace_names(x, "fn", "new_fn", calls.only = TRUE)
    Output
      {
          fn
          x <- new_fn(x)
          y <- lapply(x, function(x) new_fn(x) - 1)
          f2 <- (function(x) {
              -new_fn(x)
          })
          if (new_fn()) {
              y
          }
          else {
              x
          }
      }

