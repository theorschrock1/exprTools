#' @export
build_fn=function(...){
  dots=enexprs(...)
  body<-  dots[sapply(dots,function(x)is_call(x,"{"))]
  if(!len1(body))
    g_stop("Must contain one {} call")
  body=body[[1]]
  assert_call(body,call_name = "{")
  body<-call_args(body)
  dots=dots[!sapply(dots,function(x)is_call(x,"{"))]
  check_dots<-sapply(dots,function(x)x=='...')
  extra.args=FALSE
  if(any(check_dots))
    extra.args=TRUE
  dots=dots[!check_dots]
  collect=NULL
  assert=NULL
  args=""
  if(!len0(dots)){
  out=map2(dots,names(dots),function(x,n){
    x=call_args(x)
    def= x[names(x)==""]
    if(len0(def)){
      out=pairlist2(name=)
      names(out)=n
      return(out)
    }
    out=pairlist2(name=x[[1]])
    names(out)=n
    out
  })
  names(out)=NULL
  args=unlist(out,recursive = F)
  assert<-expr(assert_fn_args(args,structure=list(!!!dots)))
  collect<-call_args(expr({
    args<-params(match.call())
    }))
 args=map2(args,names(args),function(x,y){
   paste0(y,"=",expr_text(x))
 }) %>% unlist(use.names = F)%sep%","
  }
  bod=expr({!!!c(collect,assert,body)})
 if(extra.args)
  args=paste0(args,",...")
 body=expr_text(bod)%sep%"\n"
 eval(parse_expr(glue('function({args}){body}')))
}
#' @export
build_fn_expr=function(args,body){
  eval(expr(build_fn(!!!c(args,body))))
}
#' @export
params=function(x,env=caller_env()){
  x=expr_fill_defaults(x,env=env)
  x[[1]]<-expr(list)
  eval(x,envir = env)
}

#' @export
ops=function(...){
  enexprs(...)
}
