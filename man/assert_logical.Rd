% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assert_type.R
\name{assert_logical}
\alias{assert_logical}
\title{Assert that the input object is logical}
\usage{
assert_logical(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
}
\arguments{
\item{x}{An object}

\item{msg}{A character string containing the error message to display if \code{x} is not logical}

\item{call}{Only relevant when pooling assert_ions into multi-assertion helper functions. See \link[cli]{cli_abort} for details.}

\item{arg_name}{Advanced use only. Name of the argument passed (default: NULL, will automatically extract arg_name).}
}
\value{
invisible(TRUE) if \code{x} is logical, otherwise aborts with the error message specified by \code{msg}
}
\description{
Assert that the input object is logical
}
\examples{
\dontrun{
assert_logical(TRUE) # Passes
assert_logical(c(TRUE, FALSE, TRUE)) # Passes
assert_logical(c("a", "b")) # Throws default error
assert_logical(1:3, "Custom error message") # Throws custom error
}



}
\concept{assert_type}
