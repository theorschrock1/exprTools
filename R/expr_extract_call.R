#' Extract calls from an expr
#'
#'

#' @name expr_has_call_name
#' @param x an expr
#' @param call_name the call or function name

#' @return all calls matching the function name

#' @examples

#' x=expr(data[,.(sum(mpg))])

#' call_name = "sum"
#' expr_extract_call(x,call_name)

#' @export
expr_extract_call<-function(x,call_name,skip_first=TRUE){
  call_name=assert_character(call_name)

  # assert(
  #   check_true(is.language(x))
  # )
  tree=CodeTree$new(x)
  out=tree$return_call(call_name =  call_name,skip_first=skip_first)
  if(!is(out,"list"))out=list(out)
  out
}


