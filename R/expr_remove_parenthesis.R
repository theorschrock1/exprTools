#' Remove outer parenthesis from an expr
#'
#'

#' @name expr_remove_parenthesis
#' @param x a expr
#' @return a expr with parenthesis removed

#' @examples

#' x <- expr((((f+1))))
#' expr_remove_parenthesis(x)

#' @export
expr_remove_parenthesis<- function(x){
  if(is_call(x)&&
     x[[1]]==sym("(")){
    x=x[[2]]
    return( expr_remove_parenthesis(x))
  }

  return(x)
}
