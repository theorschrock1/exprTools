#' Apply a function formula in an expr.

#' @name expr_apply_fn_formulas
#' @param x  [expr] an expr or formula expr
#' @return \code{expr_apply_fn_formulas}: [expr]
#' @examples

#'  x = (.(sum ~ x + y + z, min ~ x + y + z))

#'  expr_apply_fn_formulas(x)

#'  x = sum ~ x + y + z

#'  expr_apply_fn_formulas(x)

#' @export
expr_apply_fn_formulas <- function(x) {
    # Apply a function formula in an expr

    x <- assert_expr(x)
    apply_formula_expr = function(x) {
        if (!is_formula(x))
            g_stop("x is not a formula")
        if (!is_function(try(eval(x[[2]]), silent = T)))
            g_stop("'{x[[2]]}' is not a function in formula '{x[[2]]} ~ {f_name(x)}'")
        .f <- f_lhs_nms(x)
        vars <- f_rhs_nms(x)
        expr_glue("{.f}({vars})")
    }
    if(!expr_has_call_name(x, '~'))return(x)
    forms <- expr_extract_call(x, "~", skip_first = F)
    if (length(forms) == 1 && is.null(forms[[1]]))
        return(x)
    if (is_expr_equal(forms[[1]], x))
        return(expr(list(!!!apply_formula_expr(x))))
    replace <- lapply(forms, apply_formula_expr)
    expr_find_replace_all(forms, replace, x)
    # Returns: [expr|exprs] Return is a list of calls if x is a formula. Otherwise an
    # expr is returned
}
