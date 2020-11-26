#' Test if an object is a for loop call.

#' @name is_loop
#' @param x an object
#' @return \code{is_loop}: [Logical(1)]
#' @examples

#'  x <- expr(for (i in 1:10) {

#'  print(x)

#'  })

#'  is_loop(x)

#'  is_special_call(x)

#' @export
is_loop <- function(x) {
    # Test if an object is a for loop call
    is_call(x, "for")
    # Returns: [Logical(1)]
}

