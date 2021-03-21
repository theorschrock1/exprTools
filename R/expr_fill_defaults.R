#' Name arguments of a call and fill in default values.

#' @name expr_fill_defaults
#' @param x  \code{[call]}
#' @param env  \code{[environment]}  Defaults to \code{caller_env()}.
#' @return \code{expr_fill_defaults}: \code{[call]}
#' @examples

#'  expr_fill_defaults(expr(cor(x = 1:4)))
#'  fn = function(x, y = 4, ...) {
#'  }
#'  expr_fill_defaults(expr(fn(x = 1:4, c = 3)))
#' @export
expr_fill_defaults <- function(x, env = caller_env()) {
    # Name arguments of a call and fill in default values
    assert_call(x)
    x = expr_name_call_args(x, env = env)
    names(x)[names(x) == "NA"] <- ""
    namedargs = call_args(x)
    forms <- formals(eval(x[[1]], envir = env))
    defaults <- forms[!sapply(forms, is_missing)]
    defaults = defaults[names(defaults) %nin% names(namedargs)]
    call_modify(x, !!!defaults)
    # Returns: \code{[call]}
}
