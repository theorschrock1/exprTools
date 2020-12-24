# expr_find_assign

    Code
      expr_find_assign(expr({
        fn <- (function(x) {
          out = switch_expr(x, constant = , symbol = character(), pairlist = flat_map_chr(
            x, find_assign_rec), call = find_assign_call(x))
          out2 = unique(out)
          out2
        })
      }))
    Output
      [1] "fn"   "out"  "out2"

