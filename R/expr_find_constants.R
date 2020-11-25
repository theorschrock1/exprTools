#' Extract constants from an R expression.

#' @name expr_find_constants
#' @param x  [expr]
#' @param type  [character]  NULL is ok.  Defaults to NULL
#' @return \code{expr_find_constants}: [vector] a vector of type matches
#' @examples

#'  x = expr(list(1L, T, 'a', 1.04))

#'  expr_find_constants(x)

#'  expr_find_strings(x)

#'  expr_find_numeric(x)

#'  expr_find_integers(x)

#'  expr_find_logical(x)

#' @export
expr_find_constants <- function(x, type = NULL) {
    # Extract constants from an R expression
    assert_expr(x)
    assert_character(type, null.ok = TRUE)
    x = expr_find_replace_all(exprs(T, F), exprs(TRUE, FALSE), x)
    .expr_find_constants = function(x, type = NULL) {
        flat_map <- function(.x, .f, ...) {
            map(.x = .x, .f = .f, ...)
        }
        constant_f = function(x) return(x)
        if (!is_null(type)) {
            test <- expr_glue("is(x,'{type}')") %>% expr_reduce(`|`)
            bod <- expr({
                if (!!test) {
                  return(x)
                } else {
                  return(NULL)
                }
            })
            constant_f = new_function(pairlist2(x = ), bod)
        }
        symbol_f = function(x) return()
        out <- switch_expr(x, constant = constant_f(x), symbol = symbol_f(x), pairlist = flat_map(.x = as.list(x),
            .f = .expr_find_constants, type = type), call = flat_map(.x = call_args(x),
            .f = .expr_find_constants, type = type))
        out <- unlist(out) %>% unique()
        out[out != ""]
    }
    .expr_find_constants(x, type = type)
    # Returns: [vector] a vector of type matches
}
#' @export
expr_find_strings=function(x){
    expr_find_constants(x=x,type="character")

}
#' @export
expr_find_numeric=function(x){
    expr_find_constants(x=x,type="numeric")

}
#' @export
expr_find_integers=function(x){
    expr_find_constants(x=x,type="integer")
}
#' @export
expr_find_logical=function(x){

    expr_find_constants(x=x,type="logical")

}
