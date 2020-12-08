#' Check list names and structure.

#' @name check_named_list
#' @param x  \code{[object]} an object to check
#' @param structure \code{[list]}  Must be a named list.
#' @param null.ok  \code{[logical]}  Must have an exact length of \code{1}.  Defaults to \code{FALSE}
#' @param extra.items  \code{[logical]}  Must have an exact length of \code{1}.  Defaults to \code{FALSE}
#' @return \code{check_named_list}: \code{[TRUE|character(message)]}
#' @examples

#'  check_named_list(list(x = c('c', NA_character_), y = 1:5),
#'  structure = list(x = char(), y = numeric()))
#'  check_named_list(list(x = c('c', NA_character_), y = 1:5),
#'  structure = list(x = char(any.missing = FALSE), y = numeric()))
#'  check_named_list(list(x = c('c', NA_character_)), structure = list(x = char(),
#'  y = numeric()))
#'  check_named_list(list(x = c('c', NA_character_)), structure = list(x = char(),
#'  y = numeric(NULL)))
#'  check_named_list(list(x = LETTERS), structure = list(x = subset(choices = LETTERS)))
#'  check_named_list(list(x = LETTERS), structure = list(x = subset(choices = letters)))
#'  check_named_list(list(x = 1, y = 1, z = 4), structure = list(x = num(),
#'  y = num(), z = num()))
#'  check_named_list(list(x = 1, y = 1, z = 4, a = 1), structure = list(x = num(),
#'  y = num(), z = num()))
#'  check_named_list(list(x = 1, y = 1, z = 4, a = 1), structure = list(x = num(),
#'  y = num(), z = num()), extra.items = TRUE)
#'  check_named_list(list(x = 1, y = 1, a = 1), structure = list(x = num(),
#'  y = num(), z = num()), extra.items = TRUE)
#'  check_named_list(list(x = 1, y = 1, a = 1), structure = list(x = num(),
#'  y = num(), z = num(NULL)), extra.items = TRUE)
#'  check_named_list(NULL, structure = list(x = num(), y = num(),
#'  z = num(NULL)))
#'  check_named_list(NULL, structure = list(x = num(), y = num(),
#'  z = num(NULL)), null.ok = TRUE)
#' @export
check_named_list <- function(x, structure, null.ok = FALSE, extra.items = FALSE) {
    # Assert a list's names and structure
    if (is.null(x) & !null.ok)
        return("Must not be null")
    if (is.null(x) & null.ok)
        return(TRUE)
    structure <- enexpr(structure)
    list_names = names(structure)[-1]
    assert_names(list_names, "unique")
    assert_logical(extra.items, len = 1)
    assert_logical(null.ok, len = 1)
    assert_call(structure, call_name = c(".", "list"))
    res <- check_list(x, names = "unique")
    if (!isTRUE(res))
        return(res)
    nms = rlang::parse_exprs(glue("x${names(structure)[-1]}"))
    structure[[1]] <- rlang::sym(".")
    dots = structure
    ae = get_assert_env()
    map(call_args(dots), function(x) assert_call(x, names(ae)))
    dots <- eval(dots, envir = ae)
    asserts <- map2(nms, dots, function(name, call_expr) {
        tmp <- expr_call_modify(call_expr[[2]], x = !!name)
        if (call_expr[[1]] == "=NULL")
            tmp = expr_call_modify(tmp, null.ok = TRUE)
        names(tmp)[2] <- ""
        tmp
    })
    mustinclude <- sapply(asserts, function(x) !isTRUE(x$null.ok))
    if (all(mustinclude)) {
        if (extra.items == FALSE)
            res <- check_names(names(x), permutation.of = list_names)
        if (extra.items == TRUE)
            res <- check_names(names(x), must.include = list_names)
    } else {
        if (extra.items == FALSE)
            res <- check_names(names(x), subset.of = list_names, must.include = list_names[mustinclude])
        if (extra.items == TRUE)
            res <- check_names(names(x), must.include = list_names[mustinclude])
    }
    if (!isTRUE(res))
        return(res)
    out <- lapply(lapply(asserts, function(x) {
        x[[1]] <- sym(str_replace(as.character(x[[1]]), "assert", "check"))
        x
    }), eval, envir = current_env())
    res <- out[!sapply(out, isTRUE)]
    if (l(res) > 0) {
        return(paste0("List element \"", list_names[!sapply(out, isTRUE)], "\" ", res) %sep%
            "\n")
    }
    return(TRUE)
    # Returns: invisible(x)
}
