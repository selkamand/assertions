#' Assert that conditions are met
#'
#' @param ... a list of conditions to check
#' @param msg A character string containing the error message to display if any of the conditions are not met. The string can include the placeholder {failed_expressions} to insert a list of the failed expressions. The string can also include {?s} and {?is/are} to insert the correct pluralization for the list of failed expressions.
#' @inheritParams assert_dataframe
#'
#' @return invisible(TRUE) if all conditions are met, otherwise aborts with the error message specified by msg
#'
#' @examples
#' \dontrun{
#' assert(1 == 1) # Passes
#' assert(2 == 2, 3 == 3) # Passes
#' assert(2 == 1, 3 == 3) # Throws default error
#' assert(2 == 1, 3 == 3, msg = "Custom error message") # Throws custom error
#' }
#' @export
assert <- function(..., msg = NULL, call = rlang::caller_env()) {
  all_expressions_list <- eval(substitute(alist(...)))
  all_expressions_char <- sapply(all_expressions_list, FUN = deparse)

  conditions <- list(...)
  failed_expressions <- all_expressions_char[vapply(conditions, function(x) !isTRUE(x), logical(1))]

  if (length(failed_expressions) > 0) {
    if (is.null(msg)) {
      msg <- c("The following assertions failed:", format_as_bullets(format_inline(failed_expressions, 'code'), "x"))
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}

format_as_bullets <- function(x, bullet = c('*', '>', ' ', 'x', 'v', 'i', '!')){
  bullet <- rlang::arg_match(bullet)
  names(x) <- rep(bullet, times = length(x))
  return(x)
}

format_inline <- function(x, inline_tag = c('strong', 'emph', 'code', 'arg')){
  inline_tag <- rlang::arg_match(inline_tag)
  x <- paste0('{.', inline_tag, ' ', x, '}')
  return(x)
}
