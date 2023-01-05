assert <- function(..., msg = NULL, call = rlang::caller_env()) {
  all_expressions_list <- eval(substitute(alist(...)))
  all_expressions_char <- sapply(all_expressions_list, FUN = deparse)

  conditions <- list(...)
  failed_expressions <- all_expressions_char[vapply(conditions, function(x) !isTRUE(x), logical(1))]

  if (length(failed_expressions) > 0) {
    if (is.null(msg)) {
      msg <- "Error: The following expression{?s} {?is/are} {.strong NOT TRUE}: [{failed_expressions}]"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}


