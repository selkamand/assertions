#' Assert that the input is NULL
#'
#' This function asserts that the input is NULL and aborts with an error message if it is not.
#'
#' @param x A value to check.
#' @param msg A character string containing the error message to display if `x` is not NULL.
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if `x` is NULL, otherwise aborts with the error message specified by `msg`.
#'
#' @examples
#' assert_null(NULL)  # Passes
#' assert_null(1)  # Throws default error
#' assert_null(1, msg = "Custom error message")  # Throws custom error
#' @export
assert_null <- assert_create(
  is.null,
  "'{.strong {arg_name}}' must be NULL!"
)

#' Assert that the input is not NULL
#'
#' This function asserts that the input is not NULL and aborts with an error message if it is.
#'
#' @param x A value to check.
#' @param msg A character string containing the error message to display if `x` is NULL.
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if `x` is not NULL, otherwise aborts with the error message specified by `msg`.
#'
#' @examples
#' assert_non_null(1)  # Passes
#' assert_non_null(NULL)  # Throws default error
#' assert_non_null(NULL, msg = "Custom error message")  # Throws custom error
#' @export
assert_non_null <- assert_create(
  function(x) !is.null(x),
  "'{.strong {arg_name}}' must not be NULL!"
)
