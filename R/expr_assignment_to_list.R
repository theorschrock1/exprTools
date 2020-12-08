#' Transform expressions with assignments to a named list of expressions
#'
#'

#' @name expr_assignment_to_list
#' @param x an expr or list of exprs with assignment/s
#' @param make.names \code{[logical(1)]} make names for exprs without assignments? Defaults to \code{TRUE}.
#' @return a named list of expressions

#' @examples

#'  x <- call_args(expr({
#'  g=function(x)x+3
#'  c = g(1)
#'  b = c + 1
#'  }))
#'  expr_assignment_to_list(x)
#'  x <- call_args(expr({
#'  g=function(x)x+3
#'  c =function(y){
#'  x+3
#'  }
#'  if(y==1){
#'  x
#'  }else{
#'  y
#'  }}
#'  ))
#'  expr_assignment_to_list( x )
#'  expr_assignment_to_list( x,make.names=FALSE )

#' @export
expr_assignment_to_list=function(x,make.names=TRUE){
  if(is_list(x)){
    tmp=lapply(x,expr_assignment_to_list,make.names=make.names)
    return(reduce(tmp,.f=c))
  }
  if(l(x)==1&&is_symbol(x))return(list2(!!x:=x))

  if(is_call(x)&&as.character(x[[1]])%nin%c("<-","=")){
    if(!make.names)
      return(list2(x))
    xname=deparse(x)[[1]]
    return(list2(!!xname:=x))
  }
  list2(!!x[[2]]:=x[[3]])

}

