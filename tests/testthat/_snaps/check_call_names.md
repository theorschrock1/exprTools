# check_call_names

    Code
      check_call_names(x, "SUM")
    Output
      Unknown function call:`MN`

---

    Code
      check_call_names(x, call_names = "SUM")
    Output
      Unknown function call:`MN`

---

    Code
      check_call_names(x, call_names = "SUM", ignore.assignments = "=")
    Output
      Multiple unknown function calls:`<-,MN`

