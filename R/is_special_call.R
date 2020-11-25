#' Test if an object is a raw 'function','if' statement, or 'for' loop call.

#' @name is_special_call
#' @param x an object
#' @return \code{is_special_call}: [Logical(1)]
#' @examples

#'  x <- expr(function(x) {

#'  x + 1

#'  })

#'  is_special_call(x)

#'  x <- expr(for (i in 1:10) {

#'  print(x)

#'  })

#'  is_special_call(x)

#'  x <- expr(if (i > 10) {

#'  print(i)

#'  })

#'  is_special_call(x)

#'  x <- expr(glue('This is {x}'))

#'  is_special_call(x)

#' @export
is_special_call <- function(x) {
    # Test if an object is a raw 'function','if' statement, or 'for' loop
    # call
    is_raw_function(x) | is_loop(x) | is_if_statement(x)
    # Returns: [Logical(1)]
}
#' @export
is_curly_call=function(x){
  #Test if an object is a curly bracket '{' call
  is_call(x,"{")
  #returns [Logical(1)]
}
