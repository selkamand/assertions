# For assert_number see assert_type. All other numerical assertions are here

#' Assert that the input object is a whole number
#'
#' Check if `x` is a whole number (no decimal)
#'
#' @param x An object
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if `x` is a whole number, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' try({
#' assert_whole_number(24) # Passes
#' assert_whole_number(2.5) # Throws error
#' })
#'
#' @concept assert_numerical
#' @export
assert_whole_number <- assert_create_chain(
  assert_number,
  assert_create(
    func = is_whole_number,
    default_error_msg = "'{.strong {arg_name}}' is not a {.strong whole} number")
)


#' Assert that all values are finite
#'
#' Check that all values in `x` are finite (not `NA`, `NaN`, `Inf`, or `-Inf`).
#'
#' @param x An object
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if all values in `x` are finite, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' try({
#' assert_all_finite(c(1, 2, 3)) # Passes
#' assert_all_finite(c(1, Inf)) # Throws error
#' })
#'
#' @concept assert_numerical
#' @export
assert_all_finite <- assert_create_chain(
  assert_numeric,
  assert_create(
    func = is_all_finite,
    default_error_msg = "{.strong {arg_name}} must {ifelse(length(arg_value) > 1, 'all ', '')}be {.strong finite}."
  )
)


#' Assert that a value is finite
#'
#' Check that a single numeric value is finite (not `NA`, `NaN`, `Inf`, or `-Inf`).
#' For vectorized version see [assert_all_finite()].
#'
#' @param x An object
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if `x` is finite, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' try({
#' assert_finite(1) # Passes
#' assert_finite(Inf) # Throws error
#' })
#'
#' @concept assert_numerical
#' @export
assert_finite <- assert_create_chain(
  assert_number,
  assert_all_finite
)
