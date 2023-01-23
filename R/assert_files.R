
# Functions ---------------------------------------------------------------

all_files_exist <- function(x){
  all(file.exists(x))
}

has_permission <- function(filepaths, permission = c('write', 'execute', 'read')){
  permission_to_mode <- c('write'=2, 'execute'=1, 'read'=4)
  permission <- rlang::arg_match(permission)
  mode <- permission_to_mode[match(permission, names(permission_to_mode))]

  exit_code <- file.access(names = filepaths, mode)
  if (all(exit_code == 0)) return(TRUE)
  else return(FALSE)
}

is_dir <- function(filepaths){
   all(dir.exists(filepaths))
}
# Files ---------------------------------------------------------------
#' Assert a file exists
#'
#' Assert that all files exist
#'
#' @include assert_create.R
#' @include is_functions.R
#' @param x An object
#' @param msg A character string containing the error message if file `x` is does not exist
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if file `x` exists, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' assert_file_exists(system.file("package = assertions"))
#' assert_file_exists("foo") # Throws Error
#' }
#'
#' @concept assert_file
#' @export
assert_file_exists <- assert_create_chain(
  assert_character,
  assert_create(func = all_files_exist, default_error_msg = "Failed to find file{?s}: {.file {arg_value[!file.exists(arg_value)]}}")
  )

#' Assert all files are directories
#'
#' Assert that all files supllied are actually directories
#'
#' @include assert_create.R
#' @include is_functions.R
#' @param x An object
#' @param msg A character string containing the error message if file `x` is does not exist
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if `x` is exists and is a directory, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' assert_directory(system.file("package = assertions"))
#' assert_directory("foo") # Throws Error
#' }
#'
#' @concept assert_file
#' @export
assert_directory <- assert_create_chain(
  assert_create(func = all_files_exist, default_error_msg = "Failed to find director{?y/ies}: {.file {arg_value[!file.exists(arg_value)]}}"),
  assert_create(is_dir, default_error_msg = "{.strong {arg_value[!dir.exists(arg_value)]}} {?is a/are} file{?s} not a director{?y/ies}")
  )
