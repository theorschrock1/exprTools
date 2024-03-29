% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expr_find_undefined.R
\name{expr_find_undefined}
\alias{expr_find_undefined}
\title{Find undefined variables in R code.}
\usage{
expr_find_undefined(x, init_vars)
}
\arguments{
\item{x}{\code{[expr]}}

\item{init_vars}{\code{[character]}  NULL is ok.}
}
\value{
\code{expr_find_undefined}: \code{[character]} a character vector of undefined variables
}
\description{
Find undefined variables in R code.
}
\examples{
 x = expr({
 x = y * 2
 if (x == 1) {
 out = 1
 }
 else if (x >= 1) {
 1
 }
 else {
 NULL
 }
 out + 1
 })
 expr_find_undefined(x, init_vars = 'y')
 expr_find_undefined(x, init_vars = NULL)
 x = expr({
 x = y * x
 x
 })
 expr_find_undefined(x, init_vars = NULL)
 expr_find_undefined(x, init_vars = 'x')
 expr_find_undefined(x, init_vars = 'y')
 expr_find_undefined(x, init_vars = c('y', 'x'))
 x = expr({
 x = y * x
 c
 })
 expr_find_undefined(x, init_vars = c('y', 'x'))
 expr_find_undefined(x, init_vars = c('y', 'x', 'c'))
 expr_find_undefined(x=expr(c), init_vars = c('y', 'x', 'c'))
 expr_find_undefined(x=expr(a), init_vars = c('y', 'x', 'c'))
}
