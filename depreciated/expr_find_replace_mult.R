#' Find and replace symbol names in an expression

#' @name expr_find_replace_mult
#' @param x named list with names equaling the symbols to find and the contents as the replacement/s
#' @param in_expr the target expression

#' @return  an expression

#' @examples

#' in_expr=expr(data[I,.(J),.(BY)])

#' x = list(data=expr(data.table(mtcars)),
#'          I = expr(am != 0),
#'          J = exprs(max_mpg=max(.SD[,sum(mpg),by=.(gear,carb)]$V1)),
#'          BY = exprs(am = am, cyl = cyl))

#' out=expr_find_replace_mult(x,in_expr)
#' print(out)
#' out %>% eval()

expr_find_replace_mult=function(x,in_expr){
  if(!is_list(x))stop("x must be a named list with names equaling what to find and the contents as the replacement/s")
  if(is.null(names(x)))stop("x must be a named list with names equaling what to find and the contents as the replacement/s")
  find_syms=names(x)
  replacements=x
  for(i in 1:l(find_syms)){
    find_sym=find_syms[i]
    replacement=replacements[[i]]
    if(!is_character(find_sym))stop("find must be a symbol name in character format")
    if(is_character(replacement))replacement<-sym(replacement)
    self<-CodeTree$new(in_expr)
    in_expr= self$find_and_replace(find_sym=find_sym,replacement=replacement)
  }
  return(in_expr)
}
