# expr_replace

    Code
      expr_replace(x, find = "x", replacement = expr(y))
    Output
      data[, .(x, y, x, na.rm = TRUE)]

---

    Code
      expr_replace(x, find = expr(x), replacement = expr(y))
    Output
      data[, .(y, "x", x, na.rm = TRUE)]

---

    Code
      expr_replace(x, find = expr(x), replacement = exprs(z, t))
    Output
      data[, .(z, t, "x", x, na.rm = TRUE)]

---

    Code
      expr_replace(x, find = expr(x), replacement = exprs(1, 1))
    Output
      data[, .(1, 1, "x", x, na.rm = TRUE)]

---

    Code
      expr_replace(x, find = TRUE, replacement = FALSE)
    Output
      data[, .(x, "x", x, na.rm = FALSE)]

