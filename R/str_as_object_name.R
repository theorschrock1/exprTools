#' Turn an string into a valid R object name.

#' @name str_as_object_name
#' @param x  \code{[character]}  NULL is ok.
#' @return \code{str_as_object_name}: \code{[character]}
#' @examples

#'  str_as_object_name(x = c('sdf', 'sf', 'safd`', 'sdf a ',
#'  '123sd', 'sadf{}sa', 'sdf_sdf', 'faf(1)', 'fds2', 'dsf.fs',
#'  'sdf$fds'))
#' @export
str_as_object_name <- function(x) {
    # Turn an string into a valid R object name
    assert_character(x, null.ok = TRUE)
    x <- str_remove_all(x, "`")
    res = str_detect(x, "^[0-9A-Za-z_\\.]+$") & str_detect(x, "^[A-Za-z]")
    x[!res] <- paste0("`", x[!res], "`")
    x
    # Returns: \code{[character]}
}
