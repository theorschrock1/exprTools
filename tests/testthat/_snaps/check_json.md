# check_json

    Code
      check_json(x = "[1,3]", check_numeric(len = 2))
    Output
      [1] TRUE

---

    Code
      check_json(x = "[1,3]", check_numeric(len = 1))
    Output
      [1] "Must have length 1, but has length 2"

---

    Code
      check_json(x = "{\"one\":[1,3]}", check_named_list(structure = list(one = numeric())))
    Output
      [1] TRUE

---

    Code
      check_json(x = "{\"one\":[1,3]}", check_named_list(structure = list(two = numeric())))
    Output
      [1] "Names must be a permutation of set {'two'}, but has extra elements {'one'}"

