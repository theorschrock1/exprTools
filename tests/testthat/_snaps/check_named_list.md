# check_named_list

    Code
      check_named_list(list(x = c("c", NA_character_), y = 1:5), structure = list(x = char(),
      y = numeric()))
    Output
      [1] TRUE

---

    Code
      check_named_list(list(x = c("c", NA_character_), y = 1:5), structure = list(x = char(
        any.missing = FALSE), y = numeric()))
    Output
      List element "x" Contains missing values (element 2)

---

    Code
      check_named_list(list(x = c("c", NA_character_)), structure = list(x = char(),
      y = numeric()))
    Output
      [1] "Must be a permutation of set {x,y}"

---

    Code
      check_named_list(list(x = c("c", NA_character_)), structure = list(x = char(),
      y = numeric(NULL)))
    Output
      [1] TRUE

---

    Code
      check_named_list(list(x = LETTERS), structure = list(x = subset(choices = LETTERS)))
    Output
      [1] TRUE

---

    Code
      check_named_list(list(x = LETTERS), structure = list(x = subset(choices = letters)))
    Output
      List element "x" Must be a subset of {'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'}, but is {'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'}

---

    Code
      check_named_list(list(x = 1, y = 1, z = 4), structure = list(x = num(), y = num(),
      z = num()))
    Output
      [1] TRUE

---

    Code
      check_named_list(list(x = 1, y = 1, z = 4, a = 1), structure = list(x = num(),
      y = num(), z = num()))
    Output
      [1] "Must be a permutation of set {x,y,z}"

---

    Code
      check_named_list(list(x = 1, y = 1, z = 4, a = 1), structure = list(x = num(),
      y = num(), z = num()), extra.items = TRUE)
    Output
      [1] TRUE

---

    Code
      check_named_list(list(x = 1, y = 1, a = 1), structure = list(x = num(), y = num(),
      z = num()), extra.items = TRUE)
    Output
      [1] "Must include the elements {x,y,z}"

---

    Code
      check_named_list(list(x = 1, y = 1, a = 1), structure = list(x = num(), y = num(),
      z = num(NULL)), extra.items = TRUE)
    Output
      [1] TRUE

---

    Code
      check_named_list(NULL, structure = list(x = num(), y = num(), z = num(NULL)))
    Output
      [1] "Must not be null"

---

    Code
      check_named_list(NULL, structure = list(x = num(), y = num(), z = num(NULL)),
      null.ok = TRUE)
    Output
      [1] TRUE

