#' Check if strings contain a regex pattern
#'
#' This helper checks whether all elements of a character vector match a regex pattern.
#'
#' @param x A character vector to check
#' @param pattern A regular expression pattern (string)
#' @param ignore.case,perl,fixed,useBytes Logical flags passed to [grepl()]
#'
#' @return TRUE if all strings in `x` match `pattern`, otherwise FALSE or a string error message.
#'
#' @concept assert_regex
contains_pattern <- function(x, pattern, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE) {
  if (!is_string(pattern))
    return("'pattern' must be a string (length 1 character vector)")
  if (!is_flag(ignore.case))
    return("'ignore.case' must be a logical flag")
  if (!is_flag(perl))
    return("'perl' must be a logical flag")
  if (!is_flag(fixed))
    return("'fixed' must be a logical flag")
  if (!is_flag(useBytes))
    return("'useBytes' must be a logical flag")

  matches <- grepl(pattern, x, ignore.case = ignore.case, perl = perl, fixed = fixed, useBytes = useBytes)

  if (all(matches))
    return(TRUE)

  total <- length(x)
  failed <- sum(!matches)

  if (total == 1) {
    return("'{.strong {arg_name}}' must match regex `{pattern}`")
  }

  paste0(
    "'{.strong {arg_name}}' must all match regex `{pattern}`. ",
    failed,
    "/",
    total,
    " elements did not match pattern"
  )
}

#' Assert all strings contain a regex pattern
#'
#' Assert all elements of a character vector match a regex pattern.
#'
#' @include assert_create.R
#' @include assert_type.R
#' @include has.R
#' @include is_functions.R
#' @param x An object to check
#' @param pattern A regular expression pattern (string)
#' @param ignore.case,perl,fixed,useBytes Logical flags passed to [grepl()]
#' @param msg A character string containing the error message to display if `x` does not match `pattern`
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if `x` matches `pattern`, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' try({
#' assert_all_strings_contain(c("abc", "a1"), "^a") # Passes
#' assert_all_strings_contain(c("abc", "b1"), "^a") # Throws default error
#' assert_all_strings_contain(c("abc", "b1"), "^a", msg = "Custom error message") # Throws custom error
#' })
#'
#' @concept assert_regex
#' @export
assert_all_strings_contain <- assert_create_chain(
  assert_character_vector,
  assert_no_missing,
  assert_create(
    func = contains_pattern
  )
)

#' Assert string contains a regex pattern
#'
#' Assert a string matches a regex pattern.
#'
#' @include assert_create.R
#' @include assert_type.R
#' @include has.R
#' @include is_functions.R
#' @param x An object to check
#' @param pattern A regular expression pattern (string)
#' @param ignore.case,perl,fixed,useBytes Logical flags passed to [grepl()]
#' @param msg A character string containing the error message to display if `x` does not match `pattern`
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if `x` matches `pattern`, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' try({
#' assert_string_contains("abc", "^a") # Passes
#' assert_string_contains("abc", "^b") # Throws default error
#' assert_string_contains("abc", "^b", msg = "Custom error message") # Throws custom error
#' })
#'
#' @concept assert_regex
#' @export
assert_string_contains <- assert_create_chain(
  assert_string,
  assert_all_strings_contain
)
