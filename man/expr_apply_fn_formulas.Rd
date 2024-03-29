% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/expr_apply_fn_formulas.R
\name{expr_apply_fn_formulas}
\alias{expr_apply_fn_formulas}
\title{Apply a function formula in an expr.}
\usage{
expr_apply_fn_formulas(x)
}
\arguments{
\item{x}{[expr] an expr or formula expr}
}
\value{
\code{expr_apply_fn_formulas}: [expr]
}
\description{
Apply a function formula in an expr.
}
\examples{
 x = (.(sum ~ x + y + z, min ~ x + y + z))
 expr_apply_fn_formulas(x)
 x = sum ~ x + y + z
 expr_apply_fn_formulas(x)
}
