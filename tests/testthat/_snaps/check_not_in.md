# check_not_in

    Code
      check_not_in(x = "Jim", subset = c("Jim", "Bob"), empty.ok = FALSE)
    Output
      [1] "Must be a unique name.  Name already exists"

---

    Code
      check_not_in(x = "", subset = c("Jim", "Bob"), empty.ok = FALSE)
    Output
      [1] "Name is required"

---

    Code
      check_not_in(x = "", subset = c("Jim", "Bob"), empty.ok = TRUE)
    Output
      [1] TRUE

---

    Code
      check_not_in(x = "Tim", subset = c("Jim", "Bob"), empty.ok = FALSE)
    Output
      [1] TRUE

