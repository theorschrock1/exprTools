# expr_deparse_lines

    Code
      expr_deparse_lines({
        sq <- (function(x) {
          x^2
        })
        sq(2)
        sq(4)
        if (x) { } else {
          y
        }
        })
    Output
      sq <- (function(x) {
          x^2
      })
      sq(2)
      sq(4)
      if (x) {
      } else {
          y
      }

