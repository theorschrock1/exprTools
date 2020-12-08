# expr_detect_name

    Code
      expr_detect_name(expr(glue_data(dt,
        "Hello {name}, you are {get_age(name)} years old.")), name = "glue_data",
      search_in_strings = FALSE)
    Output
      [1] TRUE

---

    Code
      expr_detect_name(expr(glue_data(dt,
        "Hello {name}, you are {get_age(name)} years old.")), name = "glue_data",
      search_in_strings = TRUE)
    Output
      [1] FALSE

---

    Code
      expr_detect_name(expr(glue_data(dt,
        "Hello {name}, you are {get_age(name)} years old.")), name = "get_age",
      search_in_strings = FALSE)
    Output
      [1] FALSE

---

    Code
      expr_detect_name(expr(glue_data(dt,
        "Hello {name}, you are {get_age(name)} years old.")), name = "get_age",
      search_in_strings = TRUE)
    Output
      [1] TRUE

