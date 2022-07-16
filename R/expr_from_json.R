#' Parse an R expression from a JSON string.

#' @name expr_from_json
#' @param x  \code{[json]}
#' @return \code{expr_from_json}: \code{[expr]}
#' @examples

#'  expr_from_json(expr_to_json(toJSON(out, null = 'null', auto_unbox = T)))
#'  expr_from_json(expr_to_json(check_named_list(structure = list(type = string('langauge'),
#'  attributes = list(), value = char(null.ok = T)))))
#' @export
expr_from_json <- function(x) {
    # Parse an R expression from a JSON string
    assert_json(x, check_named_list(structure = list(type = string("langauge"), attributes = list(), value = char(null.ok = T))))
    unserializeJSON(x)
    # Returns: \code{[expr]}
}
