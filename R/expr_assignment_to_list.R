#' Transform expressions with assignments to a named list of expressions
#'
#'

#' @name expr_assignment_to_list
#' @param x an expr or list of exprs with assignment/s
#' @return a named list of expressions

#' @examples

#' f <- (c=f+1) ~ (b=f+1) + f(d)
#' x<-expr_get_formula_args(f)
#' expr_assignment_to_list(x)

#' @export
expr_assignment_to_list=function(x){
  if(is_list(x)){
    tmp=lapply(x,expr_assignment_to_list)
    return(reduce(tmp,.f=c))
  }
  if(l(x)==1&&is_symbol(x))return(list2(!!x:=x))

  if(is_call(x)&&as.character(x[[1]])%nin%c("<-","=")){
    xname=deparse(x)
    return(list2(!!xname:=x))
  }
  list2(!!x[[2]]:=x[[3]])

}

