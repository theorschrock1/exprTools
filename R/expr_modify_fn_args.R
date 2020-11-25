#' Modify functional arguments in an R expression
#'
#'

#' @name expr_modify_fn_args
#' @param x an R expr
#' @param new_args a name list of args to add to specified calls
#' @param call_names a character vector indicating the name of the calls (or functions) which will be modified in the expression. If NULL, any call or function with a matching argument name present in the 'new_args' list will be modified, unless a skip is specified.
#' @param skip any call names to skip during the search
#' @param modify_if_present Logical. If FALSE, the argument will only be modified if it is missing.  See examples
#' @return an expr with updated functional arguments

#' @examples

#' x=expr(data[,.(sum_mpg=sum(mpg,na.rm=FALSE),mean_mpg=mean(mpg,na.rm=),max_mpg=max(mpg)),by=.(vs)])

#' expr_modify_fn_args(x,new_args=list(na.rm=TRUE),call_name='sum')
#' expr_modify_fn_args(x=x,new_args=list(na.rm=TRUE))
#' expr_modify_fn_args(x=x,new_args=list(na.rm=TRUE),modify_if_present = FALSE)

#' @export
expr_modify_fn_args<-function(x,new_args,call_names=NULL,skip='.',modify_if_present=TRUE){
  call_names=assert_character(call_names,null.ok = TRUE)
  assert_list(new_args)
  if(!is_named(new_args))stop('"new_args" must be a named list')
  # assert(
  #   check_true(is.language(x))
  # )
  self=CodeTree$new(x)
  self$find_calls_add_arg(new_args=new_args,call_names=call_names,skip=skip,modify_if_present=modify_if_present)
}
