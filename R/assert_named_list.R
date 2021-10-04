#' Assert list names and structure.

#' @name assert_named_list
#' @param x  \code{[object]} an object to check
#' @param structure  \code{[list]}  Must be a named list.
#' @param null.ok  \code{[logical]}  Must have an exact length of \code{1}.  Defaults to \code{FALSE}
#' @param extra.items  \code{[logical]}  Must have an exact length of \code{1}.  Defaults to \code{FALSE}
#' @return \code{assert_named_list}: invisible(x)
#' @export
assert_named_list <- function(x, structure, null.ok = FALSE, extra.items = FALSE) {
    # Assert list names and structure
    v_collect()
    structure <- enexpr(structure)
    res <- expr_eval(check_named_list(x, !!structure, null.ok = null.ok, extra.items = null.ok))
    if (isTRUE(res))
        return(invisible(res))
    fn_name <- fn_call_name(n=2)
    item <- ""
    if (!res %detect% "^[Ll]ist")
        item = " List"
    g_stop("invalid input '{.x}' in function `{fn_name}`:{item} {res}")
    # Returns: invisible(x)
}
#' @export
assert_fn_args <- function(x, structure, null.ok = FALSE, extra.items = TRUE) {
    # Assert list names and structure
    v_collect()
    structure <- enexpr(structure)
    res <- expr_eval(check_fn_args(x, !!structure, null.ok = null.ok, extra.items = extra.items))
    if (isTRUE(res))
        return(invisible(res))
    fn_name <- fn_call_name(n=2)

    g_stop("Invalid function argument in `{fn_name}`:{res}")
    # Returns: invisible(x)
}
