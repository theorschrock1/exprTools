#' Build code to reduce a list to a single value by iteratively applying a binary function.
#'
#'

#' @name expr_reduce
#' @param x  [list] a list of unevaluated expression
#' @param func  [function]  Defaults to %>%
#' @return  An R expression
#' @examples
#'
#' x<-exprs(t,u,v,x,y,z)
#' expr_reduce(x,`+`)

#' @export
expr_reduce<-function (x, func = `%>%`)
{
    assert_list(x)
    f <- enexpr(func)
    assert_function(func)
    .build = function(x, y, func) {
        tmp = expr(f(!!x, !!y))
        tmp[[1]] <- func
        tmp
    }
    reduce(x, .build, func = f)
}
