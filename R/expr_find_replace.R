#' Find and replace symbol names in an expr
#'
#'

#' @name expr_find_replace
#' @param find a constant, symbol, expr, or exprs
#' @param replacement the replacement constant, symbol, expr, or exprs
#' @param in_expr the target expression

#' @return  an expression

#' @examples

#' data=data.table(mtcars)
#' in_expr=expr(data[,.(J)])
#' find = J
#' replacement= exprs(sum_mpg=sum(mpg),max_mpg=max(mpg))
#' out=expr_find_replace(find,replacement,in_expr)
#' print(out)
#' out %>% eval()
#' in_expr=expr(.(sum(x),sum(x),sum(x)))
#' expr_find_replace(find,replacement,in_expr,match.first=TRUE)

#' @export
expr_find_replace=function(find,replacement,in_expr,match.first=FALSE){

  #if(!is_character(find_sym))stop("find must be a symbol name in character format")
  if(!is.language(in_expr))stop('Error in expr_find_replace. in_expr must be an expression')
  #if(is_character(replacement))replacement<-sym(replacement)
  self<-CodeTree$new(in_expr)
  self$find_and_replace(find=find,replacement=replacement,match.first=match.first)

}

