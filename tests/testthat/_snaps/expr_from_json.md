# expr_from_json

    Code
      expr_from_json(expr_to_json(toJSON(out, null = "null", auto_unbox = T)))
    Output
      toJSON(out, null = "null", auto_unbox = T)

---

    Code
      expr_from_json(expr_to_json(check_named_list(structure = list(type = string(
        "langauge"), attributes = list(), value = char(null.ok = T)))))
    Output
      check_named_list(structure = list(type = string("langauge"), 
          attributes = list(), value = char(null.ok = T)))

