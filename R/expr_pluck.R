#' Pluck a piece out of an expr.

#' @name expr_pluck
#' @param x \code{[expr]}
#' @param index \code{[integer]} the index to pluck. \code{NA} values not permitted.
#' @return \code{expr_pluck}: [expr]
#' @examples

#'  x = expr(list(c('a', 'b', 'c'), 1:5, TRUE))
#'  expr_pluck(x, c(1))
#'  expr_pluck(x, c(2))
#'  expr_pluck(x, c(3))
#'  expr_pluck(x, c(2, 4))
#'  expr_pluck(x, c(3, 1))
#'  expr_pluck(x, c(3, 5))
#' @export
expr_pluck <- function(x, index) {
    # Pluck a piece out of an expr
    assert_expr(x)
    assert_integerish(index, any.missing = FALSE)

    eval(parse_expr(c("x", glue("[[{index}]]")) %sep% ""))
    # Returns: [expr]
}
