# expr_extract_lines

    Code
      expr_extract_lines({
        x = 1:10
        lok <- data.table(x = x)
        lok[, mean(x)]
        if (mean > 20) {
          x
        } else {
          y
        }
      })
    Output
      [[1]]
      x = 1:10
      
      [[2]]
      lok <- data.table(x = x)
      
      [[3]]
      lok[, mean(x)]
      
      [[4]]
      if (mean > 20) {
          x
      } else {
          y
      }
      

