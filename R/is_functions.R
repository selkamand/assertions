
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
#'
#' @concept is_type
#'
#' @export
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
#'
#' @concept is_type
#'
#' @export
is_numeric_vector <- function(x, include_lists = FALSE){
  is.numeric(x) && is_vector(x, include_lists = include_lists)
}

#' Check if an object is a single number
#'
#' @param x An object to check.
#' @return A logical value indicating whether `x` is a single number.
#'
#' @concept is_type
#'
#' @export
is_number <- function(x){
  is.numeric(x) && length(x) == 1
}

#' Check if an object is a character vector
#'
#' @param x An object to check.
#' @param include_lists A logical value indicating whether to include lists in the check. Defaults to `FALSE`.
#' @return A logical value indicating whether `x` is a character vector.
#'
#' @concept is_type
#' @export
is_character_vector <- function(x, include_lists = FALSE){
  is.character(x) && is_vector(x, include_lists = include_lists)
}


is_scalar <- function(x){
 length(x) == 1
}

#' Check if an object is a logical vector
#'
#' @param x An object to check.
#' @param include_lists A logical value indicating whether to include lists in the check. Defaults to `FALSE`.
#' @return A logical value indicating whether `x` is a logical vector.
#'
#' @concept is_type
#' @export
is_logical_vector <- function(x, include_lists = FALSE){
  is.logical(x) && is_vector(x, include_lists = include_lists)
}

#' Check if an object is a single string
#'
#' @param x An object to check.
#' @return A logical value indicating whether `x` is a single string.
#'
#' @concept is_type
#' @export
is_string <- function(x){
  is.character(x) && length(x) == 1
}

#' Check if a value is a logical flag
#'
#' This function checks if a value is a logical scalar (i.e., a single logical value).
#'
#' @param x A value to check.
#' @return A logical scalar indicating whether `x` is a logical flag.
#' @examples
#' is_flag(TRUE)
#' is_flag(FALSE)
#' is_flag(c(TRUE, FALSE))
#' @export
#' @concept is_type
#'
is_flag <- function(x){
  is.logical(x) && length(x) == 1
}

#' Check if a value is a list
#'
#' This function checks if a value is a list.
#' By default, definition of a 'list' excludes data.frames in spite of them technically being lists.
#' This behaviour can be changed by setting `include_dataframes = TRUE`
#'
#' @param x A value to check.
#' @param include_dataframes A logical indicating whether lists should be considered vectors. Default is `FALSE`.
#' @return A logical scalar indicating whether `x` is a list.
#' @examples
#' is_list(list(1, 2)) # TRUE
#' is_list(c(1, 2, 3)) # FALSE
#' is_list(data.frame()) # FALSE
#' is_list(data.frame(), include_dataframes = TRUE) # TRUE
#' @export
#' @concept is_type
#'
is_list <- function(x, include_dataframes = FALSE){
  is.list(x) && (!is.data.frame(x) || include_dataframes)
}

#' Check if a value is reactive
#'
#' This function checks if a value is reactive
#'
#' @param x A value to check.
#' @return A logical scalar indicating whether `x` is a list.
#' @examples
#' \dontrun{
#' is_reactive(shiny::reactive(1)) # TRUE
#' is_reactive(1) # FALSE
#' }
#' @export
#' @concept is_type
#'
is_reactive <- function(x){
  rlang::check_installed("shiny")
  shiny::is.reactive(x)
}

is_whole_number <- function(x){
  return(x%%1==0)
}
# Advanced ----------------------------------------------------------------
# assert_create_advanced functions -----------------------------------------
# These functions are for feeding into assert_create_advanced
# They take an object and instead of returning TRUE/FALSE, they return TRUE if assertion should pass,
# and the error message to throw if assertion should fail


#' Check if x is a number
#'
#' This function is designed for use with `assert_create_advanced`. It must return
#' TRUE for the assertion to pass or a string representing the error message if the
#' assertion should fail.
#'
#' @param x A value to be checked
#'
#' @return Returns invisible(TRUE) if x is a numeric value with length 1. Returns a string
#' with an error message if x is not a numeric value or has a length other than 1.
#'
#' @export
#' @concept advanced
is_number_advanced <- function(x){
  if(!is.numeric(x))
    return("'{.strong {arg_name}}' is not a {.strong number}! (class is {.strong {class(arg_value)}}, not {.strong numeric})")

  if(length(x) != 1)
    return("'{.strong {arg_name}}' is not a {.strong number}! (length is {.strong {length(arg_value)}}, not {.strong 1})")

  return(invisible(TRUE))
}

#' Check if x is a flag
#'
#' This function is designed for use with `assert_create_advanced`. It must return
#' TRUE for the assertion to pass or a string representing the error message if the
#' assertion should fail.
#'
#' @param x A value to be checked
#'
#' @return Returns invisible(TRUE) if x is a logical value with length 1. Returns a string
#' with an error message if x is not a logical value or has a length other than 1.
#'
#'
#' @concept advanced
#' @export
is_flag_advanced <- function(x){
  if(!is.logical(x))
    return("'{.strong {arg_name}}' is not a {.strong flag}! (class is {.strong {class(arg_value)}}, not {.strong logical})")

  if(length(x) != 1)
    return("'{.strong {arg_name}}' is not a {.strong flag}! (length is {.strong {length(arg_value)}}, not {.strong 1})")

  return(invisible(TRUE))
}

#' Check if x is a string
#'
#' This function is designed for use with `assert_create`. It returns
#' TRUE for the assertion to pass or a string representing the error message if the
#' assertion should fail.
#'
#' @param x A value to be checked
#'
#' @return Returns invisible(TRUE) if x is a character value with length 1. Returns a string
#' with an error message if x is not a character value or has a length other than 1.
#'
#' @concept advanced
is_string_advanced <- function(x){
  if(!is.character(x))
    return("'{.strong {arg_name}}' is not a {.strong string}! (class is {.strong {class(arg_value)}}, not {.strong character})")

  if(length(x) != 1)
    return("'{.strong {arg_name}}' is not a {.strong string}! (length is {.strong {length(arg_value)}}, not {.strong 1})")

  return(invisible(TRUE))
}


#' Check if x is a nonempty string
#'
#' This function is designed for use with `assert_create`. It returns
#' TRUE for the assertion to pass or a string representing the error message if the
#' assertion should fail.
#'
#'
#'
#' @param x A value to be checked
#'
#' @return Returns invisible(TRUE) if x is a character value with length 1 and at least 1 character in string. Returns a string
#' with an error message if x is not a character value or has a length other than 1.
#'
#' @concept advanced
is_non_empty_string_advanced <- function(x){
  is_string_res <-  is_string_advanced(x)

  if(is.character(is_string_res))
    return(is_string_res)
  else if(nchar(x) == 0)
    return("'{.strong {arg_name}}' is an {.strong empty} string!")

  return(invisible(TRUE))
}




