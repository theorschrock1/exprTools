#' Covert an R expr into a json string.

#' @name expr_to_json
#' @param x  \code{[call]}
#' @return \code{expr_to_json}: \code{[string]}
#' @examples

#'  expr_to_json(toJSON(out, null = 'null', auto_unbox = T))
#' @export
expr_to_json <- function(x) {
    # Covert an R expr into a json string
    x <- enexpr(x)
    assert_call(x)
    serializeJSON(x)
    # Returns: \code{[string]}
}
