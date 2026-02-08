# Functions ---------------------------------------------------------------

is_packages_installed <- function(x) {
  is_installed <- vapply(x, requireNamespace, FUN.VALUE = logical(1), quietly = TRUE)
  missing <- x[!is_installed]
  if (length(missing) == 0) {
    return(TRUE)
  }

  label <- cli::pluralize("{qty} package{?s}", qty = length(missing))
  label <- sub("^\\d+\\s+", "", label)
  paste0(
    "Missing the required ",
    label,
    ": ",
    paste0(missing, collapse = ", "),
    ". Please install and try again."
  )
}

#' Assert packages are installed
#'
#' Assert that one or more named packages are installed. Intended as a drop-in
#' replacement for `requireNamespace()` + `cli::cli_abort()` checks.
#'
#' @include assert_create.R
#' @include assert_type.R
#' @param x Package name(s) (character vector)
#' @param msg A character string containing the error message to display if the
#'   package is not installed
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if `x` is installed, otherwise aborts with the
#'   message specified by `msg`
#'
#' @examples
#' try({
#' assert_packages_installed("stats") # Passes
#' assert_packages_installed(c("stats", "utils")) # Passes
#' assert_packages_installed("notapackage123") # Throws Error
#' })
#'
#' @concept assert_package
#' @export
assert_packages_installed <- assert_create_chain(
  assert_character_vector_or_glue,
  assert_create(func = is_packages_installed)
)
