# check_code_usage

    Code
      check_code_usage(x, valid_vars = "y", valid_functions = "SUM")
    Output
      [1] TRUE

---

    Code
      check_code_usage(x, valid_vars = "c", valid_functions = "SM")
    Output
      Unknown function call:`SUM`.  Variable/s `y` not found.

---

    Code
      check_code_usage(x, valid_vars = "y", valid_functions = "SM")
    Output
      Unknown function call:`SUM`.

