#' Combine arguments of an expur.

#' @name expr_concat
#' @param x  \code{[call]}
#' @param y  \code{[call]}  Must be a call from function \code{call_name(x)}.
#' @return \code{expr_concat}: \code{[expr]}
#' @examples

#'  x = expr({
#'  x = 3
#'  })
#'  y = expr({
#'  y = 4
#'  })
#'  expr_concat(y, x)
#'  x = expr(list(x = 3))
#'  y = expr(list(y = 3))
#'  expr_concat(y, x)
#' @export
expr_concat <- function(x, y) {
    # Combine arguments of an expur
    assert_call(x)
    assert_call(y, call_name = call_name(x))
    out <- expr(.(!!!call_args(x), !!!call_args(y)))
    out[[1]] = sym(call_name(x))
    out
    # Returns: \code{[expr]}
}
