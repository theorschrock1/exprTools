#' deparse multiple lines of R code.

#' @name expr_deparse_lines
#' @param x  \code{[call]}  Must be a bracketed expression.
#' @return \code{expr_deparse_lines}: [character]
#' @examples

#'  expr_deparse_lines({
#'  sq <- function(x) {
#'  x^2
#'  }
#'  sq(2)
#'  sq(4)
#'  })
#' @export
expr_deparse_lines <- function(x) {
    # deparse multiple lines of R code
    x <- enexpr(x)
    assert_call(x, call_name = "{")
    as_glue(exprs_deparse(call_args(x)))
    # Returns: [character]
}
