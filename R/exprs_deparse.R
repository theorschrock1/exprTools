#' Deparse a list of expressions.

#' @name exprs_deparse
#' @param x  [exprs]
#' @return \code{exprs_deparse}: [character]
#' @examples

#'  x = exprs(lapply(x, function(x) x * x), glue('something {x}'))

#'  exprs_deparse(x)

#' @export
exprs_deparse <- function(x) {
    # deparse a list of expressions
    assert_exprs(x)
    lapply(lapply(x, deparse), glue_collapse, sep = "\n") %>% unlist(use.names = F)
    # Returns: [character]
}
