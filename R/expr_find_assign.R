#' find variables created by assignment.

#' @name expr_find_assign
#' @param x  \code{[expr]}
#' @return \code{expr_find_assign}: \code{[character]} a character vector of names
#' @examples

#'  expr_find_assign(expr({
#'  fn <- function(x) {
#'  out = switch_expr(x, constant = , symbol = character(),
#'  pairlist = flat_map_chr(x, find_assign_rec),
#'  call = find_assign_call(x))
#'  out2 = unique(out)
#'  out2
#'  }
#'  }))
#' @export
expr_find_assign <- function(x) {
    # find variables created by assignment
    assert_expr(x)
    unique(find_assign_rec(x))
    # Returns: \code{[character]} a character vector of names
}
