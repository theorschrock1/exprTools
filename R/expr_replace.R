#' Find and replace code in an r expression.

#' @name expr_replace
#' @param x  \code{[expr]}
#' @param find  \code{[expr]}
#' @param replacement  \code{[any]}
#' @return \code{expr_replace}: [expr]
#' @examples

#'  x = expr(data[, .(x, 'x', x, na.rm = TRUE)])
#'  expr_replace(x, find = 'x', replacement = expr(y))
#'  expr_replace(x, find = expr(x), replacement = expr(y))
#'  expr_replace(x, find = expr(x), replacement = exprs(z, t))
#'  expr_replace(x, find = expr(x), replacement = exprs(1, 1))
#'  expr_replace(x, find = TRUE, replacement = FALSE)
#' @export
expr_replace <- function(x, find, replacement) {
    # Find and replace code in an r expression
    assert_expr(x)
    assert_expr(find)
    assert_any(replacement, check_expr(), check_exprs())
    expr_find_replace(find = find, replacement = replacement, in_expr = x, 
        match.first = TRUE)
    # Returns: [expr]
}
