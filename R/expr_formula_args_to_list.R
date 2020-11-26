#' Extract the arguments from a formula
#'
#'

#' @name expr_formula_args_to_list
#' @param x a formula expr
#' @return a named list of expressions

#' @examples

#' x <- (c=f+1) ~ (b=r+1) + (a=x-1)
#' expr_formula_args_to_list(x)
#' expr_get_formula_args(x)
#' expr_simplify_formula(x)
#' x= employeeid + (dow = day_of_week(startdtm)) ~ category
#' expr_get_formula_args(x)
#' expr_formula_args_to_list(x)

#' @export
expr_formula_args_to_list=function(x){

  out=expr_get_formula_args(x)
  expr_assignment_to_list(out)
}
#' @export
expr_get_formula_args=function(x){
  if(is_symbol(x))return(x)
  if(is_call(x)&&as.character(x[[1]])%nin%c("~","+"))
    return(expr_remove_parenthesis(x))
  one<-x[[2]]
  two<-x[[3]]
  if(is_call(two)&&as.character(two[[1]])%in%c("~","+"))
    two<-expr_get_formula_args(two)
  if(is_call(one)&&as.character(one[[1]])%in%c("~","+"))
    one<-expr_get_formula_args(one)
  out<-c(one,two)
  out<-lapply(out,function(x)expr_remove_parenthesis(x))
  out
}
#' @export
expr_simplify_formula=function(x){
  lhs=names(expr_formula_args_to_list(f_lhs(x)))

  rhs=names(expr_formula_args_to_list(f_rhs(x)))
  expr_build_formula(lhs,rhs)
}
