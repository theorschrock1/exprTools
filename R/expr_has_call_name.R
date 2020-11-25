#' Test if an expr has a call name
#'
#'

#' @name expr_has_call_name
#' @param x an expr
#' @param call_name the call or function name

#' @return Logical TRUE/FALSE

#' @examples

#' x=expr(data[,.(sum(mpg))])

#' call_name = "sum"
#' expr_has_call_name(x,call_name)
#'
#' call_name = "mean"
#' expr_has_call_name(x,call_name)

#' @export
expr_has_call_name<-function(x,call_name,skip_first=TRUE){
  call_name=assert_character(call_name)
  # assert(
  #   check_true(is.language(x))
  # )
  self=CodeTree$new(x)
  self$has_call_type(call_name =  call_name,skip_first=skip_first)
}
