
#' @export
assert_any=function(x,...,env=caller_env()){
  arg<-sym(enexpr(x))
  expr_eval(`<-`(!!arg,x))
  checks<-enexprs(...)
  checks<-expr(lapply(checks,expr_call_modify,x=!!arg)) %>% eval()
  expr_eval(assert(!!!checks,combine = 'or'),env=env)
}
#' @export
assert_all=function(x,...,env=caller_env()){
  arg<-sym(enexpr(x))
  expr_eval(`<-`(!!arg,x))
  checks<-enexprs(...)
  checks<-expr(lapply(checks,expr_call_modify,x=!!arg)) %>% eval()
  expr_eval(assert(!!!checks,combine = 'all'),env=env)
}
#' @export
check_call=function(x,call_name=NULL,null.ok=FALSE){
  if(null.ok&&is.null(x))return(TRUE)
  check<-is_call(x)
  if(check==F){
    if(is.null(call_name)){
      return(glue("Must be a{paste0(' ',call_name%or%'')} call"))
    }else{
      return(glue("Must be a `{call_name%sep%','}` call"))
    }}
  if(!is.null(call_name)){
    check<-is_call(x,name=call_name)
  }
  if(check==F)
    return(glue("Must be a call of type `{call_name%sep%'|'}`, but is '{x[[1]]}'"))
  return(check)
}
#' @export
check_expr=function(x,expr_types=c("constant","symbol","pairlist","call")){
  assert_subset(expr_types,choices =c("constant","symbol","pairlist","call"))
  res<-is_expression(x)

  if(isFALSE( res))
    return(glue("Must be an R expression, not '{typeof(x)}'"))
  if(expr_type(x)%nin%expr_types)
    return(glue("Must be an expression of type/s '{expr_types%sep%','}'"))
  return(TRUE)
}
#' @export
assert_call = makeAssertionFunction(check_call)
#' @export
assert_expr = makeAssertionFunction(check_expr)
#' @export
check_exprs=function(x, any.missing = TRUE,all.missing = TRUE, len = NULL, min.len = NULL, max.len = NULL,
                     unique = FALSE, names = NULL, null.ok = FALSE){
  res<-check_list(x, any.missing =  any.missing,all.missing =  all.missing, len = len, min.len = min.len, max.len = max.len,unique=unique, names=names, null.ok = null.ok)
  if(!isTRUE(x))
    return(res)
  res=all(sapply(sapply(x,check_expr),isTRUE))
  if(isFALSE(res))
    return("Must be a list of R expressions")

  return(TRUE)
}
#' @export
assert_exprs=makeAssertionFunction(check.fun = check_exprs)

