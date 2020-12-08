# expr_extract_call

    Code
      expr_extract_call(expr({
        assert_all(x)
        assert_fun(x)
        x <- assert_mult(x)
        if (x) {
          x <- assert_character(x)
        }
        fn = (function(x) {
          x + 1
        })
      }), call_name = "assert", grep = TRUE, skip_first = FALSE)
    Output
      [[1]]
      assert_all(x)
      
      [[2]]
      assert_fun(x)
      
      [[3]]
      assert_mult(x)
      
      [[4]]
      assert_character(x)
      

---

    Code
      expr_extract_call(expr(data[, sum(x)]), call_name = "sum", grep = FALSE,
      skip_first = FALSE)
    Output
      [[1]]
      sum(x)
      

---

    Code
      expr_extract_call(expr(data[, list(sum(x), mean(x))]), call_name = c("sum",
        "mean"), grep = FALSE, skip_first = FALSE)
    Output
      [[1]]
      sum(x)
      
      [[2]]
      mean(x)
      

