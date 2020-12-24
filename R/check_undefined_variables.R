#' Check code for defined variable.

#' @name check_undefined_variables
#' @param x  \code{[expr]}
#' @param init_vars  \code{[character]}  NULL is ok.
#' @param env  \code{[environment]}  NULL is ok.  Defaults to \code{NULL}
#' @return \code{check_undefined_variables}: \code{[TRUE|class('error_messagae')]} returns TRUE if valid (no undefined variables), otherwise an chararter string of class 'error message'
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
#'  check_undefined_variables(x, init_vars = 'y')
#'  check_undefined_variables(x, init_vars = NULL)
#'  x = expr({
#'  x = y * x
#'  x
#'  })
#'  check_undefined_variables(x, init_vars = NULL)
#'  check_undefined_variables(x, init_vars = 'x')
#'  check_undefined_variables(x, init_vars = 'y')
#'  check_undefined_variables(x, init_vars = c('y', 'x'))
#'  x = expr({
#'  x = y * x
#'  c
#'  })
#'  check_undefined_variables(x, init_vars = c('y', 'x'))
#'  check_undefined_variables(x, init_vars = c('y', 'x', 'c'))
#'  env(x = 1, y = 3)
#'  check_undefined_variables(x, init_vars = NULL, env = env(x = 1,
#'  y = 3))
#'  check_undefined_variables(x, init_vars = NULL, env = env(x = 1,
#'  y = 3))
#' @export
check_undefined_variables <- function(x, init_vars, env = NULL) {
    # Check code for defined variable
    assert_expr(x)
    assert_character(init_vars, null.ok = TRUE)
    assert_environment(env, null.ok = TRUE)
    if (nnull(env)) 
        init_vars <- unique(c(init_vars, names(env)))
    missing <- expr_find_undefined(x, init_vars)
    if (len0(missing)) 
        return(TRUE)
    glue("Variable/s `{missing%sep%\",\"}` not found") %>% as_error_message()
    # Returns: \code{[TRUE|class('error_messagae')]} returns TRUE if valid (no undefined
    # variables), otherwise an chararter string of class 'error message'
}
