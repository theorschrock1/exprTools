#' Find variable names in an expr
#'
#'

#' @name expr_has_name
#' @param x an expr
#' @param name a symbol name in character format
#' @param ignore.first logical. Should the first symbol name be ingored?
#' @return Logical TRUE/FALSA
#' @examples


#' x=expr(data[,.(sum(mpg),mean(vs)),by=.(am)])
#'expr_has_name(x,name='mpg')

#' @export
expr_has_name=function(x,name,ignore.first=T){
  names_found=expr_find_names(x)
  if(ignore.first)names_found=names_found[-1]
  if(missing(name))return(l(names_found)!=0)
  any(names_found%in%name)
}
