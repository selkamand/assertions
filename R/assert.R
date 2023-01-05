assert <- function(..., msg = NULL, call = rlang::caller_env()) {
  conditions <- list(...)
  failed_conditions <- conditions[vapply(conditions, function(x) !isTRUE(x), logical(1))]
  if (length(failed_conditions) > 0) {
    if (is.null(msg)) {
      msg <- paste("Error: Assertion failed for the following conditions:", paste(failed_conditions, collapse = ", "))
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}
