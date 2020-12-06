# expr_insert

    Code
      expr_insert(x, y, c(1))
    Output
      unlist(c("a", "b", "c"), 1:5, TRUE)

---

    Code
      expr_insert(x, y, c(2))
    Output
      list(LETTERS[1:3], 1:5, TRUE)

---

    Code
      expr_insert(x, y, c(2, 4))
    Output
      list(c("a", "b", LETTERS[1:3]), 1:5, TRUE)

