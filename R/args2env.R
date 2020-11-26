#' Assign call args to an enviroment.

#' @name args2env
#' @param call  [call]
#' @param env  [environment]  Defaults to caller_env()
#' @return \code{args2env}: [NULL]
#' @examples

#'  args2env(DT(1:10))

#'  x

#' @export
args2env <- function(call, env = caller_env()) {
    # Assign call args to an enviroment
    call <- enexpr(call)
    call = expr_name_call_args(call)
    assert_call(call)
    assert_environment(env)
    .f = eval(call[[1]], env = env)
    defaults <- fn_fmls(.f)
    current_args = call_args(call)
    if (!is_named(current_args))
        stop("All arguments must be named")
    current_args <- c(current_args, defaults[names(defaults) %nin% names(current_args)])
    args = lapply(current_args, function(x, env) eval(x, envir = env), env = env)
    list2env(args, envir = env)
    return(NULL)
    # Returns: [NULL]
}
