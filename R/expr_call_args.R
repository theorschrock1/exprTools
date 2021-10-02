#' Extract arguments from an unevaluated call
#'
#'

#' @name expr_call_args
#' @param x an call expr
#' @return a list of exprs

#' @examples
#'  x=expr(list(mpg=4+1, cyl=4, am="g", vs="f"))
#'  expr_call_args(x)

#' @export
expr_call_args=function(x){
  if(!is_call(x))stop("x must be a call'")
  call_args(x)
}
#' @export
expr_unlist=function(x,recursive=FALSE){
  if(recursive){
    if(!is_call(x))return(x)
    return(unlist(lapply(as.list(x),expr_unlist,recursive=TRUE)))
  }
  if(!is_call(x))stop("x must be a call'")

  call_args(x)
}

#' @export
unlist_syms=function(x){
  if(!is_call(x))stop("x must be a call'")
  call_args(x)
}



