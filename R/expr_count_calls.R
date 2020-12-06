#' Count call names in an expr.

#' @name expr_count_calls
#' @param x  \code{[expr]}
#' @param call_name  \code{[string]}
#' @return \code{expr_count_calls}: [integer(1)]
#' @examples

#'  x = expr(fn(fn(x, y = fn(fn(x)))))
#'  expr_count_calls(x, call_name = 'fn')
#'  expr_count_calls(x, call_name = 'x')
#' @export
expr_count_calls <- function(x, call_name) {
    # Count call names in an expr
    assert_expr(x)
    assert_string(call_name)
    self <- ReplaceCalls$new(x)
    self$replace_calls_wrapper(call_name = call_name, replacement = call_name, 
        first.only = FALSE)
    self$count
    # Returns: [integer(1)]
}
