# expr_extract_named_bracket

    Code
      expr_extract_named_bracket(x, name)
    Output
      [[1]]
      .SD[, sum(mpg)]
      

---

    Code
      expr_extract_named_bracket(x, name, grep = FALSE)
    Output
      NULL

---

    Code
      expr_extract_named_bracket(x, name, grep = TRUE)
    Output
      [[1]]
      .SD_543[, sum(mpg)]
      

---

    Code
      expr_extract_named_bracket(x, name, skip_first = TRUE)
    Output
      [[1]]
      .SD[, sum(mpg)]
      

---

    Code
      expr_extract_named_bracket(x, name, skip_first = FALSE)
    Output
      .SD[, .(.SD[, sum(mpg)]), by = .(am)]

