#' Build a formula with character vectors or symbols
#'
#'

#' @name expr_build_formula
#' @param lhs left hand side of the formula.  Can be a list of symbols or a character vector.
#' @param rhs right hand side of the formula.  Can be a list of symbols or a character vector.
#' @return an expr formula

#' @examples

#' lhs <- c('a','b','c')
#' rhs <- c('x','y','z')

#' expr_build_formula(lhs,rhs)

#' @export
expr_build_formula=function(lhs,rhs){
  add_syms=function(x,y){
    expr(`+`(!!x,!!y))
  }
  if(!(is_list(lhs)&&is_symbol(lhs[[1]])))lhs=syms(lhs)
  if(!(is_list(rhs)&&is_symbol(rhs[[1]])))rhs=syms(rhs)
  expr(`~`(!!reduce(lhs,add_syms),!!reduce(rhs,add_syms)))
}
