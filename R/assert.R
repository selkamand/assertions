assert <- function(condition, msg = NULL, call = rlang::caller_env()) {
  if (!condition) {
    if (is.null(msg)) {
      msg <- "Error: Assertion failed!"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}
