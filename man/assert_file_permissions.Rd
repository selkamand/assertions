% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/assert_files.R
\name{assert_file_permissions}
\alias{assert_file_permissions}
\title{Assert file permissions}
\usage{
assert_file_permissions(
  x,
  permission = c("write", "execute", "read"),
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
}
\arguments{
\item{x}{An object}

\item{permission}{A character string of permission to check for. One of c('write', 'execute', 'read')}

\item{msg}{A character string containing the error message if file \code{x} does not have the specified permissions}

\item{call}{Only relevant when pooling assert_ions into multi-assertion helper functions. See \link[cli]{cli_abort} for details.}

\item{arg_name}{Advanced use only. Name of the argument passed (default: NULL, will automatically extract arg_name).}
}
\value{
invisible(TRUE) if \code{x} exists and has the specified permissions, otherwise aborts with the error message specified by \code{msg}
}
\description{
Assert that all files supplied have the selected read/write/execute permissions
}
\examples{
\dontrun{
assert_file_permissions("file.txt", permissions = "read")
assert_file_permissions("file.txt", permissions = "write") # Throws Error
}

}
\concept{assert_file}
