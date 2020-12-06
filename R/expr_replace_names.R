#' Find and replace names in an r expression.

#' @name expr_replace_names
#' @param x  \code{[expr]}
#' @param find  \code{[string]}
#' @param replace  \code{[string]}
#' @param calls.only  \code{[logical]}  Must have an exact length of \code{1}.  Defaults to \code{FALSE}
#' @param vars.only  \code{[logical]}  Must have an exact length of \code{1}.  Defaults to \code{FALSE}
#' @return \code{expr_replace_names}: [expr]
#' @examples

#'  x = expr(data[, .(sum(x), sum(x), sum(x), na.rm = TRUE)])
#'  expr_replace_names(x, find = 'sum', replace = 'max')
#'  expr_replace_names(x, find = 'sum', replace = 'max', vars.only = TRUE)
#'  x = expr(data[, .(x(x), sum(x), sum(x), na.rm = TRUE)])
#'  expr_replace_names(x, find = 'x', replace = 'x_new')
#'  expr_replace_names(x, find = 'x', replace = 'x_new', calls.only = TRUE)
#'  x = expr({
#'  fn
#'  x <- fn(x)
#'  y <- lapply(x, function(x) fn(x) - 1)
#'  f2 <- function(x) {
#'  -fn(x)
#'  }
#'  if (fn()) {
#'  y
#'  }
#'  else {
#'  x
#'  }
#'  })
#'  expr_replace_names(x, 'fn', 'new_fn')
#'  expr_replace_names(x, 'fn', 'new_fn', vars.only = TRUE)
#'  expr_replace_names(x, 'fn', 'new_fn', calls.only = TRUE)
#' @export
expr_replace_names <- function(x, find, replace, calls.only = FALSE, vars.only = FALSE) {
    # Find and replace names in an r expression
    assert_expr(x)
    assert_string(find)
    assert_string(replace)
    assert_logical(calls.only, len = 1)
    assert_logical(vars.only, len = 1)
    if (!calls.only) 
        x <- expr_find_replace(find = sym(find), replacement = sym(replace), 
            in_expr = x, match.first = FALSE)
    if (!vars.only) 
        x <- expr_replace_call(x, call_name = find, replacement = replace, first.only = FALSE)
    x
    # Returns: [expr]
}
