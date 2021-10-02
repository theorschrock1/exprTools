#' Extract named bracket calls from an expr
#'
#'

#' @name expr_extract_named_bracket
#' @param x an expr
#' @param name the name to search for
#' @param skip_first Logical. should the first named bracket be skipped. Defaults to TRUE
#' @param grep Logical. should the name be a pattern to grep
#' @return all named bracket calls matching the name

#' @examples

#' x=expr(data[,.(.SD[,sum(mpg)]),by=.(am)])

#' name = ".SD"
#' expr_extract_named_bracket(x,name)
#' x=expr(data[,.(.SD_543[,sum(mpg)]),by=.(am)])
#' name = ".SD"
#' expr_extract_named_bracket(x,name,grep=FALSE)
#' expr_extract_named_bracket(x,name,grep=TRUE)

#' @export
expr_extract_named_bracket<-function(x,name,skip_first=TRUE,grep=FALSE,fully_chained=FALSE){
  assertString(name)
  # assert(
  #   check_true(is.language(x))
  # )
  tree=CodeTree$new(x)
  tree$return_named_bracket(name = name,skip_first=skip_first,grep=grep,fully_chained=fully_chained)
}

