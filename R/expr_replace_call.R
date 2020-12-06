#' Replace call names in an expression.

#' @name expr_replace_call
#' @param x  \code{[expr]}
#' @param call_name  \code{[string]}
#' @param replacement  \code{[string]}
#' @param first.only  \code{[logical]}  Defaults to \code{FALSE}
#' @return \code{expr_replace_call}: [expr]
#' @examples

#'  x = expr(fn(fn(x)))
#'  expr_replace_call(x, call_name = 'fn', replacement = 'new_fn',
#'  first.only = TRUE)
#'  expr_replace_call(x, call_name = 'fn', replacement = 'new_fn',
#'  first.only = FALSE)
#'  x = expr({
#'  x = fn(x)
#'  fn(fn(x))
#'  fn
#'  })
#'  expr_replace_call(x, call_name = 'fn', replacement = 'new_fn',
#'  first.only = FALSE)
#' @export
expr_replace_call <- function(x, call_name, replacement, first.only = FALSE) {
    # Replace call names in an expression
    assert_expr(x)
    assert_string(call_name)
    assert_string(replacement)
    assert_logical(first.only)
    self <- ReplaceCalls$new(x)
    self$replace_calls_wrapper(call_name = call_name, replacement = replacement, 
        first.only = first.only)
    # Returns: [expr]
}
