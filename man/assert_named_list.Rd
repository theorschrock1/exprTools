% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assert_named_list.R
\name{assert_named_list}
\alias{assert_named_list}
\title{Assert list names and structure.}
\usage{
assert_named_list(x, structure, null.ok = FALSE, extra.items = FALSE)
}
\arguments{
\item{x}{\code{[object]} an object to check}

\item{structure}{\code{[list]}  Must be a named list.}

\item{null.ok}{\code{[logical]}  Must have an exact length of \code{1}.  Defaults to \code{FALSE}}

\item{extra.items}{\code{[logical]}  Must have an exact length of \code{1}.  Defaults to \code{FALSE}}
}
\value{
\code{assert_named_list}: invisible(x)
}
\description{
Assert list names and structure.
}
