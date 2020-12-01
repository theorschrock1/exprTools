#' Extract calls from an expr
#'
#'

#' @name expr_has_call_name
#' @param x \code{[expression] the target expression.
#' @param call_name \code{[character]} the call or function name to match. Multiple call names allowed when grep is set to false.
#' @param skip.first \code{[logical(1)]} should the first call be skipped?
#' @param grep should calls be matched based on a regex pattern? Defaults to false

#' @return \code{[list(exprs)]} all calls matching the function name. Note: This function does not search recursively.

#' @examples

#' x=expr(data[,.(sum(mpg))])

#' call_name = "sum"
#' expr_extract_call(x,call_name)

#' @export
expr_extract_call<-function(x,call_name,grep=FALSE,skip_first=TRUE){
  call_name=assert_character(call_name)
   if(grep&&length(call_name)>1)
     g_stop("multiple call names not allowed if grep is TRUE")

  # assert(
  #   check_true(is.language(x))
  # )
  tree=CodeTree$new(x)
  out=tree$return_call(call_name =  call_name,grep=grep,skip_first=skip_first)
  if(!is(out,"list"))out=list(out)
  drop_nulls(out)
}



