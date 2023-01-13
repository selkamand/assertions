#' Assert that the input object is greater than a specified minimum value
#'
#' @include assert_create.R
#' @include is_functions.R
#' @param x An object to check
#' @param minimum The minimum value to compare against
#' @param all_must_satisfy A logical value indicating whether all elements of the vector must be greater than the minimum value or if only one element is sufficient.
#' @param msg A character string containing the error message to display if `x` is not greater than the specified minimum value
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if `x` is greater than the specified minimum value, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' assert_greater_than(3, 2) # Passes
#' assert_greater_than(3, 2, all_must_satisfy = TRUE) # Passes
#' assert_greater_than(c(2,3,4), 1) # Passes
#' assert_greater_than(c(2,3,4), 2) # Passes
#' assert_greater_than(c(2,3,4), 3, all_must_satisfy=FALSE) # Passes
#' assert_greater_than(c(2,3,1), 3) # Throws default error
#' assert_greater_than(c(2,3,1), 3, msg = "custom error message") # Throws custom error
#' }
#'
#' @concept assert_comparison
#' @export
assert_greater_than <-
  assert_create_chain(
    assert_numeric,
    assert_create(
      is_greater_than,
      default_error_msg = "{.strong {arg_name}} must {ifelse(length(arg_value) > 1, 'all ', '')}be {.strong greater than} `{.strong {minimum}}`."
      )
)

#' Assert that the input object is greater than or equal to a specified minimum value
#'
#' @include assert_create.R
#' @include is_functions.R
#' @param x An object to check
#' @param minimum The minimum value to compare against
#' @param all_must_satisfy A logical value indicating whether all elements of the vector must be greater than or equal to the minimum value or if only one element is sufficient.
#' @param msg A character string containing the error message to display if `x` is not greater than or equal to the specified minimum value
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if `x` is greater than or equal to the specified minimum value, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' assert_greater_than_or_equal_to(3, 2) # Passes
#' assert_greater_than_or_equal_to(c(3, 4, 5), 2, all_must_satisfy = TRUE) # Passes
#' assert_greater_than_or_equal_to(2, 3) # Throws error
#' }
#' @export
assert_greater_than_or_equal_to <-
  assert_create_chain(
    assert_numeric,
    assert_create(
      is_greater_than_or_equal_to,
      default_error_msg = "{.strong {arg_name}} must {ifelse(length(arg_value) > 1, 'all ', '')}be {.strong greater than or equal to} `{.strong {minimum}}`."
    )
  )
