#' print a character vector as r code.

#' @name ccat
#' @param x  \code{[character]}
#' @return \code{ccat}: \code{[string]}
#' @examples

#'  ccat(x = c('a', 'b', 'c'))
#' @export
ccat <- function(x) {
    # print a character vector as r code
    assert_character(x)
    as_glue(expr_text(x))
    # Returns: \code{[string]}
}
