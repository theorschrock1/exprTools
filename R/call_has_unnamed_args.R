#' Test if a call has unnamed arguements.

#' @name call_has_unnamed_args
#' @param x  [call]
#' @return \code{call_has_unnamed_args}: [Logical(1)]
#' @examples

#'  x = expr(fn(x, y))

#'  call_has_unnamed_args(x)

#'  x = expr(fn(x = x, y = y))

#'  call_has_unnamed_args(x)

#' @export
call_has_unnamed_args <- function(x) {
    # Test if a call has unnamed arguements
    assert_call(x)
    args <- call_args(x)
    any(names(args) == "")
    # Returns: [Logical(1)]
}
