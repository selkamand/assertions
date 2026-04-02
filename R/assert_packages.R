# Functions ---------------------------------------------------------------

is_packages_installed <- function(x) {
  is_installed <- vapply(x, requireNamespace, FUN.VALUE = logical(1), quietly = TRUE)
  missing <- x[!is_installed]
  if (length(missing) == 0) {
    return(TRUE)
  }

  cli::pluralize(
    "Missing the required package{?s}: {missing}. Please install and try again."
  )
}

#' Assert packages are installed
#'
#' Assert that one or more packages are installed.
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


is_programs_in_path <- function(x) {
  program_paths <- Sys.which(x)
  missing <- names(program_paths)[program_paths == ""]

  if (length(missing) == 0) {
    return(TRUE)
  }

  cli::pluralize(
    "Could not find executable{?s} in PATH: {missing}. Please ensure {?it is/they are} installed and available on PATH."
  )
}

#' Assert programs are in PATH
#'
#' Assert that one or more executable programs are available on the system PATH.
#'
#' @include assert_create.R
#' @include assert_type.R
#' @param x Program name(s) (character vector)
#' @param msg A character string containing the error message to display if one
#'   or more programs are missing from PATH
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if all programs in `x` are available in PATH,
#'   otherwise aborts with the message specified by `msg`
#'
#' @examples
#' rscript <- if (.Platform$OS.type == "windows") "Rscript.exe" else "Rscript"
#'
#' try({
#'   assert_all_programs_exist_in_path(rscript) # Passes
#'   assert_all_programs_exist_in_path(c(rscript, "this_program_should_not_exist_123"))
#' })
#'
#' @export
assert_all_programs_exist_in_path <- assert_create_chain(
  assert_character_vector_or_glue,
  assert_create(func = is_programs_in_path)
)

#' Assert program is in PATH
#'
#' Assert that a single executable program is available on the system PATH.
#' To assert multiple programs, use [assert_all_programs_exist_in_path()].
#'
#' @include assert_create.R
#' @include assert_type.R
#' @param x Program name (string)
#' @param msg A character string containing the error message to display if the
#'   program is missing from PATH
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if `x` is available in PATH, otherwise aborts with
#'   the message specified by `msg`
#'
#' @examples
#' rscript <- if (.Platform$OS.type == "windows") "Rscript.exe" else "Rscript"
#'
#' try({
#'   assert_program_exists_in_path(rscript) # Passes
#'   assert_program_exists_in_path("this_program_should_not_exist_123")
#' })
#'
#' @export
assert_program_exists_in_path <- assert_create_chain(
  assert_string,
  assert_all_programs_exist_in_path
)
