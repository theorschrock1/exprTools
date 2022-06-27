#' Check if an an empty string, NULL, NA,or length 0.

#' @name check_not_empty
#' @param x
#' @param max_len  \code{[integerish]}  Must have an exact length of \code{1}.  NULL is ok.  Defaults to \code{NULL}
#' @param message  \code{[string]}  Defaults to \code{'Must have a value'}
#' @return \code{check_not_empty}: \code{[TRUE,error_message]}
#' @examples

#'  check_not_empty(x = '', message = 'Must have a value')
#'  check_not_empty(x = NULL, message = 'Must have a value')
#'  check_not_empty(x = character(), message = 'Must have a value')
#'  check_not_empty(x = NA, message = 'Must have a value')
#'  check_not_empty(x = c('valid', 'sd'), max_len = 1)
#'  check_not_empty(x = c('valid'), max_len = 1)
#' @export
check_not_empty <- function(x, max_len = NULL, message = "Must have a value") {
    # Check if an an empty string, NULL, NA,or length
    # 0
    assert_string(message)
    assert_integerish(max_len, len = 1, null.ok = T)
    res = check_string(x, min.chars = 1)
    if (nnull(max_len) && length(x) > 1)
        stop_quiet("Must have max length of {max_len}")
    if (isTRUE(res))
        return(TRUE)
    return(message)
    # Returns: \code{[TRUE,error_message]}
}
