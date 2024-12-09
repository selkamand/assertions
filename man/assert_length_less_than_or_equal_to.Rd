% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assert_length.R
\name{assert_length_less_than_or_equal_to}
\alias{assert_length_less_than_or_equal_to}
\title{Assert Length Less Than or Equal To}
\usage{
assert_length_less_than_or_equal_to(
  x,
  length,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
}
\arguments{
\item{x}{object to check length of}

\item{length}{expected length (number)}

\item{msg}{custom error message}

\item{call}{(logical) whether to preserve call in error message}

\item{arg_name}{(character) name of argument being tested}
}
\value{
invisible(TRUE)
}
\description{
Assert object length is less than or equal to a threshold
}
