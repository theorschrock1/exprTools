#' Test if an expr is a logical test.
#'
#'

#' @name is_call_logical_test
#' @param x  [expr]
#' @return \code{is_call_logical_test}: [Logical(1)]
#' @examples

#'  x = expr(list(x))

#'  is_call_logical_test(x)

#'  x = expr(!x)

#'  is_call_logical_test(x)

#'  x = expr(x == y)

#'  is_call_logical_test(x)
#'  x=  missing_arg()
#'  is_call_logical_test(x)

#' @export
is_call_logical_test <- function(x) {
    # Test if an expr is a logical test.
    if(is_missing(x))return(FALSE)
    assert_expr(x)
    is_call(x, c("==", "!=", ">=", "<=", ">", "<", "&", "|", "!", "%in%", "%between%", "%nin%", "%chin%", "%like%", "%flike%", "%ilike%", "%inrange%"))
    # Returns: [Logical(1)]
}
