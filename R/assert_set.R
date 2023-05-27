#' Check if a vector is a subset of another
#'
#' This function checks that `x` is a subset of `y`
#'
#' @param x A vector to check
#' @param y the acceptible values that x can take
#' @inheritParams common_roxygen_params
#'
#' @return Returns invisible(TRUE) if `x` is a subset of `y`, otherwise throws an error
#' @examples
#' try({
#' assert_subset(1:3, 1:5) # Passes
#' assert_subset(c("A", "B", "C"), c("A", "B")) # Throws error since "C" is not present in first vector
#' })
#' @export
assert_subset <- assert_create(
  func = is_subset,
  default_error_msg = c(
    x = "'{.strong {arg_name}}' {cli::qty(length(setopts_exlusive_to_first(arg_value, y)))} contain{?s} {?an/} invalid value{?s}: {.strong {setopts_exlusive_to_first(arg_value, y)}}. Valid values include: {unique(y)}"
  )
)
