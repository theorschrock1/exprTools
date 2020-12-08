#' Find and replace call names in an expression.
#'
#'

#' @name expr_replace_call_names
#' @param x \code{[expr]} an R expression
#' @param call_name  \code{[character]} a call name or names
#' @param replacement \code{[character]}  Must have an exact length of or equal to one of the following: \code{[1,length(call_names)]}.
#' @return \code{expr_replace_call_names}: \code{[expr]}
#' @examples
#'  x = expr(x + y + x + t)
#'  expr_replace_call_names(x, '+', 'ops')

#' @export
expr_replace_call_names <- function(x, call_name, replacement) {
    # Find and replace call names in an expression
    assert_expr(x)
    assert_character(call_name)
    assert_any(replacement,
               check_character(len = 1),
               check_character(len = length(call_name))
               )
    self <- CodeTree$new(x)
    self$find_replace_calls(call_name = call_name, replacement = replacement)
    # Returns: [R Expression]
}
