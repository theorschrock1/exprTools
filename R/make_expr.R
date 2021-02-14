#' Make an r expression from a obj.

#' @name make_expr
#' @param x
#' @return \code{make_expr}: expr
#' @examples

#'  x = data.frame(x = 1:3)
#'  make_expr(x)
#'  x = list(1, 3, 4)
#'  make_expr(x)
#' @export
make_expr <- function(x) {
    # Make an r expression from a obj
    parse_expr(expr_text(x) %sep% "")
    # Returns: expr
}
