# Notes -------------------------------------------------------------------

# assert_function is in assert_type.
# All other assertions that run on func are here
# utilities for probing functions are in utils.R


# Advanced Functions ------------------------------------------------------
function_expects_n_arguments_advanced <- function(x, n, dots = c("throw_error","count_as_0", "count_as_1", "count_as_inf")){
  dots <- rlang::arg_match(dots)

  if(!is.function(x))
    return("{.strong '{arg_name}'} must be a function, not a {class(arg_value)}")

  if(func_supports_variable_arguments(x) && dots == "throw_error")
    return("{.strong '{arg_name}'} must not contain ... arguments")


  number_of_parameters <- func_arg_count(x, dots = dots)

  if(number_of_parameters != n)
    return(paste0("{.strong '{arg_name}'} must expect exactly {.strong {n}} argument{?s}, not {.strong ", number_of_parameters, "}"))

  return(TRUE)
}

function_expects_advanced <- function(x, required){
  if(!is.function(x))
    return("{.strong '{arg_name}'} must be a function, not a {class(arg_value)}")

  required_args <- func_required_arg_names(x)
  if(!is_subset(required, required_args)){
    missing_args <- setopts_exlusive_to_first(required, required_args)
    missing_count <- length(missing_args)
    missing_args <- paste0("`", paste(missing_args, collapse = "`, `"), "`")
    return(paste0("'{.strong {arg_name}}' is missing {.strong ", missing_count, "} required argument",
                  if(missing_count == 1) "" else "s",
                  ": {.strong ", missing_args, "}"
    ))
  }

  return(TRUE)
}


# Assertions --------------------------------------------------------------

#' Assert function expects n arguments
#'
#' Assert a function expects n arguments, with user control over how variable arguments (...) are counted (default throws error)
#'
#' @include assert_create.R
#' @include utils.R
#' @param x a function to check has exactly N arguments
#' @param n number of arguments that must be expected by function to pass assertion (integer)
#' @param dots how to deal with '...' dots (a.k.a variable arguments). Should we count as 0, 1 or infinite arguments. Or, do we just throw an error when we see '...' (default)
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if function `x` expects exactly n arguments, otherwise aborts with the error message specified by `msg`
#'
#' @export
assert_function_expects_n_arguments <- assert_create(func = function_expects_n_arguments_advanced)

#' Assert function expects required argument names
#'
#' Assert a function expects a set of required argument names.
#'
#' @include assert_create.R
#' @include utils.R
#' @param x a function to check includes required argument names
#' @param required a character vector of required argument names
#' @inheritParams common_roxygen_params
#'
#' @return invisible(TRUE) if function `x` expects all required arguments, otherwise aborts with the error message specified by `msg`
#'
#' @export
assert_function_expects <- assert_create(func = function_expects_advanced)
