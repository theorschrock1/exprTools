#' Collects the names of the inputs into a function.
#'
#' Useful for passing variable names into error messages. Variable names are assigned to the function environment as .{arg_name}

#' @name v_collect
#' @param env  [environment]  Defaults to caller_env()
#' @return \code{v_collect}: NULL
#' @examples

#'  example_fn <- function(x, y, z) {
#'  v_collect()
#'  print(.x)
#'  print(.y)
#'  print(.z)
#'  }

#'  example_fn(a, b, c)
#'  example_fn(V1, V2, V3)
#'  example_fn(1, 2, 3)

#' @export
v_collect <- function(env = caller_env()) {
    # Collects the names of the inputs into a function.  Useful for passing variable names
    # into error messages. Variable names are assigned to the function environment as
    # .{arg_name}
    assert_environment(env)
    vargs <- eval(expr(fn_fmls_syms()), envir = env)
    dots <- vargs[vargs == "..."]
    vargs <- vargs[vargs != "..."]
    vnames = as.character(vargs)
    vnames = syms(glue(".{as.character(vnames)}"))
    out <- expr_glue("{vnames}<-enexpr({vargs})")
    if (!len0(dots)) {
        out = c(out, expr(.dotslist <- enexprs(...)))
    }
    exprs_eval(out, env = caller_env())
    # Returns: NULL
}
