#' Test if an object is a return call.

#' @name is_return
#' @param x an object
#' @return \code{is_return}: [Logical(1)]
#' @examples

#'  x = 1

#'  is_return(x)

#'  x = expr(c(1, 2, 3))

#'  is_return(x)

#'  x = expr(return(y))

#'  is_return(x)

#' @export
is_return <- function(x) {
    # Test if an object is a return call
    is_call(x, "return")
    # Returns: [Logical(1)]
}
