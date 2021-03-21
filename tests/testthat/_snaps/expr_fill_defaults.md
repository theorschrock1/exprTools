# expr_fill_defaults

    Code
      expr_fill_defaults(expr(cor(x = 1:4)))
    Output
      cor(x = 1:4, y = NULL, use = "everything", method = c("pearson", 
          "kendall", "spearman"))

---

    Code
      expr_fill_defaults(expr(fn(x = 1:4, c = 3)))
    Output
      fn(x = 1:4, c = 3, y = 4)

