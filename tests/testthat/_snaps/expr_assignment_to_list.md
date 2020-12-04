# expr_assignment_to_list

    Code
      expr_assignment_to_list(x)
    Output
      $g
      (function(x) x + 3)
      
      $c
      g(1)
      
      $b
      c + 1
      

---

    Code
      expr_assignment_to_list(x)
    Output
      $g
      (function(x) x + 3)
      
      $c
      (function(y) {
          x + 3
      })
      
      $`if (y == 1) {`
      if (y == 1) {
          x
      } else {
          y
      }
      

---

    Code
      expr_assignment_to_list(x, make.names = FALSE)
    Output
      $g
      (function(x) x + 3)
      
      $c
      (function(y) {
          x + 3
      })
      
      [[3]]
      if (y == 1) {
          x
      } else {
          y
      }
      

