% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assert_compare.R
\name{assert_greater_than}
\alias{assert_greater_than}
\title{Assert that the input object is greater than a specified minimum value}
\usage{
assert_greater_than(
  x,
  minimum,
  all_must_satisfy = TRUE,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
}
\arguments{
\item{x}{An object to check}

\item{minimum}{The minimum value to compare against}

\item{all_must_satisfy}{A logical value indicating whether all elements of the vector must be greater than the minimum value or if only one element is sufficient.}

\item{msg}{A character string containing the error message to display if \code{x} is not greater than the specified minimum value}

\item{call}{Only relevant when pooling assert_ions into multi-assertion helper functions. See \link[cli]{cli_abort} for details.}

\item{arg_name}{Advanced use only. Name of the argument passed (default: NULL, will automatically extract arg_name).}
}
\value{
invisible(TRUE) if \code{x} is greater than the specified minimum value, otherwise aborts with the error message specified by \code{msg}
}
\description{
Assert that the input object is greater than a specified minimum value
}
\examples{
\dontrun{
assert_greater_than(3, 2) # Passes
assert_greater_than(3, 2, all_must_satisfy = TRUE) # Passes
assert_greater_than(c(2,3,4), 1) # Passes
assert_greater_than(c(2,3,4), 2) # Passes
assert_greater_than(c(2,3,4), 3, all_must_satisfy=FALSE) # Passes
assert_greater_than(c(2,3,1), 3) # Throws default error
assert_greater_than(c(2,3,1), 3, msg = "custom error message") # Throws custom error
}

}
\concept{assert_comparison}
