% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expr_replace_names.R
\name{expr_replace_names}
\alias{expr_replace_names}
\title{Find and replace names in an r expression.}
\usage{
expr_replace_names(x, find, replace, calls.only = FALSE, vars.only = FALSE)
}
\arguments{
\item{x}{\code{[expr]}}

\item{find}{\code{[string]}}

\item{replace}{\code{[string]}}

\item{calls.only}{\code{[logical]}  Must have an exact length of \code{1}.  Defaults to \code{FALSE}}

\item{vars.only}{\code{[logical]}  Must have an exact length of \code{1}.  Defaults to \code{FALSE}}
}
\value{
\code{expr_replace_names}: [expr]
}
\description{
Find and replace names in an r expression.
}
\examples{
 x = expr(data[, .(sum(x), sum(x), sum(x), na.rm = TRUE)])
 expr_replace_names(x, find = 'sum', replace = 'max')
 expr_replace_names(x, find = 'sum', replace = 'max', vars.only = TRUE)
 x = expr(data[, .(x(x), sum(x), sum(x), na.rm = TRUE)])
 expr_replace_names(x, find = 'x', replace = 'x_new')
 expr_replace_names(x, find = 'x', replace = 'x_new', calls.only = TRUE)
 x = expr({
 fn
 x <- fn(x)
 y <- lapply(x, function(x) fn(x) - 1)
 f2 <- function(x) {
 -fn(x)
 }
 if (fn()) {
 y
 }
 else {
 x
 }
 })
 expr_replace_names(x, 'fn', 'new_fn')
 expr_replace_names(x, 'fn', 'new_fn', vars.only = TRUE)
 expr_replace_names(x, 'fn', 'new_fn', calls.only = TRUE)
}
