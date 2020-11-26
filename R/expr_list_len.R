#' Length of an unevaluated list
#'
#'

#' @name expr_list_len
#' @param x an list call expr
#' @return integer length of the expr list

#' @examples


#' x=expr(list(mpg=4+1, cyl=4, am="g", vs="f"))
#' expr_list_len(x)
#' x=expr(list())
#' expr_list_len(x)

#' @export
expr_list_len=function(x){
  if(!is_call(x))stop("x must be a list call: Example '.(am,pm)' or 'list(am,pm)'")
  if(!any(x[[1]]==(exprs(.,list))))stop("x must be a list call: Example '.(am,pm)' or 'list(am,pm)'")
  out=x %>% as.list()
  length(out[-1])
}
