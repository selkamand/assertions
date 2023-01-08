#' Assert that the input object includes a specified name
#'
#' @param x An object to check for the presence of a name
#' @param names A character vector of names to check for in `x`
#' @param msg A character string containing the error message to display if any of the `names` are not present in `x`
#' @inheritParams assert_dataframe
#' @return invisible(TRUE) if all `names` are present in `x`, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' x <- list(a = 1, b = 2, c = 3)
#'
#' assert_includes_name(x, "a") # Passes
#' assert_includes_name(x, c("a", "b")) # Passes
#' assert_includes_name(x, c("a", "b", "d")) # Throws default error message
#'
#' assert_includes_name(x, c("a", "b", "d"), "Custom error message") # Throws custom error message
#' }
#'
#' @export
assert_names_include <- function(x, names, msg = NULL, call = rlang::caller_env()) {
  string_argname <- deparse(substitute(x))
  missing_names <- setdiff(names, names(x))
  if (length(missing_names) > 0) {
    if (is.null(msg)) {
      n_missing <- ifelse(length(missing_names) == length(names), yes = "all", no = length(missing_names))
      msg <- c("'{.strong {string_argname}}' is missing {length(missing_names)} required name{?s}: ", format_as_bullets(missing_names, bullet = "x"))
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}
