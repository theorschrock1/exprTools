# expr_find_undefined

    Code
      expr_find_undefined(x, init_vars = "y")
    Output
      character(0)

---

    Code
      expr_find_undefined(x, init_vars = NULL)
    Output
      [1] "y"

---

    Code
      expr_find_undefined(x, init_vars = NULL)
    Output
      [1] "y" "x"

---

    Code
      expr_find_undefined(x, init_vars = "x")
    Output
      [1] "y"

---

    Code
      expr_find_undefined(x, init_vars = "y")
    Output
      [1] "x"

---

    Code
      expr_find_undefined(x, init_vars = c("y", "x"))
    Output
      character(0)

---

    Code
      expr_find_undefined(x, init_vars = c("y", "x"))
    Output
      [1] "c"

---

    Code
      expr_find_undefined(x, init_vars = c("y", "x", "c"))
    Output
      character(0)

