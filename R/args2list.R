#' Collect all function arguements as a list.
#'
#' This function should be called before any assignments as the function collects the current function environment.

#' @name args2list
#' @param env  [environment]  Defaults to caller_env()
#' @return \code{args2list}: [list] function arguments
#' @examples

#'  fn = function(a, b) { 

#'  args2list() 

#'  } 

#'  fn(a = 1, b = 3) 

#' @export
args2list <- function(env = caller_env()) {
    # Collect all function arguements as a list.  This function should be called
    # before any assignments as the function collects the current function
    # environment.
    assert_environment(env)
    as.list(env)
    # Returns: [list] function arguments
}
