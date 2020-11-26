#' Extract the first aggregration function name from an R expr
#'
#'

#' @name expr_extract_agg_func
#' @param x an R expr
#' @param fill a name to return if agg call is not present or is ignored

#' @return a call name

#' @examples


#' x=exprs(sum_mpg=sum(mpg,na.rm=FALSE),mean_mpg=mean(mpg,na.rm=),max_mpg=max(mpg),gg=shift(mpg))
#' expr_extract_agg_func(x)
#' expr_set_agg_func(x) %>% expr_extract_agg_func()

#' @export
expr_extract_agg_func <- function(x,
                                  fill = NA,
                                  agg_funcs = c(
                                    'N',
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
                                    'moment'
                                  )) {
  if(is.list(x))return(lapply(x,expr_extract_agg_func,fill=fill,agg_funcs =agg_funcs))
  if (!is_call(x))
    return(fill)
  if (as_string(x[[1]]) %nin% agg_funcs)
    return(fill)
  as_string(x[[1]])
}
#' @export
expr_set_agg_func=function(x,default="sum",agg_funcs=c(
  'N',
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
  'moment'
)){
  if(is.list(x))return(lapply(x,expr_set_agg_func,default=default,agg_funcs =agg_funcs))
  if (!is_call(x)|| as_string(x[[1]]) %nin% agg_funcs){
   tmp<-expr(default(!!x))
   tmp[[1]]<-sym(default)
   return(tmp)
  }
  x
}
