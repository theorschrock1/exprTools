# expr_find_call_names

    Code
      expr_find_call_names(x)
    Output
      [1] "<-"       "("        "function" "+"        "SUM"     

---

    Code
      expr_find_call_names(x, ignore.wrapper = FALSE)
    Output
      [1] "{"        "<-"       "("        "function" "+"        "SUM"     

---

    Code
      expr_find_call_names(x, ignore = c("<-", "+"))
    Output
      [1] "("        "function" "SUM"     

