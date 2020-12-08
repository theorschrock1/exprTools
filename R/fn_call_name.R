#' Get the name of the current function call.

#' @name fn_call_name
#' @param n  \code{[integerish]}  Must have an exact length of \code{1}.  Defaults to \code{1}
#' @return \code{fn_call_name}: \code{[character(1)]}
#' @export
fn_call_name <- function(n = 1) {
    # Get the name of the current function call
    assert_integerish(n, len = 1)
    calls <- sys.calls()
    deparse(calls[[length(calls) - n]][[1]])
    # Returns: \code{[character(1)]}
}
