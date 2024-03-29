% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expr_from_json.R
\name{expr_from_json}
\alias{expr_from_json}
\title{Parse an R expression from a JSON string.}
\usage{
expr_from_json(x)
}
\arguments{
\item{x}{\code{[json]}}
}
\value{
\code{expr_from_json}: \code{[expr]}
}
\description{
Parse an R expression from a JSON string.
}
\examples{
 expr_from_json(expr_to_json(toJSON(out, null = 'null', auto_unbox = T)))
 expr_from_json(expr_to_json(check_named_list(structure = list(type = string('langauge'),
 attributes = list(), value = char(null.ok = T)))))
}
