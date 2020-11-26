#' Extract R code lines as a list of exprs.

#' @name expr_extract_lines
#' @param x  [call]  Must be a call from function '{'.
#' @return \code{expr_make_lines}: [exprs]
#' @examples

#'  expr_extract_lines({

#'  x = 1:10

#'  lok <- data.table(x = x)

#'  lok[, mean(x)]

#'  })

#' @export
expr_extract_lines <- function(x) {
    # Extract R code lines as a list of exprs
    x <- enexpr(x)
    assert_call(x, call_name = "{")
    call_args(x)
    # Returns: [exprs]
}
