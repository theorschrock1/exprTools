#' Check if two expression are equal.

#' @name is_expr_equal
#' @param x  [expr] an R expression
#' @param y  [expr] an R expression
#' @return \code{is_expr_equal}: [logical(1)]
#' @examples

#'  x = expr({

#'  x = 1

#'  })

#'  y = expr({

#'  x <- 1

#'  })

#'  x = expr(function(x) {

#'  out = lapply(x, function(x) x * 1)

#'  out

#'  })

#'  y = expr(function(x) {

#'  out = lapply(x, function(y) y * 1)

#'  out

#'  })

#'  is_expr_equal(x, y)

#' @export
is_expr_equal <- function(x, y) {
    # Check if two expression are equal
    assert_expr(x)
    assert_expr(y)
    if (is_curly_call(x) & is_curly_call(y)) {
        if (l(x) != l(y))
            return(FALSE)
        xargs = call_args(x)
        yargs = call_args(y)
        out = map2(xargs, yargs, is_expr_equal) %>% unlist()
        return(all(out))
    }

    if (is_special_call(x) & is_special_call(y)) {
        if (x != y)
            return(FALSE)
        xargs <- call_args(x)
        yargs <- call_args(y)
        xc = xargs[sapply(xargs, is_curly_call)]
        yc = yargs[sapply(yargs, is_curly_call)]
        if (l(xc) != l(yc))
            return(FALSE)
        out = map2(xc, yc, is_expr_equal) %>% unlist()
        return(all(out))
    }

    if (is_call(x) & is_call(y)) {
        if (x[[1]] != y[[1]]) {
            assignx = as.character(x[[1]]) %in% c("<-", "=")
            assigny = as.character(y[[1]]) %in% c("<-", "=")
            if (!all(c(assignx, assigny)))
                return(FALSE)
        }
        xargs <- call_args(x)
        yargs <- call_args(y)
        if (l(xargs) != l(yargs))
            return(FALSE)
        if (l(names(x)) != l(names(y)))
            return(FALSE)
        if (any(names(x) != names(y)))
            return(FALSE)
        out = map2(xargs, yargs, is_expr_equal) %>% unlist()
        return(all(out))
    }

    if (is_missing(x) & is_missing(y))
        return(TRUE)
    if (is_missing(x))
        return(FALSE)
    if (is_missing(y))
        return(FALSE)
    if (is.null(x) & is.null(y))
        return(TRUE)
    if (is.null(x))
        return(FALSE)
    if (is.null(y))
        return(FALSE)
    out <- expr_type(x) == expr_type(y) & l(x) == l(y) & x == y
    if(length(out)>1){
        g_print("x={deparse(x)%sep%''}")
        g_print("y={deparse(y)%sep%''}")
    }
    if (is.na(out)) {
        if (is.na(x) & is.na(y)) {
            return(TRUE)
        }
        return(FALSE)
    }

    out
    # Returns: [logical(1)]
}

