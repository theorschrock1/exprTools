#' Find undefined variables in R code.

#' @name expr_find_undefined
#' @param x  \code{[expr]}
#' @param init_vars  \code{[character]}  NULL is ok.
#' @return \code{expr_find_undefined}: \code{[character]} a character vector of undefined variables
#' @examples

#'  x = expr({
#'  x = y * 2
#'  if (x == 1) {
#'  out = 1
#'  }
#'  else if (x >= 1) {
#'  1
#'  }
#'  else {
#'  NULL
#'  }
#'  out + 1
#'  })
#'  expr_find_undefined(x, init_vars = 'y')
#'  expr_find_undefined(x, init_vars = NULL)
#'  x = expr({
#'  x = y * x
#'  x
#'  })
#'  expr_find_undefined(x, init_vars = NULL)
#'  expr_find_undefined(x, init_vars = 'x')
#'  expr_find_undefined(x, init_vars = 'y')
#'  expr_find_undefined(x, init_vars = c('y', 'x'))
#'  x = expr({
#'  x = y * x
#'  c
#'  })
#'  expr_find_undefined(x, init_vars = c('y', 'x'))
#'  expr_find_undefined(x, init_vars = c('y', 'x', 'c'))
#' @export
expr_find_undefined <- function(x, init_vars) {
    # Find undefined variables in R code
    assert_expr(x)
    assert_character(init_vars, null.ok = TRUE)
    self = FindUndefined$new(x, init_vars = init_vars)
    self$find_undefined_wrapper()
    # Returns: \code{[character]} a character vector of undefined variables
}
