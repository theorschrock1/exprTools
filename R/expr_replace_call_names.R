#' Find and replace call names in an expression.
#'
#'

#' @name expr_replace_call_names
#' @param expr  [expr] an expession
#' @param call_name  [character] a call name or names
#' @param replacement  [character]  Must have an exact length of or equal to one of the following: [1,length(call_names)].
#' @return \code{expr_replace_call_names}: [R Expression]
#' @examples
#'
#'  expr = expr(x + y + x + t)
#'  expr_replace_call_names(expr, '+', ops')

#' @export
expr_replace_call_names <- function(expr, call_name, replacement) {
    # Find and replace call names in an expression
    assert_expr(expr)
    assert_character(call_name)
    assert_any(replacement,
               check_character(len = 1),
               check_character(len = length(call_name))
               )
    self <- CodeTree$new(expr)
    self$find_replace_calls(call_name = call_name, replacement = replacement)
    # Returns: [R Expression]
}
