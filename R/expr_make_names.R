#' Generate names for a list of expressions
#'
#'

#' @name exprs_make_names
#' @param x list of exprs
#' @param duplicates.ok [Logical(1)] Should duplicate names be allowed? Default is FALSE
#' @return a named list of expressions

#' @examples
#' x=exprs(sum(hours),sum(hours),max(hours),some_func(hours))
#' exprs_make_names(x)
#' x=exprs(sum(x),sum(y),max(y),mean(x),mean(y),mean(y))
#' exprs_make_names(x,duplicates.ok = FALSE)

#' @export
exprs_make_names=function(x,duplicates.ok=FALSE){
  makeF=function(x){
    if(is_symbol(x))return(as_name(x))
    #xtmp=as.character(x)
    af=as_name(x[[1]])

    out<-switch(af,
                sum= as_name(x[[2]]),
                max=glue('Max. {as_name(x[[2]])}'),
                min=glue('Min. {as_name(x[[2]])}'),
                length=glue('Cnt. {as_name(x[[2]])}'),
                N=glue('Cnt. {as_name(x[[2]])}'),
                N_distinct=glue('Cnt Dist. {as_name(x[[2]])}'),
                N_missing=glue('Cnt Null. {as_name(x[[2]])}'),
                N_duplicated=glue('Cnt Dup. {as_name(x[[2]])}'),
                median=glue('Med. {as_name(x[[2]])}'),
                sd=glue('Std. {as_name(x[[2]])}'),
                var=glue('Var. {as_name(x[[2]])}'),
                IQR=glue('IQR {as_name(x[[2]])}'),
                mad=glue('MAD {as_name(x[[2]])}'),
                mean=glue('Avg. {as_name(x[[2]])}'))
    if(is.null(out))out<-deparse(x)%sep%""
    out
  }
  if(is.null(names(x))){
    maken=lapply(x,makeF) %>% unlist()
    names(x)=maken
  }else{
    maken<-lapply(x[names(x)==''],makeF) %>% unlist()
    names(x)[names(x)=='']=maken
  }

  if(duplicates.ok==FALSE){
    names(x)=make_names_unique(names(x))
  }
  x
}

