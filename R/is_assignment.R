#' Test is an object is an assignment call.

#' @name is_assignment
#' @param x an object
#' @return \code{is_assignment}: [Logical(1)]
#' @examples

#'  x = list(1, 2, 4)

#'  is_assignment(x)

#'  x <- expr(c(x, 1))

#'  is_assignment(x)

#'  x <- expr(x <- 1)

#'  is_assignment(x)

#'  x <- expr(`=`(x,1))

#'  is_assignment(x)

#' @export
is_assignment <- function(x) {
    # Test is an object is an assignment call
    out <- is_call(x, "<-") | is_call(x, "=")|is_call(x, ":=")
    return(out)
    # Returns: [Logical(1)]
}
