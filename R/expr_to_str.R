#' Convert an expr into a character string.

#' @name expr_to_str
#' @param x  [expr] an r expression
#' @return \code{expr_to_str}: [Character(1)]
#' @examples

#'  x <- expr(x + y + z)
#'  expr_to_string(x)

#' @export
expr_to_str <- function(x) {
    # Convert an expr into a character string
    assert_expr(x)
    expr_deparse(x) %sep% "\n"
    # Returns: [Character(1)]
}
