#' @importFrom R6 R6Class
#' @export
ReplaceCalls <- R6::R6Class(
  'ReplaceCalls',
  public = list(
    expr=NULL,
    tmp_expr=NULL,
    count=0,
    initialize = function(expr) {
      self$expr=expr

    },
replace_calls= function(x=self$tmp_expr,self_expr=expr(self$tmp_expr),index=NULL,call_name,replacement,first.only) {
  #replacement<-'list'
  #if(is.null(index))print("NULL")
  if(!is.null(index)){

    self_expr<- self$next_level(self_expr,index)
    #print(deparse(self_expr))
  }
  flat_map <- function(.x, .f,index_start=1L, ...) {
    to=length(.x)+1
    if(length(.x)<index_start)to=index_start
    map2(.x=.x,.y=seq(from=index_start,to=to,by=1),.f=.f,...)
  }
  #  x=self$tmp_formula
  #x=call_args(x)[[1]]
  # self_expr= expr(x[[2]])
  constant_f=function(x)return()

  switch_expr(
    x,
    # Base cases
    constant = constant_f(x),
    symbol = constant_f(x),
    # Recursive cases
    pairlist = map(
      .x = as.list(x),
      .f = self$replace_calls,
      self_expr = self_expr,
      call_name=call_name,
      replacement=replacement,
      first.only=first.only
    ),
    call = {

      callname =call_name(x)
      if(callname %in%call_name){
        replacetmp=sym(replacement[call_name==callname])
        eval(expr(!!self$next_level(self_expr,1)<-expr(!!replacetmp)))
        self$count=self$replace_count
        self$locations<-expr_find_numeric(self$next_level(self_expr,1),unique = FALSE)
        if(first.only)
          stop()

        flat_map(
          .x = call_args(x),
          .f =  self$replace_calls,
          self_expr = self_expr,
          index_start = 2,
          call_name=call_name,
          replacement=replacement,
          first.only=first.only
        )
      }else{
        flat_map(
          .x = call_args(x),
          .f =  self$replace_calls,
          self_expr = self_expr,
          index_start = 2,
          call_name=call_name,
          replacement=replacement,
          first.only=first.only
        )


      }}

  )
},
replace_calls_wrapper=function(call_name,replacement,first.only){
  self$tmp_expr=self$expr

  try(self$replace_calls(call_name=call_name,replacement=replacement,first.only=first.only),silent=TRUE)
  self$tmp_expr
},
next_level=function(exp_in,index){

  tmp=expr(ex[[!!index]])
  tmp[[2]]<-exp_in
  tmp
}),
private = list(
  .replace_count=0,
  .locations=list()
),
active =list(
  locations=function(value){
    if(missing(value)){
      return(private$.locations)
    }
    private$.locations=c(private$.locations,list(value))
  },
replace_count=function(value){
  if(missing(value)){
    private$.replace_count=private$.replace_count+1
    return(private$.replace_count)
  }
  private$.replace_count=value
}
))

