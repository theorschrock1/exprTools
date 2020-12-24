#' Check code usage based on valid inputs.

#' @name check_code_usage
#' @param x  \code{[expr]}
#' @param valid_vars  \code{[character]}
#' @param valid_functions  \code{[character]}
#' @param ...
#' @return \code{check_code_usage}: \code{[TRUE|error_message]}
#' @examples

#'  x = expr({
#'  SUM(y)
#'  })
#'  check_code_usage(x, valid_vars = 'y', valid_functions = 'SUM')
#'  check_code_usage(x, valid_vars = 'c', valid_functions = 'SM')
#'  check_code_usage(x, valid_vars = 'y', valid_functions = 'SM')
#' @export
check_code_usage <- function(x, valid_vars, valid_functions, ...) {
    # Check code usage based on valid inputs
    assert_expr(x)
    assert_character(valid_vars)
    assert_character(valid_functions)
    error = NULL
    call_check <- check_call_names(x, call_names = valid_functions, ...)
    if (!isTRUE(call_check)) 
        append(error) <- call_check
    arg_check <- check_undefined_variables(x, init_vars = valid_vars)
    if (!isTRUE(arg_check)) 
        append(error) <- arg_check
    if (len0(error)) 
        return(TRUE)
    as_error_message(paste0(error %sep% ".  ", "."))
    # Returns: \code{[TRUE|error_message]}
}
