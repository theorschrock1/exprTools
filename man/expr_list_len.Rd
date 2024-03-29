% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expr_list_len.R
\name{expr_list_len}
\alias{expr_list_len}
\title{Length of an unevaluated list}
\usage{
expr_list_len(x)
}
\arguments{
\item{x}{an list call expr}
}
\value{
integer length of the expr list
}
\description{
Length of an unevaluated list
}
\examples{
x=expr(list(mpg=4+1, cyl=4, am="g", vs="f"))
expr_list_len(x)
x=expr(list())
expr_list_len(x)
}
