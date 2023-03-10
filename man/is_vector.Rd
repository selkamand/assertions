% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_functions.R
\name{is_vector}
\alias{is_vector}
\title{Check if an object is a vector, optionally excluding lists}
\usage{
is_vector(x, include_lists = FALSE)
}
\arguments{
\item{x}{An object to check}

\item{include_lists}{A logical indicating whether lists should be considered vectors. Default is \code{FALSE}.}
}
\value{
A logical indicating whether \code{x} is a vector (optionally excluding lists)
}
\description{
This function checks if an object is a vector, with the option to exclude lists from being considered vectors.
}
\examples{
is_vector(1:10)
is_vector(list(1:10))
is_vector(list(1:10), include_lists = TRUE)

}
\concept{is_type}
