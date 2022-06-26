#' Check to see if a name is not already present.

#' @name check_not_in
#' @param x
#' @param subset  \code{[character]}
#' @param empty.ok  \code{[logical]}  Must have an exact length of \code{1}.  Defaults to \code{FALSE}
#' @param fail_message  \code{[string]}  Defaults to \code{'Must be a unique name.  Name already exists'}
#' @param empty_message  \code{[character]}  Defaults to \code{'Name is required'}.
#' @return \code{check_not_in}: \code{[TRUE,error_message]}
#' @examples

#'  check_not_in(x = 'Jim', subset = c('Jim', 'Bob'), empty.ok = FALSE)
#'  check_not_in(x = '', subset = c('Jim', 'Bob'), empty.ok = FALSE)
#'  check_not_in(x = '', subset = c('Jim', 'Bob'), empty.ok = TRUE)
#'  check_not_in(x = 'Tim', subset = c('Jim', 'Bob'), empty.ok = FALSE)
#' @export
check_not_in <- function(x, subset, empty.ok = FALSE, fail_message = "Must be a unique name.  Name already exists",
    empty_message = "Name is required") {
    # Check to see if a name is not already present
    assert_character(subset)
    assert_logical(empty.ok, len = 1)
    assert_string(fail_message)
    if (is_empty(x) && empty.ok == TRUE)
        return(TRUE)
    if (is_empty(x))
        return(empty_message)
    if (x %in% subset)
        return(fail_message)
    return(TRUE)
    # Returns: \code{[TRUE,error_message]}
}
