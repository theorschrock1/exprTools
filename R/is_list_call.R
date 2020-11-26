#' Test if an expr is a list call
#'
#'

#' @name is_list_call
#' @param x an object
#' @return Logical TRUE/FALSE

#' @examples


#' x=expr(list(mpg=4+1, cyl=4, am="g", vs="f"))
#' is_list_call(x)
#' x=expr(list())
#' is_list_call(x)
#' x=expr(sum(gg))
#' is_list_call(x)

#' @export
is_list_call=function(x){
  is_call(x)&&any(x[[1]]==(exprs(.,list)))
}
#' @export
is_call_type=function(x,call_name){
  is_call(x)&&as_string(x[[1]])==call_name
}
#' @export
is_plus_call=function(x){
  is_call_type(x,'+')
}
