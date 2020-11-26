#' Test if an object is a raw function call.

#' @name is_raw_function
#' @param x an object
#' @return \code{is_raw_function}: [Logical(1)]
#' @examples

#'  x <- expr(function(x) {
#'  x + 1
#'  })
#'  is_raw_function(x)

#' @export
is_raw_function <- function(x) {
    # Test if an object is a raw function call
    is_call(x, "function")
    # Returns: [Logical(1)]
}
