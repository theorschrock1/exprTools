#' Find call names in an expression.

#' @name check_call_names
#' @param x  \code{[expr]}
#' @param call_names  \code{[character]}  NULL is ok.
#' @param env  \code{[environment]}  NULL is ok.  Defaults to \code{NULL}
#' @param ignore.wrapper  \code{[logical]}  Must have an exact length of \code{1}.  Defaults to \code{TRUE}
#' @param ignore.assignments  \code{[character]}  NULL is ok.  Defaults to \code{c('=', '<-')}
#' @param ignore.operators  \code{[character]}  NULL is ok.  Defaults to \code{c('+', '-', '/', '*', '==', '!=', '>=', '>', '<', '!')}
#' @param ignore  \code{[character]}  NULL is ok.  Defaults to \code{NULL}
#' @return \code{check_call_names}: \code{[character]} a character vector of call names
#' @examples

#'  x = expr(SUM(x) + MN(y))
#'  check_call_names(x, 'SUM')
#'  x = expr({
#'  x <- SUM(x) + MN(y)
#'  })
#'  check_call_names(x, call_names = 'SUM')
#'  check_call_names(x, call_names = 'SUM', ignore.assignments = '=')
#' @export
check_call_names <- function(x, call_names, env = NULL, ignore.wrapper = TRUE, ignore.assignments = c("=", 
    "<-"), ignore.operators = c("+", "-", "/", "*", "==", "!=", ">=", ">", "<", "!"), ignore = NULL) {
    # Find call names in an expression
    assert_expr(x)
    assert_character(call_names, null.ok = TRUE)
    assert_logical(ignore.wrapper, len = 1)
    assert_character(ignore.assignments, null.ok = TRUE)
    assert_character(ignore.operators, null.ok = TRUE)
    assert_character(ignore, null.ok = TRUE)
    assert_environment(env, null.ok = TRUE)
    if (is.null(call_names) && is.null(env)) 
        g_stop("arguments `call_names` and `env` cannot both be NULL")
    if (nnull(env)) 
        call_names = c(call_names, names(env)[sapply(env, is, "function")])
    ignore = c(ignore, ignore.assignments, ignore.operators)
    out <- expr_find_call_names(x, ignore.wrapper = ignore.wrapper, ignore = ignore)
    if (is_empty(out)) 
        return(TRUE)
    res = all(out %in% call_names)
    if (isTRUE(res)) 
        return(TRUE)
    missing <- out %NIN% call_names
    out = if (len(missing) > 1) {
        glue("Multiple unknown function calls:`{missing%NIN%call_names%sep%','}`")
    } else {
        glue("Unknown function call:`{missing}`")
    }
    as_error_message(out)
    # Returns: \code{[character]} a character vector of call names
}
