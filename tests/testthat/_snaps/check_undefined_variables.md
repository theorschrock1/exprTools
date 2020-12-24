# check_undefined_variables

    Code
      check_undefined_variables(x, init_vars = "y")
    Output
      [1] TRUE

---

    Code
      check_undefined_variables(x, init_vars = NULL)
    Output
      Variable/s `y` not found

---

    Code
      check_undefined_variables(x, init_vars = NULL)
    Output
      Variable/s `y,x` not found

---

    Code
      check_undefined_variables(x, init_vars = "x")
    Output
      Variable/s `y` not found

---

    Code
      check_undefined_variables(x, init_vars = "y")
    Output
      Variable/s `x` not found

---

    Code
      check_undefined_variables(x, init_vars = c("y", "x"))
    Output
      [1] TRUE

---

    Code
      check_undefined_variables(x, init_vars = c("y", "x"))
    Output
      Variable/s `c` not found

---

    Code
      check_undefined_variables(x, init_vars = c("y", "x", "c"))
    Output
      [1] TRUE

---

    Code
      check_undefined_variables(x, init_vars = NULL, env = env(x = 1, y = 3))
    Output
      Variable/s `c` not found

---

    Code
      check_undefined_variables(x, init_vars = NULL, env = env(x = 1, y = 3))
    Output
      Variable/s `c` not found

