#' Find and replace multiple matches in an R expr.

#' @name expr_find_replace_all
#' @param find  [exprs] What to find in the expr.
#' @param replacement  [exprs]  Must have an exact length of find.
#' @param in_expr  [expr]
#' @return \code{expr_find_replace_all}: [expr(1)]
#' @examples


#'  in_expr = expr(data[, .(J), by = by])
#'  find = exprs(data, J, by)
#'  replacement = exprs(mtcars, sum(mpg), .(cyl, vs))
#'  expr_find_replace_all(find, replacement, in_expr)
#'  in_expr = expr(data[, .(sum(mpg),sum(mpg),sum(mpg))])
#'  find = exprs(sum(mpg),sum(mpg),sum(mpg))
#'  replacement =  exprs(sum(V1),sum(V2),sum(V3))
#'  expr_find_replace_all(find, replacement, in_expr,match.first = FALSE)
#'  expr_find_replace_all(find, replacement, in_expr,match.first = TRUE)

#' @export
expr_find_replace_all <- function(find, replacement, in_expr, match.first=FALSE) {
    # Find and replace multiple matches in an R expr
    assert_exprs(find)
    assert_exprs(replacement, len = length(find))
    assert_expr(in_expr)
    for (i in 1:l(find)) {
        in_expr = expr_find_replace(find = find[[i]], replacement = replacement[[i]], in_expr = in_expr,match.first =  match.first)
    }
    in_expr
    # Returns: [expr(1)]
}

