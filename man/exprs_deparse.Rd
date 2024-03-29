% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/exprs_deparse.R
\name{exprs_deparse}
\alias{exprs_deparse}
\title{Deparse a list of expressions.}
\usage{
exprs_deparse(x)
}
\arguments{
\item{x}{[exprs]}
}
\value{
\code{exprs_deparse}: [character]
}
\description{
Deparse a list of expressions.
}
\examples{
 x = exprs(lapply(x, function(x) x * x), glue('something {x}'))
 exprs_deparse(x)
}
