#' Glue a string and parse output into a list of r expressions.

#' @name expr_glue
#' @param x  [character|language]  Must have an exact length of 1.
#' @param env  [environment]  Defaults to caller_env()
#' @return \code{expr_glue}: [list(exressions)]
#' @examples

#'  x = paste0('v', 1:5)

#'  y = 1:5

#'  expr_glue('{x}<-{y}')
#'  #can be in expr format as well.
#'  expr_glue({x}<-{y})

#' @export
expr_glue=function(x, env = caller_env()) {
    # Glue a string and parse output into a list of r expressions
    x=enexpr(x)
    if(!is_character(x))x=expr_deparse(x)%sep%"\n"
    assert_character(x, len = 1)
    assert_environment(env)
    eval(expr(glue(!!x)), envir = env) %>% parse_exprs()
    # Returns: [list(exressions)]
}

