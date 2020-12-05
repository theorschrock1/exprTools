# expr_find_replace

    Code
      expr_find_replace(find, replacement, in_expr)
    Output
      data[, .(sum_mpg = sum(mpg), max_mpg = max(mpg))]

---

    Code
      expr_find_replace(find, replacement, in_expr, match.first = FALSE)
    Output
      list(list(sum_mpg = sum(mpg), max_mpg = max(mpg), min_mpg = min(mpg)), 
          list(sum_mpg = sum(mpg), max_mpg = max(mpg), min_mpg = min(mpg)))

---

    Code
      expr_find_replace(find, replacement, in_expr, match.first = TRUE)
    Output
      list(list(sum_mpg = sum(mpg), max_mpg = max(mpg), min_mpg = min(mpg)), 
          list(J))

