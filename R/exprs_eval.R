#' Evaluate a list of expression.

#' @name exprs_eval
#' @param x  [list] a list of expressions
#' @param env  [environment]  Defaults to caller_env()
#' @return \code{exprs_eval}: [NULL]
#' @examples

#'  x <- exprs(x <- 3, y <- 4, z <- x + y)

#'  exprs_eval(x)

#' @export
exprs_eval <- function(x, env = caller_env()) {
    # Evaluate a list of expression
   .expr_eval=function(x,env=caller_env()){
    #x<-enexpr(x)
    eval(x,envir=env)
    }
    assert_list(x)
    invisible(lapply(x, .expr_eval, env = env))
    # Returns: [NULL]
}
