#' Detect a name in an expr.

#' @name expr_detect_name
#' @param x
#' @param name  \code{[character]}
#' @param search_in_strings  \code{[logical]}  Defaults to \code{FALSE}
#' @return \code{expr_detect_name}: Logical(1)
#' @examples

#'  x <- expr(glue_data(dt, 'Hello {name}, you are {get_age(name)} years old.'))
#'  expr_detect_name(x, name = 'glue_data', search_in_strings = FALSE)
#'  expr_detect_name(x, name = 'glue_data', search_in_strings = TRUE)
#'  expr_detect_name(x, name = 'get_age', search_in_strings = FALSE)
#'  expr_detect_name(x, name = 'get_age', search_in_strings = TRUE)
#' @export
expr_detect_name <- function(x, name, search_in_strings = FALSE) {
    # Detect a name in an expr
    assert_character(name)
    assert_logical(search_in_strings)
    switch_expr(x, constant = {
        if (search_in_strings & is_character(x)) {
            return(grepl(name, x))
        } else {
            return(FALSE)
        }
    }, symbol = {
        if (!search_in_strings) {
            return(as.character(x) == name)
        } else {
            return(FALSE)
        }
    }, pairlist = purrr::some(as.list(x), expr_detect_name, name = name, search_in_strings = search_in_strings), 
        call = purrr::some(as.list(x), expr_detect_name, name = name, search_in_strings = search_in_strings))
    # Returns: Logical(1)
}
