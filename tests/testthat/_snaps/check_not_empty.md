# check_not_empty

    Code
      check_not_empty(x = "", message = "Must have a value")
    Output
      [1] "Must have a value"

---

    Code
      check_not_empty(x = NULL, message = "Must have a value")
    Output
      [1] "Must have a value"

---

    Code
      check_not_empty(x = character(), message = "Must have a value")
    Output
      [1] "Must have a value"

---

    Code
      check_not_empty(x = NA, message = "Must have a value")
    Output
      [1] "Must have a value"

---

    Code
      check_not_empty(x = c("valid", "sd"), max_len = 1)
    Output
      Must have max length of 1

---

    Code
      check_not_empty(x = c("valid"), max_len = 1)
    Output
      [1] TRUE

