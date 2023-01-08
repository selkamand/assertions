
# Basic Typing -------------------------------------------------------------------

#' Check if an object is a vector, optionally excluding lists
#'
#' This function checks if an object is a vector, with the option to exclude lists from being considered vectors.
#'
#' @param x An object to check
#' @param include_lists A logical indicating whether lists should be considered vectors. Default is `FALSE`.
#' @return A logical indicating whether `x` is a vector (optionally excluding lists)
#'
#' @examples
#' is_vector(1:10)
#' is_vector(list(1:10))
#' is_vector(list(1:10), include_lists = TRUE)
is_vector <- function(x, include_lists = FALSE){
  is.vector(x) && (!inherits(x, what = "list") || include_lists)
}

#' Check if an object is a numeric vector
#'
#' This function checks if an object is a numeric vector in R. It can also optionally check if lists containing only numeric elements should be considered numeric vectors.
#'
#' @param x An object to check.
#' @param include_lists A logical value indicating whether lists containing only numeric elements should be considered numeric vectors.
#' @return A logical value indicating whether `x` is a numeric vector.
#' @examples
#' is_numeric_vector(c(1, 2, 3)) # TRUE
#' is_numeric_vector(list(1, 2, 3)) # FALSE
#' is_numeric_vector(list(1, 2, 3), include_lists = TRUE) # TRUE
#' is_numeric_vector(1:5) # TRUE
#' is_numeric_vector("hello") # FALSE
#' is_numeric_vector(list(1, 2, "a"), include_lists = TRUE) # FALSE
is_numeric_vector <- function(x, include_lists = FALSE){
  is.numeric(x) && is_vector(x, include_lists = include_lists)
}

is_number <- function(x){
 is.numeric(x) && length(x) == 1
}

is_character_vector <- function(x, include_lists = FALSE){
  is.character(x) && is_vector(x, include_lists = include_lists)
}


is_logical_vector <- function(x, include_lists = FALSE){
  is.logical(x) && is_vector(x, include_lists = include_lists)
}

is_string <- function(x){
  is.character(x) && length(x) == 1
}


# assert_create_advanced functions -----------------------------------------
# These functions are for feeding into assert_create_advanced
# They take an object and instead of returning TRUE/FALSE, they return TRUE if assertion should pass,
# and the error message to throw if assertion should fail
is_number_advanced <- function(x){
  if(!is.numeric(x))
    return("'{.strong {arg_name}}' is not a {.strong number}! (class is {.strong {class(arg_value)}}, not {.strong numeric})")

  if(length(x) != 1)
    return("'{.strong {arg_name}}' is not a {.strong number}! (length is {.strong {length(arg_value)}}, not {.strong 1})")

  return(invisible(TRUE))
}

is_flag_advanced <- function(x){
  if(!is.logical(x))
    return("'{.strong {arg_name}}' is not a {.strong flag}! (class is {.strong {class(arg_value)}}, not {.strong logical})")

  if(length(x) != 1)
    return("'{.strong {arg_name}}' is not a {.strong flag}! (length is {.strong {length(arg_value)}}, not {.strong 1})")

  return(invisible(TRUE))
}

is_string_advanced <- function(x){
  if(!is.character(x))
    return("'{.strong {arg_name}}' is not a {.strong string}! (class is {.strong {class(arg_value)}}, not {.strong character})")

  if(length(x) != 1)
    return("'{.strong {arg_name}}' is not a {.strong string}! (length is {.strong {length(arg_value)}}, not {.strong 1})")

  return(invisible(TRUE))
}
