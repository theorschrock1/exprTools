#' @export
expr_eval=function(x,env=caller_env())
{
  x<-enexpr(x)
  if(is_assignment(x)){
    exprs_eval(list(x),env=env)
    return()
  }
  eval(x,envir=env)

}
