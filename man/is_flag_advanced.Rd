% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/is_functions.R
\name{is_flag_advanced}
\alias{is_flag_advanced}
\title{Check if x is a flag}
\usage{
is_flag_advanced(x)
}
\arguments{
\item{x}{A value to be checked}
}
\value{
Returns invisible(TRUE) if x is a logical value with length 1. Returns a string
with an error message if x is not a logical value or has a length other than 1.
}
\description{
This function is designed for use with \code{assert_create_advanced}. It must return
TRUE for the assertion to pass or a string representing the error message if the
assertion should fail.
}
\concept{advanced}
