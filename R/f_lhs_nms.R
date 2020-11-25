#' Extract the names of a formula's lhs.

#' @name f_lhs_nms
#' @param f  [formula]
#' @return \code{f_lhs_nms}: [vector(character)]
#' @examples

#'  formula = a + b + c ~ x + y + z

#'  f_lhs_nms(formula)

#' @export
f_lhs_nms <- function(f) {
    # Extract the names of a formula's lhs
  v_collect()
  if(!is_formula(f))g_stop("{.f} must be a formula, not {typeof(f)}")
    expr_find_names(f_lhs(f))%NIN%'.'
    # Returns: [vector(character)]
}
#' @export
`f_lhs_nms<-`=function(f,value){
  assert_character(value)
  f_lhs(f)<-expr_reduce(syms(value),`+`)
  f
}


