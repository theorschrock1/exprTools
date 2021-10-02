#' @import R6
#' @export
CodeTree = R6Class(
  'CodeTree',
  public = list(
    expr=NULL,
    tmp_expr=NULL,
    initialize = function(expr) {
      self$expr=expr

    },
    find_and_replace=function(find,replacement,match.first=FALSE){


      replace_with="expr"
      if(is_list(replacement))replace_with='exprs'

      out=self$find_replace_syms(symbol=find,replace_with=replace_with,match.first=match.first)
      expr_out<-eval(expr(expr(!!out)))
      expr_out
    },
    find_replace_syms=function(symbol,replace_with=c('exprs',"expr"),match.first=FALSE){
      replace_with=match.arg(replace_with,c('exprs',"expr"))
      replacement=chr_approx(c('exprs',"expr"),c('!!!replacement','!!replacement'))(replace_with)
      self$tmp_expr=self$expr

     out=try( self$find_symbols(symbol=symbol,replacement=replacement,match.first=match.first),silent=T)
     if(is_error(out)){
       if(grepl("Done\n$",out))return(self$tmp_expr)
       stop(out)
     }
      self$tmp_expr
    },
    find_symbols = function(x=self$tmp_expr,self_expr=expr(self$tmp_expr),symbol,index=NULL,replacement='!!!replacement',match.first=FALSE) {
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
        constant = self$replace_(
          x=x,
          symbol = symbol,
          self_expr = self_expr,
          replacement = replacement,
          match.first=match.first
        ),
        symbol = self$replace_(
          x=x,
          symbol = symbol,
          self_expr = self_expr,
          replacement = replacement,
          match.first=match.first
        ),
        # Recursive cases
        pairlist = map(
          .x = as.list(x),
          .f = self$find_symbols,
          self_expr = self_expr,
          symbol = symbol,
          replacement = replacement,
          match.first=match.first
        ),
        call = {
         was_replaced<- self$replace_(
            x=x,
            symbol = symbol,
            self_expr = self_expr,
            replacement = replacement,
            match.first=match.first)

        if(was_replaced==FALSE){
          callargs=call_args(x)
          if(is_raw_function(x))
            callargs=callargs[-(l(callargs))]

          flat_map(
          .x =   callargs,
          .f = self$find_symbols,
          self_expr = self_expr,
          index_start = 2,
          symbol = symbol,
          replacement = replacement,
          match.first=match.first
        )}
        }
      )
    },
    find_calls_add_arg=function(new_args,call_names=NULL,skip=".",modify_if_present){

      self$tmp_expr=self$expr
      self$.find_calls_add_arg(x=self$tmp_expr,self_expr=expr(self$tmp_expr),index=NULL,call_names=call_names,new_args=new_args,skip=skip,modify_if_present=modify_if_present)
      return(self$tmp_expr)
    },
    .find_calls_add_arg = function(x=self$tmp_expr,self_expr=expr(self$tmp_expr),index=NULL,call_names,new_args,skip='.',modify_if_present) {
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
          .f = self$.find_calls_add_arg ,
          self_expr = self_expr,
          call_names=call_names,
          new_args=new_args,
          skip=skip,
          modify_if_present=modify_if_present
        ),
        call = {
          if(as_string(x[[1]])%nin%c(skip,"[","[[","(","+","-","/","*","$","@")){
            is_present<-NULL
          if(!modify_if_present){
            c_args=call_args(x)
            is_missing_arg=sapply(c_args,function(x)!is_missing(x))
            non_missing_c_args<-c_args[is_missing_arg]
            is_present<- names(non_missing_c_args[names(non_missing_c_args)%in%names(new_args)])

          }
          if(is.null(call_names)){

            tmp_func<-try(eval(x[[1]]),silent=TRUE)


            if(!is_error(tmp_func)){
            s3Default<-paste0(as.character(x[[1]]),".default")
            fn_args=args(tmp_func)
            arg_names<-NULL
            if(!is.null(fn_args))
               arg_names<-fn_fmls_names(args(tmp_func))
            if( exists(s3Default)){
              arg_names=unique(c(arg_names,names(formals(eval(sym(s3Default))))))
            }
            update_args=new_args[names(new_args)%nin%is_present]
            update_args= update_args[names(update_args)%in% arg_names]
            if(length(update_args)>0){
              x <- call_modify(x, !!! update_args)

              eval(expr(!!self_expr<-expr(!!x)))
            }
            }
          }else{
            if(as_string(x[[1]])%in%call_names){

            update_args=new_args[names(new_args)%nin%is_present]
            if(length(update_args)>0){
              x <- call_modify(x, !!! update_args)

              eval(expr(!!self_expr<-expr(!!x)))
            }
            }
          }
          }
            flat_map(
              .x = call_args(x),
              .f = self$.find_calls_add_arg,
              self_expr = self_expr,
              index_start = 2,
              call_names=call_names,
              new_args=new_args,
              skip=skip,
              modify_if_present=modify_if_present
            )
        }

      )
    },
    find_calls = function(x=self$tmp_expr,self_expr=expr(self$tmp_expr),index=NULL) {
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
          .f = self$find_calls,
          self_expr = self_expr
        ),
        call = {

            if(as.character(x[[1]])%in%self$standard)
              eval(expr(!!self$next_level(self_expr,1)<-expr(standard)))
            if(as.character(x[[1]])%in%self$agg)
              eval(expr(!!self$next_level(self_expr,1)<-expr(agg)))
            if(as.character(x[[1]])=='ifelse')
              eval(expr(!!self$next_level(self_expr,1)<-expr(ifel)))
            flat_map(
              .x = call_args(x),
              .f = self$find_calls,
              self_expr = self_expr,
              index_start = 2
            )

          }

      )
    },
    find_operators = function(x=self$tmp_expr,self_expr=expr(self$tmp_expr),index=NULL,ops) {
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
          .f = self$find_operators,
          self_expr = self_expr,
          ops=ops
        ),
        call = {

          callname =call_name(x)
          if(callname %in%ops){
            replacement=expr(ops(!!!call_args(x),op=!!callname))
            eval(expr(!!self_expr<-expr(!!replacement)))

            flat_map(
              .x = call_args(x),
              .f = self$find_operators,
              self_expr = self_expr,
              index_start = 2,
              ops=ops
            )
          }else{
            flat_map(
              .x = call_args(x),
              .f = self$find_operators,
              self_expr = self_expr,
              index_start = 2,
              ops=ops
            )


          }}

      )
    },
    find_call_name = function(x=self$tmp_expr,self_expr=expr(self$tmp_expr),index=NULL,call_name,replacement) {
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
          .f = self$find_call_name,
          self_expr = self_expr,
          call_name=call_name,
          replacement=replacement
        ),
        call = {

          callname =call_name(x)
          if(callname %in%call_name){
            replacetmp=sym(replacement[call_name==callname])
            eval(expr(!!self$next_level(self_expr,1)<-expr(!!replacetmp)))


            flat_map(
              .x = call_args(x),
              .f = self$find_call_name,
              self_expr = self_expr,
              index_start = 2,
              call_name=call_name,
              replacement=replacement
            )
          }else{
            flat_map(
              .x = call_args(x),
              .f = self$find_call_name,
              self_expr = self_expr,
              index_start = 2,
              call_name=call_name,
              replacement=replacement
            )


          }}

      )
    },
    .return_named_bracket = function(x=self$tmp_expr,self_expr=expr(self$tmp_expr),index=NULL,name,skip_first=FALSE,grep=FALSE,fully_chained=FALSE) {
      #replacement<-'list'
      #if(is.null(index))print("NULL")
      flat_map <- function(.x, .f,index_start=1L, ...) {
        to=length(.x)+1
        if(length(.x)<index_start)to=index_start
        map2(.x=.x,.y=seq(from=index_start,to=to,by=1),.f=.f,...)
      }
      if(expr_type(x)=='call'&skip_first&&x[[1]]==sym('[')){
        out<-flat_map(
          .x = call_args(x),
          .f = self$.return_named_bracket,
          self_expr = self_expr,
          index_start = 2,
          name=name,
          skip_first=FALSE,
          grep=grep,
          fully_chained=fully_chained
        )
      }else{
        if(!is.null(index)){

          self_expr<- self$next_level(self_expr,index)
          #print(deparse(self_expr))
        }

        #  x=self$tmp_formula
        #x=call_args(x)[[1]]
        # self_expr= expr(x[[2]])
        constant_f=function(x)return()

        out<-switch_expr(
          x,
          # Base cases
          constant = constant_f(x),
          symbol = constant_f(x),
          # Recursive cases
          pairlist = map(
            .x = as.list(x),
            .f = self$.return_named_bracket,
            self_expr = self_expr,
            name=name,
            skip_first=FALSE,
            grep=grep,
            fully_chained=fully_chained
          ),
          call = {
              mt1=x[[1]]
              mt2=x[[2]]
            if(fully_chained){
              tmp=unique(expr_unlist(x,recursive = T))
              mt2= tmp[[2]]
              mt1= tmp[[1]]
            }
            if(grep)
                matched=as.character(mt1)=="["&&grepl(name,as.character(mt2),fixed=TRUE)
            if(grep==F)
                matched=as.character(mt1)=="["&&as.character(mt2)==name

            if(matched){
              return(x)
            }else{

              flat_map(
                .x = call_args(x),
                .f = self$.return_named_bracket,
                self_expr = self_expr,
                index_start = 2,
                name=name,
                skip_first=FALSE,
                grep=grep,
                fully_chained=fully_chained
              )

            }}
        )

      }
      unlist(out)
    },
    return_named_bracket=function(name,skip_first=TRUE,grep=FALSE,fully_chained=FALSE){
      self$tmp_expr=self$expr
      self$.return_named_bracket(name=name,skip_first = skip_first,grep=grep,fully_chained=fully_chained)
    },
    .return_call = function(x=self$tmp_expr,self_expr=expr(self$tmp_expr),index=NULL,call_name,skip_first=FALSE,grep=FALSE) {
      #replacement<-'list'
      #if(is.null(index))print("NULL")
      flat_map <- function(.x, .f,index_start=1L, ...) {
        to=length(.x)+1
        if(length(.x)<index_start)to=index_start
        map2(.x=.x,.y=seq(from=index_start,to=to,by=1),.f=.f,...)
      }
      if(expr_type(x)=='call'&skip_first){
        out<-flat_map(
          .x = call_args(x),
          .f = self$.return_call,
          self_expr = self_expr,
          index_start = 2,
          call_name=call_name,
          skip_first=FALSE,
          grep=grep
        )
      }else{
      if(!is.null(index)){

        self_expr<- self$next_level(self_expr,index)
        #print(deparse(self_expr))
      }

      #  x=self$tmp_formula
      #x=call_args(x)[[1]]
      # self_expr= expr(x[[2]])
      constant_f=function(x)return()

      out<-switch_expr(
        x,
        # Base cases
        constant = constant_f(x),
        symbol = constant_f(x),
        # Recursive cases
        pairlist = map(
          .x = as.list(x),
          .f = self$.return_call,
          self_expr = self_expr,
          call_name=call_name,
          skip_first=FALSE,
          grep=grep
        ),
        call = {
          current_call=as.character(x[[1]])

            if(grep&&grepl(call_name,current_call))
               return(x)

            if(!grep&&current_call%in%call_name)
              return(x)


            flat_map(
              .x = call_args(x),
              .f = self$.return_call,
              self_expr = self_expr,
              index_start = 2,
              call_name=call_name,
              skip_first=FALSE,
              grep=grep
            )

          }
      )

      }
      unlist(out)
    },
    return_call=function(call_name,grep,skip_first=TRUE){
      self$tmp_expr=self$expr
      self$.return_call(call_name=call_name,grep=grep,skip_first = skip_first)
    },
    .has_call_type = function(x=self$tmp_expr,self_expr=expr(self$tmp_expr),index=NULL,call_name,skip_first) {
      if(expr_type(x)=='call'&skip_first&&x[[1]]!=sym('[')){
        x[[1]] <-sym(create_unique_id(length = 6))
      }
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

      out<-switch_expr(
        x,
        # Base cases
        constant = return(FALSE),
        symbol = return(FALSE),
        # Recursive cases
        pairlist = map(
          .x = as.list(x),
          .f = self$.has_call_type,
          self_expr = self_expr,
          call_name=call_name,
          skip_first=FALSE
        ),
        call = {
          if(as.character(x[[1]])%in%call_name){
            return(TRUE)
          }else{

            flat_map(
              .x = call_args(x),
              .f = self$.has_call_type,
              self_expr = self_expr,
              index_start = 2,
              call_name=call_name,
              skip_first=FALSE)


          }}
      )
      any(unlist(out))
    },
    has_call_type=function(call_name,skip_first=TRUE){
      self$tmp_expr=self$expr
      self$.has_call_type(call_name=call_name,skip_first = skip_first)
    },
    .has_named_bracket = function(x=self$tmp_expr,self_expr=expr(self$tmp_expr),index=NULL,name,skip_first,grep) {
      #replacement<-'list'
      #if(is.null(index))print("NULL")
      flat_map <- function(.x, .f,index_start=1L, ...) {
        to=length(.x)+1
        if(length(.x)<index_start)to=index_start
        map2(.x=.x,.y=seq(from=index_start,to=to,by=1),.f=.f,...)
      }
      if(expr_type(x)=='call'&skip_first&&x[[1]]==sym('[')){
        out<-flat_map(
          .x = call_args(x),
          .f = self$.has_named_bracket,
          self_expr = self_expr,
          index_start = 2,
          name=name,
          skip_first=FALSE,
          grep=grep
        )
      }else{
        if(!is.null(index)){

          self_expr<- self$next_level(self_expr,index)
          #print(deparse(self_expr))
        }

        #  x=self$tmp_formula
        #x=call_args(x)[[1]]
        # self_expr= expr(x[[2]])
        constant_f=function(x)return()

        out<-switch_expr(
          x,
          # Base cases
          constant = FALSE,
          symbol =FALSE,
          # Recursive cases
          pairlist = map(
            .x = as.list(x),
            .f = self$.has_named_bracket,
            self_expr = self_expr,
            name=name,
            skip_first=FALSE,
            grep=grep
          ),
          call = {
            if(grep)matched=as.character(x[[1]])=="["&&grepl(name,as.character(x[[2]]),fixed=TRUE)
            if(grep==F)matched=as.character(x[[1]])=="["&&as.character(x[[2]])==name
            if(matched){
              return(TRUE)
            }else{

              flat_map(
                .x = call_args(x),
                .f = self$.has_named_bracket,
                self_expr = self_expr,
                index_start = 2,
                name=name,
                skip_first=FALSE,
                grep=grep
              )

            }}
        )

      }
      any(unlist(out))
    },
    has_named_bracket=function(name,skip_first=TRUE,grep=FALSE){
      self$tmp_expr=self$expr
      self$.has_named_bracket(name=name,skip_first = skip_first,grep=grep)
    },
    find_agg_calls_replace=function(){
      self$tmp_expr=self$expr

      self$find_calls()
      self$tmp_expr
    },
    find_operators_replace=function(ops){
      self$tmp_expr=self$expr

      self$find_operators(ops=ops)
      self$tmp_expr
    },
    find_replace_calls=function(call_name,replacement){
      self$tmp_expr=self$expr

      self$find_call_name(call_name=call_name,replacement=replacement)
      self$tmp_expr
    },
    replace_=function(x,self_expr,symbol,replacement,match.first=FALSE){

      if(is_expr_equal(x,symbol)){


        tmp=expr(self_expr<-replacement)
        tmp[[2]]<-expr(!!self_expr)
        tmp[[3]]<-expr(parse_expr(replacement))
        eval(tmp)
        if(match.first){
          g_stop("Done")
        }
        return(TRUE)
      }
      return(FALSE)
    },
    next_level=function(exp_in,index){

      tmp=expr(ex[[!!index]])
      tmp[[2]]<-exp_in
      tmp
    }
  ),
  private = list(
    .replace_count=0,
    .ops=c('+','-','*','/','%%','^','%/%','==','!=','<','<=','>=','>','&','|',"!"),
    .logical_ops=c('&','|',"!"),
    .compare=c('==','!=','<','<=','>=','>'),
    .agg=c('N',
           'N_missing',
           'Nth',
           'N_distinct',
           'N_duplicated',
           'first',
           'last',
           'IQR',
           'mad',
           'mean',
           'median',
           'max',
           'min',
           'sum',
           'sd',
           'var',
           'cor',
           'kurtosis',
           'skewness',
           'moment'),
    .math=c('abs','sign','sqrt',
            'floor', 'ceiling', 'trunc',
            'round', 'signif','exp', 'log', 'expm1', 'log1p',
            'cos', 'sin', 'tan',
            'cospi', 'sinpi', 'tanpi',
            'acos', 'asin', 'atan',
            'cosh', 'sinh', 'tanh',
            'acosh', 'asinh', 'atanh'),
    .table=c('cumsum', 'cumprod', 'cummax', 'cummin','diff')
  ),
  active = list(
    agg=function(value){
      if(missing(value)){

        return(private$.agg)

      }
      stop("agg is read only")
    },
    ops=function(value){
      if(missing(value)){

        return(private$.ops)

      }
      stop("ops is read only")
    },
    math=function(value){
      if(missing(value)){

        return(private$.math)

      }
      stop("math is read only")
    },
    table=function(value){
      if(missing(value)){
        return(private$.table)
      }
      stop("table is read only")
    },
    logical_ops=function(value){
      if(missing(value)){

        return(private$.logical_ops)

      }
      stop("logical_ops is read only")
    },
    standard=function(value){
      if(missing(value)){

        return(c(self$ops,self$table,self$math))

      }
      stop("logical_ops is read only")
    },
    replace_count=function(value){
      if(missing(value)){
        private$.replace_count=private$.replace_count+1
        return(private$.replace_count)
      }
      private$.replace_count=value
    }
  )
)

#' @export
replace_calls_in_expr=function(expr){
  self<-CodeTree$new(expr)
  self$find_agg_calls_replace()
}

#' @export
replace_ops_in_expr=function(expr,ops=c("+","-","/","*","^","%%","!=","==",'>=',"<=",">","<","%/%")){
  self<-CodeTree$new(expr)
  self$find_operators_replace(ops=ops)
}
