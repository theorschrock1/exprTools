#' Check if a string is in a valid date format.

#' @name check_date_format
#' @param x
#' @param format  \code{[choice]}  Possible values: \code{c('ymd_h', 'mdy_h', 'dmy_h', 'ymd_hm', 'mdy_hm', 'dmy_hm', 'ymd_hms',  'mdy_hms', 'dmy_hms', 'ym', 'my', 'yq', 'ymd', 'mdy', 'dmy')}.  Defaults to \code{'ymd'}
#' @param null.ok  \code{[logical]}  Must have an exact length of \code{1}.  Defaults to \code{TRUE}
#' @return \code{check_date_format}: \code{[TRUE|error_message]}
#' @examples

#'  check_date_format('2022-01-01', format = 'ymd')
#'  check_date_format('20-01-01', format = 'ymd')
#'  check_date_format('01/01/2022', format = 'ymd')
#'  check_date_format('01/30/2022', format = 'dmy')
#'  check_date_format('01/12/2022', format = 'dmy')
#'  check_date_format('01/12/2022 12:12:10', format = 'dmy')
#'  check_date_format('01/12/2022 12:12:10', format = 'dmy_hms')
#' @export
check_date_format <- function(x, format = "ymd", null.ok = TRUE) {
    # Check if a string is in a valid date format
    assert_choice(format, choices = c("ymd_h", "mdy_h", "dmy_h", "ymd_hm",
        "mdy_hm", "dmy_hm", "ymd_hms", "mdy_hms", "dmy_hms", "ym", "my",
        "yq", "ymd", "mdy", "dmy"))
    assert_logical(null.ok, len = 1)
    if (is.null(x) && null.ok == TRUE)
        return(TRUE)
    out <- do.call(format, list(x, quiet = T))
    if (is.na(out))
        return(glue("Must be in `{format}` date format"))
    return(TRUE)
    # Returns: \code{[TRUE|error_message]}
}
