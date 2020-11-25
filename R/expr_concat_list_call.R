#' Concatenate two list calls
#'
#'

#' @name expr_concat_list_call
#' @param x an unevaluated list call
#' @param y an unevaluated list call

#' @return concatentated unevaluated list call

#' @examples

#' x=expr(list(mpg,cyl))
#' y=expr(list(am,vs))

#' expr_concat_list_call(x,y)

#' @export
expr_concat_list_call=function(x,y){
  if(!is_call(x)|!is_call(y))stop("x and y must be a list call: Example '.(am,pm)' or 'list(am,pm)'")
  if(!any(x[[1]]==(exprs(.,list))))stop("x must be a list call: Example '.(am,pm)' or 'list(am,pm)'")
  if(!any(y[[1]]==(exprs(.,list))))stop("y must be a list call: Example '.(am,pm)' or 'list(am,pm)'")
  out<-c(unlist_syms(enexpr(x)),unlist_syms(enexpr(y)))
  out<-out[!duplicated(out)]
  expr(.(!!!out))
}
