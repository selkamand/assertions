# Functions ---------------------------------------------------------------

all_files_exist <- function(x){
  all(file.exists(x))
}

#' Check file permissions
#'
#' Check if the specified filepaths have the specified permissions
#'
#' @param x A character vector of file paths to check
#' @param permission A character string of permission to check for. One of c('write', 'execute', 'read')
#'
#' @return A logical value indicating whether all files have the specified permissions
#' @export
#'
#' @examples
#' try({
#' has_permission(c("file1.txt", "file2.txt"), permission = "rw")
#' })
has_permission <- function(x, permission = c('write', 'execute', 'read')){
  permission_to_mode <- c('write'=2, 'execute'=1, 'read'=4)
  permission <- rlang::arg_match(permission)
  mode <- permission_to_mode[match(permission, names(permission_to_mode))]

  exit_code <- file.access(names = x, mode)
  if (all(exit_code == 0)) return(TRUE)
  else return(FALSE)
}

has_permission_vec <- function(x, permission = c('write', 'execute', 'read')){
  permission_to_mode <- c('write'=2, 'execute'=1, 'read'=4)
  permission <- rlang::arg_match(permission)
  mode <- permission_to_mode[match(permission, names(permission_to_mode))]

  exit_code <- file.access(names = x, mode)
  return(exit_code == 0)
}

is_dir <- function(x){
  all(dir.exists(x))
}

is_file <- function(x){
  all(file.exists(x) & !dir.exists(x))
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

#' Assert that all files exist
#'
#' Assert all files in vector exist. To assert a single file exists, see [assert_file_exists()]
#'
#' @include assert_create.R
#' @include is_functions.R
#' @param x Paths to files (character)
#' @param msg A character string containing the error message if any files in `x` is does not exist
#' @inheritParams common_roxygen_params
#' @inheritParams assert_character_vector
#' @return invisible(TRUE) if file `x` exists, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' real_file <- system.file("DESCRIPTION", package = "assertions")
#'
#' try({
#' assert_all_files_exist(c(real_file, real_file))
#' assert_all_files_exist(c("foo", "bar")) # Throws Error
#' })
#'
#' @concept assert_file
#' @export
assert_all_files_exist <- assert_create_chain(
  assert_character_vector,
  assert_create(func = all_files_exist, default_error_msg = "Failed to find file{?s}: {.file {arg_value[!file.exists(arg_value)]}}"),
  assert_create(func = is_file, default_error_msg = "{x[dir.exists(x)]} {?is a/are} {.strong director{?y/ies}}, not {?a/} {.strong file{?s}}")
)


#' Assert a file exists
#'
#' Assert that a file exists.
#' To assert all files in a vector exist, see [assert_all_files_exist()]
#'
#' @include assert_create.R
#' @include is_functions.R
#' @param x Path to a file (string)
#' @param msg A character string containing the error message if file `x` is does not exist
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if file `x` exists, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' real_file <- system.file("DESCRIPTION", package = "assertions")
#'
#' try({
#' assert_file_exists(real_file) # PASSES
#' assert_file_exists("foo") # Throws Error
#' assert_file_exists(c(real_file, real_file)) # Throws Error (should use assert_all_files_exist)
#'
#' })
#'
#' @concept assert_file
#' @export
assert_file_exists <- assert_create_chain(
  assert_string,
  assert_all_files_exist
)



#' Assert all files are directories
#'
#' Assert that all paths supplied exist and are directories.
#' To assert a single directory exists, see [assert_directory_exists()]
#'
#'
#' @include assert_create.R
#' @include is_functions.R
#' @param x Paths to directories (character)
#' @param msg A character string containing the error message if file `x` is does not exist
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if `x` is exists and is a directory, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' try({
#' assert_directory(system.file("package = assertions")) # PASSES
#' assert_directory("foo") # Throws Error
#' })
#'
#' @concept assert_file
#' @export
assert_all_directories_exist <- assert_create_chain(
  assert_character,
  assert_create(func = all_files_exist, default_error_msg = "Failed to find director{?y/ies}: {.file {arg_value[!file.exists(arg_value)]}}"),
  assert_create(is_dir, default_error_msg = "{.strong {arg_value[!dir.exists(arg_value)]}} {?is a/are} {.strong file{?s}}, not{? a/} {.strong director{?y/ies}}")
)

#' Assert are directory exists
#'
#' Assert a directory exists.
#' To assert all directories in a vector exist, see [assert_all_directories_exist()]
#'
#' @include assert_create.R
#' @include is_functions.R
#' @param x Path to a directory (string)
#' @param msg A character string containing the error message if file `x` is does not exist
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if `x` is exists and is a directory, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' try({
#' assert_directory_exists(system.file("package = assertions")) # PASS
#' assert_all_directories_exist("foo") # Throws Error
#' })
#'
#' @concept assert_file
#' @export
assert_directory_exists <- assert_create_chain(
  assert_string,
  assert_all_directories_exist
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
#' try({
#' assert_file_permissions("file.txt", permissions = "read")
#' assert_file_permissions("file.txt", permissions = "write") # Throws Error
#' })
#'
#' @concept assert_file
#'
#' @export
assert_file_permissions <- assert_create_chain(
  assert_file_exists,
  assert_create(has_permission, default_error_msg = "{cli::qty(arg_value[!has_permission_vec(arg_value, permission=permission)])}File{?s} {.file {arg_value[!has_permission_vec(arg_value, permission=permission)]}} do{?es/} not have permission: {.strong {permission}}")
)


#' Assert file extensions
#'
#' Assert that all filepaths supplied have one of the selected extensions. Does not require file to actually exist.
#'
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
#' try({
#' assert_all_files_have_extension(c("foo.txt", "bar.txt"), extensions = "txt") # Passes
#' assert_all_files_have_extension(c("foo.txt", "bar.csv"), extensions = "csv") # Throws Error
#' })
#'
#' @concept assert_file
#'
#' @export
assert_all_files_have_extension <- assert_create_chain(
  assert_character,
  assert_create(has_extension, "'{.strong {arg_name}}' {cli::qty(files_missing_extension(arg_value, extensions, compression))}{?has/have} an invalid extension (required extension/s: {.strong {extensions}}).
  The following {cli::qty(files_missing_extension(arg_value, extensions, compression))} file{?s} ha{?s an/ve} unexpected extension{?s}:
  [{files_missing_extension(arg_value, extensions, compression)}]"
  )
)

#' Assert file extensions
#'
#' Assert that a filepath includes one of the selected extensions. Does not require file to actually exist.
#'
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
#' try({
#' assert_file_has_extension("foo.txt", extensions = "txt") # Passes
#' assert_file_has_extension("file.txt", extensions = "csv") # Throws Error
#' })
#'
#' @concept assert_file
#'
#' @export
assert_file_has_extension <- assert_create_chain(
  assert_string,
  assert_all_files_have_extension
)
