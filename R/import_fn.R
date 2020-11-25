#' Reconstruct an existing function in the current or specified environment
#'
#'

#' @name import_fn
#' @param  fn existing function name
#' @param  env an environment. Defaults to the current environment.

#' @return  the same function recreated in the current or specified environment

#' @export
import_fn=function(fn, env = caller_env()){
  new_function(args=fn_fmls(fn), body=fn_body(fn), env = env )
}
