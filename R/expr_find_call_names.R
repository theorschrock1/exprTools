#' Find call names in an expression.

#' @name expr_find_call_names
#' @param x  \code{[expr]}
#' @param ignore.wrapper  \code{[logical]}  Must have an exact length of \code{1}.  Defaults to \code{TRUE}
#' @param ignore  \code{[character]}  NULL is ok.  Defaults to \code{NULL}
#' @return \code{expr_find_call_names}: \code{[character]} a character vector of call names
#' @examples

#'  x = expr({
#'  fd <- function(x) {
#'  SUM(x) + SUM(y)
#'  }
#'  })
#'  expr_find_call_names(x)
#'  expr_find_call_names(x, ignore.wrapper = FALSE)
#'  expr_find_call_names(x, ignore = c('<-', '+'))
#' @export
expr_find_call_names <- function(x, ignore.wrapper = TRUE, ignore = NULL) {
    # Find call names in an expression
    assert_expr(x)
    assert_logical(ignore.wrapper, len = 1)
    assert_character(ignore, null.ok = TRUE)
    out = unique(find_call_rec(x)) %NIN% ignore
    if (nlen0(out) && ignore.wrapper && out[1] == "{") 
        return(out[-1])
    out
    # Returns: \code{[character]} a character vector of call names
}
