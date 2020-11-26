#' Modify arguments in a call.
#'
#' Use zap() to remove an argument.

#' @name expr_call_modify
#' @param call_expr  [call]
#' @param ... Named expressions (constants, names or calls) used to modify the call. Use zap() to remove arguments. Empty arguments are preserved.
#' @return  [Call]

#' @examples

#'  fn = function(a, b, c, d = 0, e = 0) {

#'  return(a + b + c + d + e)

#'  }

#'  call = expr(fn(1, 3, 4))

#'  expr_call_modify(call, a = 10)

#'  expr_call_modify(call, d = 5)

#'  expr_call_modify(call, f = 3)

#'  fn = function(a, b, c, d = 0, e = 0, ...) {

#'  return(a + b + c + d + e)

#'  }

#'  call_expr = expr(fn(1, 3, 4))

#'  expr_call_modify(call_expr, f = 3, a = zap())

#' @export
expr_call_modify <- function(call_expr, ...) {
    # Modify arguments in a call. Use zap() to remove an argument.
    assert_call(call_expr)
    call_expr <- expr_name_call_args(call_expr)
    fn_arg_names <- fn_fmls_names(eval(call_expr[[1]]))
    new_args = enexprs(...)
    if (!names(new_args) %all_in% fn_arg_names && "..." %nin% fn_arg_names)

    g_stop("{as.character(  call_expr[[1]])} does not support argument/s: [{names(new_args)%NIN%fn_arg_names%sep%\",\"}]. Valid arguments are [{fn_arg_names%sep%\",\"}]")
    remove_args <- names(new_args)[new_args == expr(zap())]
    if (!len0(remove_args)) {
        new_args <- new_args[names(new_args) %nin% remove_args]
        remove_args <- rep_named(remove_args, list(zap()))
        new_args = c(new_args, remove_args)
    }

    out <- call_modify(call_expr, !!!new_args)
    expr_name_call_args(out)
    # Returns: [Call]
}
