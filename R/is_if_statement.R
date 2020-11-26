#' Test if an object is a 'if' statement call.

#' @name is_if_statement
#' @param x an object
#' @return \code{is_if_statement}: [Logical(1)]
#' @examples
#'  x <- expr(if (i > 10) {
#'  print(i)
#'  })

#'  is_if_statement(x)

#' @export
is_if_statement <- function(x) {
    # Test if an object is a 'if' statement call
    is_call(x, "if")
    # Returns: [Logical(1)]
}
