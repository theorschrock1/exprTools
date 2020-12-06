#' Insert an expr into an expr.

#' @name expr_insert
#' @param x  \code{[expr]}
#' @param y  \code{[expr]}
#' @param index  \code{[integerish]}  NA values are ok.
#' @return \code{expr_insert}: [expr]
#' @examples

#'  x = expr(list(c('a', 'b', 'c'), 1:5, TRUE))
#'  y <- expr(unlist)
#'  expr_insert(x, y, c(1))
#'  y <- expr(LETTERS[1:3])
#'  expr_insert(x, y, c(2))
#'  expr_insert(x, y, c(2, 4))
#' @export
expr_insert <- function(x, y, index) {
    # Insert an expr into an expr
    assert_expr(x)
    assert_expr(y)
    assert_integerish(index, any.missing = FALSE)
    eval(parse_expr(c("x", glue("[[{index}]]"), "<-y") %sep% ""))
    x
    # Returns: [expr]
}
