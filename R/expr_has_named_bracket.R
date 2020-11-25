#' Test if an expr contains a named bracket call
#'
#'

#' @name expr_has_named_bracket
#' @param x an expr
#' @param name the name to search for
#' @param skip_first Logical. should the first named bracket be skipped. Defaults to TRUE
#' @param grep Logical. should the name be a pattern to grep

#' @return Logical TRUE/FALSE
#' @examples

#' x=expr(data[,.(.SD[,sum(mpg)]),by=.(am)])
#' name = ".SD"
#' expr_has_named_bracket(x,name)
#' name = "data"
#' expr_has_named_bracket(x,name)
#' name = "data"
#' expr_has_named_bracket(x,name,skip_first=FALSE)

#' @export
expr_has_named_bracket<-function(x,name,skip_first=TRUE,grep=FALSE){
  assertString(name)
  # assert(
  #   check_true(is.language(x))
  # )
  tree=CodeTree$new(x)
  tree$has_named_bracket(name = name,skip_first=skip_first,grep=grep)
}

