
# Dataframe ---------------------------------------------------------------
#' Assert that the input object is a data frame
#'
#' @param x An object
#' @param msg A character string containing the error message to display if `x` is not a data frame
#' @param call Only relevant when pooling assert_ions into multi-assertion helper functions. See \link[cli]{cli_abort} for details.
#' @return invisible(TRUE) if `x` is a data frame, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' assert_dataframe(mtcars) # Passes
#' assert_dataframe(data.frame()) # Passes
#'
#' assert_dataframe(1:10) # Throws default error
#' assert_dataframe(matrix(1:6, 2, 3)) # Throws default error
#' assert_dataframe(c(1, 2, 3)) # Throws default error: "Error
#' assert_dataframe(list(a = 1, b = 2)) # Throws default error
#' assert_dataframe(factor(c(1, 2, 3))) # Throws default error
#'
#' assert_dataframe(1:10, msg = "Custom error message") # Throws custom error
#' }
#' @export
assert_dataframe <- function(x, msg = NULL, call = rlang::caller_env()) {
  string_argname <- deparse(substitute(x))
  if (!is.data.frame(x)) {
    if (is.null(msg)) {
      #"'{.strong {string_argname}}' must be a data.frame, not a {class(x)}"
      msg <- "'{.strong {string_argname}}' must be a {.strong data.frame}, not a {.strong {class(x)}}"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}



# Matrix ------------------------------------------------------------------


#' Assert that the input object is a matrix
#'
#' @param x An object
#' @param msg A character string containing the error message to display if `x` is not a matrix
#' @inheritParams assert_dataframe
#'
#' @return invisible(TRUE) if `x` is a matrix, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' assert_matrix(matrix(1:9, 3)) # Passes
#' assert_matrix(matrix(1:9, 3, 3)) # Passes
#' assert_matrix(c(1, 2, 3)) # Throws default error
#' assert_matrix(1:10, "Custom error message") # Throws custom error
#' }
#' @export
assert_matrix <- function(x, msg = NULL, call = rlang::caller_env()) {
  string_argname <- deparse(substitute(x))
  if (!is.matrix(x)) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' must be a matrix, not a {class(x)}"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}



# Vector ------------------------------------------------------------------
#' Assert that the input object is a vector
#'
#' @param x An object
#' @param msg A character string containing the error message to display if `x` is not a vector
#' @param include_lists A logical indicating whether lists must be considered vectors (default: FALSE)
#' @inheritParams assert_dataframe
#'
#' @return invisible(TRUE) if `x` is a vector, otherwise aborts with the error message specified by `msg`
#'
#' @note
#' By default, lists are not considered vectors (i.e. `include_lists = FALSE`) to align with what end-users will expect, in spite of these objects technically being vectors.
#'
#' @examples
#' \dontrun{
#' assert_vector(c(1, 2, 3)) # Passes
#' assert_vector(matrix(1:6, 2, 3)) # Throws default error message
#' assert_vector(1:3) # Passes
#'
#' assert_vector(list(1, 2, 3)) # Throws default error message
#' assert_vector(list(1, 2, 3), include_lists = TRUE) # Passes
#'
#' assert_vector(c("a", 1, "b"), "Custom error message") # Throws custom error message
#' assert_vector(factor(c(1, 2, 3)), "Custom error message") # Throws custom error message
#' }
#'
#' @export
assert_vector <- function(x, msg = NULL, include_lists = FALSE, call = rlang::caller_env()) {
  string_argname <- deparse(substitute(x))
  if (!is.vector(x) || (inherits(x, what = "list") && !include_lists)) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' must be a vector, not a {class(x)}"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}



# Numerics ----------------------------------------------------------------

#' Assert that the input object is a factor
#'
#' @param x An object
#' @param msg A character string containing the error message to display if `x` is not a factor
#' @inheritParams assert_dataframe
#'
#' @return invisible(TRUE) if `x` is a factor, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' assert_factor(factor(c("a", "b", "c"))) # Passes
#' assert_factor(c("a", "b", "c")) # Throws default error
#' assert_factor(factor(c("a", "b", "c")), "Custom error message") # Passes
#' assert_factor(1:3, "Custom error message") # Throws custom error
#' }
#'
#' @export
assert_factor <- function(x, msg = NULL, call = rlang::caller_env()) {
  string_argname <- deparse(substitute(x))
  if (!is.factor(x)) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' must be a factor, not a {class(x)}"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}

#' Assert that the input object is numeric
#'
#' @param x An object
#' @param msg A character string containing the error message to display if `x` is not numeric
#' @inheritParams assert_dataframe
#' @return invisible(TRUE) if `x` is numeric, otherwise aborts with the error message specified by `msg`
#'
#'
#' @examples
#' \dontrun{
#' assert_numeric(1:3) # Passes
#' assert_numeric(1.5:5.5) # Passes
#' assert_numeric(c("a", "b", "c")) # Throws default error
#' assert_numeric(c("a", 1, "b"), "Custom error message") # Throws custom error
#' }
#'
#' @export
assert_numeric <- function(x, msg = NULL, call = rlang::caller_env()) {
  string_argname = deparse(substitute(x))
  if (!is.numeric(x)) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' is not numeric! Object class: {class(x)}"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}

#' Assert that the input object is a numeric vector
#'
#' @param x An object
#' @param msg A character string containing the error message to display if `x` is not a numeric vector
#' @inheritParams assert_dataframe
#' @return invisible(TRUE) if `x` is a numeric vector, otherwise aborts with the error message specified by `msg`
#'
#'
#' @export
assert_numeric_vector <- function(x, msg = NULL, call = rlang::caller_env()) {
  string_argname <- deparse(substitute(x))
  if (!is.numeric(x) || !is.vector(x)) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' must be a numeric vector, not a {class(x)}"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}



#' Assert that the input object is a number
#'
#' A number is a length 1 numeric vector.
#' Numbers can be either integers or doubles.
#'
#' @param x An object
#' @param msg A character string containing the error message to display if x is not a number
#' @inheritParams assert_dataframe
#'
#' @return invisible(TRUE) if x is a number, otherwise aborts with the error message specified by msg
#'
#' @examples
#' \dontrun{
#' assert_number(2) # Passes
#' assert_number(c(2, 3)) # Throws default error
#' assert_number("a") # Throws default error
#' assert_number(c("a", 1, "b"), "Custom error message") # Throws custom error
#' }
#' @export
assert_number <- function(x, msg = NULL, call = rlang::caller_env()) {
  string_argname <- deparse(substitute(x))
  if (!is.numeric(x)) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' is not a number (Object class: {class(x)})"
    }
    cli::cli_abort(msg, call = call)
  } else if (length(x) != 1) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' is not a number (length is {length(x)}, not 1!)"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}

#' Assert that the input object is an integer
#'
#' @param x An object
#' @param msg A character string containing the error message to display if `x` is not an integer
#' @inheritParams assert_dataframe
#'
#' @return invisible(TRUE) if `x` is an integer, otherwise aborts with the error message specified by `msg`
#'
#' @note
#' In R, integers are whole numbers.
#' Both integers and doubles (numbers with decimals) are considered numeric.
#' This function checks that `x` specifically belong to the integer class.
#'
#' @examples
#' \dontrun{
#' assert_int(1) # Passes
#' assert_int(1:10) # Passes
#' assert_int(c(1, 2, 3)) # Passes
#' assert_int("a") # Throws default error
#' assert_int(1.5, msg = "Custom error message") # Throws custom error
#' }
#' @export
assert_int <- function(x, msg = NULL, call = rlang::caller_env()) {
  string_argname <- deparse(substitute(x))
  if (!is.integer(x)) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' is not an integer! Object class: {class(x)}"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}


# Logicals ----------------------------------------------------------------

#' Assert that the input object is logical
#'
#' @param x An object
#' @param msg A character string containing the error message to display if `x` is not logical
#' @inheritParams assert_dataframe
#'
#' @return invisible(TRUE) if `x` is logical, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' assert_logical(TRUE) # Passes
#' assert_logical(c(TRUE, FALSE, TRUE)) # Passes
#' assert_logical(c("a", "b")) # Throws default error
#' assert_logical(1:3, "Custom error message") # Throws custom error
#' }
#'
#' @export
assert_logical <- function(x, msg = NULL, call = rlang::caller_env()) {
  string_argname <- deparse(substitute(x))
  if (!is.logical(x)) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' is not logical! Object class: {class(x)}"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}


#' Assert that the input object is an atomic logical vector
#'
#' @param x An object
#' @param msg A character string containing the error message to display if x is not an atomic logical vector
#' @inheritParams assert_dataframe
#'
#' @return invisible(TRUE) if x is an atomic logical vector, otherwise aborts with the error message specified by msg
#'
#' @examples
#' \dontrun{
#' assert_logical_vector(c(TRUE, TRUE, TRUE)) # Passes
#' assert_logical_vector("a") # Throws default error
#' assert_logical_vector(c(1, 0, 1), "Custom error message") # Throws custom error
#' }
#' @export
assert_logical_vector <- function(x, msg = NULL, call = rlang::caller_env()) {
  string_argname <- deparse(substitute(x))
  if (!is.logical(x) || !is.vector(x)) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' must be a logical vector, not a {class(x)}"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}

#' Assert that the input object is a scalar logical
#'
#' Assert that the input object is a flag (a logical of length 1: `TRUE` or `FALSE`)
#'
#' @param x An object
#' @param msg A character string containing the error message to display if `x` is not a scalar logical
#' @inheritParams assert_dataframe
#' @return invisible(TRUE) if `x` is a scalar logical, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' assert_flag(TRUE) # Passes
#' assert_flag(FALSE) # Passes
#' assert_flag(c(TRUE, FALSE)) # Throws default error
#' assert_flag(1, "Custom error message") # Throws custom error
#' }
#'
#' @export
assert_flag <- function(x, msg = NULL, call = rlang::caller_env()) {
  string_argname <- deparse(substitute(x))
  if (!is.logical(x)) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' is not a flag (Object class: {class(x)})"
    }
    cli::cli_abort(msg, call = call)
  } else if (length(x) != 1) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' is not a flag (length is {length(x)}, not 1!)"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}



# Characters --------------------------------------------------------------

#' Assert that the input object is a character vector
#'
#' @param x An object
#' @param msg A character string containing the error message to display if `x` is not a character vector
#' @inheritParams assert_dataframe
#'
#' @return invisible(TRUE) if `x` is a character vector, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' assert_character("a") # Passes
#' assert_character(c("a", "b", "c")) # Passes
#' assert_character(1:3) # Throws default error
#' assert_character(c("a", 1, "b"), "Custom error message") # Throws custom error
#' }
#'
#' @export
assert_character <- function(x, msg = NULL, call = rlang::caller_env()) {
  string_argname <- deparse(substitute(x))
  if (!is.character(x)) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' must be a character vector, not a {class(x)}"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}

#' Assert that the input object is a character vector
#'
#' @param x An object
#' @param msg A character string containing the error message to display if `x` is not a character vector
#' @inheritParams assert_dataframe
#' @return invisible(TRUE) if `x` is a character vector, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' assert_character_vector(c("a", "b", "c")) # Passes
#' assert_character_vector(c("a", 1, "b")) # Throws default error
#' assert_character_vector(c("a", 1, "b"), "Custom error message") # Throws custom error
#' }
#'
#' @export
assert_character_vector <- function(x, msg = NULL, call = rlang::caller_env()) {
  string_argname <- deparse(substitute(x))
  if (!is.character(x) || !is.vector(x)) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' must be a character vector, not a {class(x)}"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}

#' Assert that the input object is a character string
#'
#' @param x An object
#' @param msg A character string containing the error message to display if x is not a character vector
#' @inheritParams assert_dataframe
#'
#' @return invisible(TRUE) if x is a character vector, otherwise aborts with the error message specified by msg
#'
#' @examples
#' \dontrun{
#' assert_string("a") # Passes
#' assert_string(c("a", "b", "c")) # Throws default error
#' assert_string(1:3) # Throws default error
#' assert_string(c("a", 1, "b"), "Custom error message") # Throws custom error
#' }
#' @export
assert_string <- function(x, msg = NULL, call = rlang::caller_env()) {
  string_argname <- deparse(substitute(x))
  if (!is.character(x)) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' is not a string (Object class: {class(x)})"
    }
    cli::cli_abort(msg, call = call)
  } else if (length(x) != 1) {
    if (is.null(msg)) {
      msg <- "'{.strong {string_argname}}' is not a string (length is {length(x)}, not 1!)"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}


# Functions ---------------------------------------------------------------
#' Assert that x is a function
#'
#' @param x An object
#' @param msg A character string containing the error message to display if `x` is not a function
#'
#' @return invisible(TRUE) if `x` is a function, otherwise aborts with the error message specified by `msg`
#'
#' @examples
#' \dontrun{
#' # Assert that a variable is a function
#' x <- function(a, b) { a + b }
#' assert_function(x)  # does nothing
#'
#' # Assert that a variable is not a function
#' x <- "not a function"
#' assert_function(x)  # stops execution and prints an error message
#' }
#'
#' @export
assert_function <- function(x, msg = NULL, call = rlang::caller_env()) {
  string_argname <- deparse(substitute(x))

  # Specify the actual assertion: x is a function
  condition <- !is.function(x)

  if (condition) {
    if (is.null(msg)) {
      # Specify the default error message
      msg <- "'{.strong {string_argname}}' must be a function, not a {class(x)}"
    }
    cli::cli_abort(msg, call = call)
  }
  invisible(TRUE)
}


