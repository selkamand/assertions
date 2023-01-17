#' Assert that the input object is greater than a specified minimum value
#'
#' @include assert_create.R
#' @include assert_type.R
#' @include is_functions.R
#' @include is_comparisons.R
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
assert_greater_than <- assert_create_chain(
  assert_numeric,
  assert_create(
    is_greater_than,
    default_error_msg = "{.strong {arg_name}} must {ifelse(length(arg_value) > 1, 'all ', '')}be {.strong greater than} `{.strong {minimum}}`."
    )
)

#' Assert that the input object is greater than or equal to a specified minimum value
#'
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
assert_greater_than_or_equal_to <- assert_create_chain(
  assert_numeric,
  assert_create(
    is_greater_than_or_equal_to,
    default_error_msg = "{.strong {arg_name}} must {ifelse(length(arg_value) > 1, 'all ', '')}be {.strong greater than or equal to} `{.strong {minimum}}`."
  )
)

#' Assert that the input object is identical to a specified value
#'
#' @param x An object to check
#' @param y The value to compare against
#' @param msg A character string containing the error message to display if `x` is not identical to the specified value
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if `x` is identical to the specified value, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' assert_identical(3, 3) # Passes
#' assert_identical(c(3, 3, 3), 3) # Throws error
#' assert_identical(2, 3) # Throws error
#' }
#' @export
assert_identical <- assert_create(is_identical, default_error_msg = "{.strong {arg_name}} must be identical to {.strong {deparse(substitute(y))}}")


#' Assert that the input objects are equal
#'
#' Is `x` equal to `y`. powered by the [all.equal()] function.
#'
#' @param x An object to check
#' @param y The value to compare against
#' @param msg A character string containing the error message to display if `x` is not equal to `y`
#' @inheritParams common_roxygen_params
#' @inheritParams is_equal
#' @return invisible(TRUE) if `x` is equal to the specified value, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' assert_equal(3, 3) # Passes
#' assert_equal(c(3, 3, 3), 3, ) # Fails
#' assert_equal(2, 3) # Throws error
#' }
#' @export
assert_equal <- assert_create(is_equal, default_error_msg = "{.strong {arg_name}} must be equal to {.strong {deparse(substitute(y))}}")
