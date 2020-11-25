#' Extract the names in a formula.

#' @name f_nms
#' @param f  [formula]
#' @return \code{f_nms}: [vector(character)]
#' @examples

#'  formula = a + b + c ~ x + y + z

#'  f_nms(formula)

#' @export
f_nms <- function(f) {
    # Extract the names in a formula
    assert_formula(f)
    expr_find_names(f)%NIN%'.'
    # Returns: [vector(character)]
}
