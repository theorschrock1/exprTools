# expr_pluck

    Code
      expr_pluck(x, c(1))
    Output
      list

---

    Code
      expr_pluck(x, c(2))
    Output
      c("a", "b", "c")

---

    Code
      expr_pluck(x, c(3))
    Output
      1:5

---

    Code
      expr_pluck(x, c(2, 4))
    Output
      [1] "c"

---

    Code
      expr_pluck(x, c(3, 1))
    Output
      `:`

---

    Code
      expr_pluck(x, c(3, 5))
    Error <simpleError>
      subscript out of bounds

