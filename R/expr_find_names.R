#' Find variable names in an expr
#'
#'

#' @name find_names_in_expr
#' @param x an expr
#' @return all variable names as class symbol

#' @examples


#' x=expr(data[,.(sum(mpg),mean(vs)),by=.(am)])
#' expr_find_names(x)

#' @export
expr_find_names = function(x) {

  flat_map <- function(.x, .f, ...) {
    map(.x=.x,.f=.f,...)
  }
  #  x=self$tmp_formula
  #x=call_args(x)[[1]]
  # self_expr= expr(x[[2]])
  constant_f=function(x)return()
  symbol_f=function(x) {
    x=as_string(x)
    if(x%in%c('T','F'))return()
    x
  }

  out<-switch_expr(x,
              # Base cases
              constant = constant_f(x),
              symbol = symbol_f(x),

              # Recursive cases
              pairlist = flat_map(.x=as.list(x),.f=expr_find_names),
              call = flat_map(.x=call_args(x),.f=expr_find_names)

  )
 out <-unlist(out) %>% unique()
  out[out!=""]
}
#' @export
find_names_in_expr= expr_find_names

