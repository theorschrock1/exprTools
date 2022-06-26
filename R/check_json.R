#' Check that a string is a valid JSON object.

#' @name check_json
#' @param x
#' @param check_output  \code{[call]}
#' @param null.ok  \code{[logical]}  Must have an exact length of \code{1}.  Defaults to \code{FALSE}
#' @return \code{check_json}: \code{[TRUE|error]}
#' @examples

#'  check_json(x = '[1,3]', check_numeric(len = 2))
#'  check_json(x = '[1,3]', check_numeric(len = 1))
#'  check_json(x = '{\'one\':[1,3]}', check_named_list(structure = list(one = numeric())))
#'  check_json(x = '{\'one\':[1,3]}', check_named_list(structure = list(two = numeric())))
#' @export
check_json <- function(x, check_output, null.ok = FALSE) {
    # Check that a string is a valid JSON object
    check_output <- enexpr(check_output)
    assert_call(check_output)
    assert_logical(null.ok, len = 1)
    if (is.null(x) && null.ok == TRUE)
        return(TRUE)
    out <- try(jsonlite::fromJSON(x), silent = T)
    if (is_error(out))
        return("Invalid JSON string")
    check_output[['x']]<-expr(out)
    res = eval( check_output)
    if (!isTRUE(res))
        return(str_replace(res, "Must be", "Must be a JSON string"))
    return(res)
    # Returns: \code{[TRUE|error]}
}
