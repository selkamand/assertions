
# Functions ---------------------------------------------------------------

all_files_exist <- function(x){
  all(file.exists(x))
}

#' Check file permissions
#'
#' Check if the specified filepaths have the specified permissions
#'
#' @param filepaths A character vector of file paths to check
#' @param permission A character string of permission to check for. One of c('write', 'execute', 'read')
#'
#' @return A logical value indicating whether all files have the specified permissions
#' @export
#'
#' @examples
#' \dontrun{
#' has_permission(c("file1.txt", "file2.txt"), permission = "rw")
#' }
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

get_file_extensions <- function(filenames) {
  filenames <- basename(filenames)

  vapply(filenames, function(x) {
    extension <- sub("^.*\\.", "", x)
    if (extension == x) extension <- ""
    extension
  }, character(1))
}

#' Title
#'
#' @param x object to test
#' @param extensions valid extensions (character vector). Do not include the '.', e.g. supply `extensions = 'txt'` not `extensions = '.txt'`
#' @param compression should compression extension ‘.gz’, ‘.bz2’ or ‘.xz’ be removed first?
#'
#' @return TRUE if all x have valid extensions as supplied by `extensions` (flag)
#' @export
#'
has_extension <- function(x, extensions, compression = FALSE){
  if(compression){
    x = sub(x = x,"\\.(gz|bz2|xz)$","")
  }

  observed_ext <- get_file_extensions(x)
  all(observed_ext %in% extensions)
}

files_missing_extension <- function(x, extensions, compression = FALSE){
  if(compression){
    x = sub(x = x,"\\.(gz|bz2|xz)$","")
  }

  observed_ext <- get_file_extensions(x)
  x[!observed_ext %in% extensions]
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

#' Assert file permissions
#'
#' Assert that all files supplied have the selected read/write/execute permissions
#'
#' @include assert_create.R
#' @include is_functions.R
#'
#' @param x An object
#' @param msg A character string containing the error message if file `x` does not have the specified permissions
#' @inheritParams common_roxygen_params
#' @inheritParams has_permission
#'
#' @return invisible(TRUE) if `x` exists and has the specified permissions, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' assert_file_permissions("file.txt", permissions = "read")
#' assert_file_permissions("file.txt", permissions = "write") # Throws Error
#' }
#'
#' @concept assert_file
#'
#' @export
assert_file_permissions <- assert_create_chain(
  assert_file_exists,
  assert_create(has_permission, default_error_msg = "File {.file {arg_value}} does not have permission {permission}")
)


#' Assert file extensions
#'
#' Assert that all files supplied have one of the selected extensions
#'
#' @include assert_create.R
#' @include is_functions.R
#'
#' @param x An object
#' @param msg A character string containing the error message if file `x` does not have the specified extensions
#' @inheritParams common_roxygen_params
#' @inheritParams has_extension
#'
#' @return invisible(TRUE) if `x` has any of the specified extensions, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' assert_file_extension("foo.txt", extensions = "txt") # Passes
#' assert_file_permissions("file.txt", extensions = "csv") # Throws Error
#' }
#'
#' @concept assert_file
#'
#' @export
assert_file_extension <- assert_create(
  has_extension, "{.strong {arg_name}} {?have/has} an invalid extension (required extension/s: {.strong {extensions}}).
  The following file{?s} ha{?s/ve} unexpected extensions:
  [{files_missing_extension(arg_value, extensions, compression)}]"
)
