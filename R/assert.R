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



#' Create an assertion function
#'
#' This function creates an assertion function that can be used to check the
#' validity of an input.
#' All assertions provided with this package are created using either [assert_create()] or [assert_create_advanced()]
#'
#' @param func A function defining the assertion criteria. This function should
#'   return a logical value (`TRUE` when assertion is passed or `FALSE` when it fails)
#' @param  A character string providing an error message in case
#' the assertion fails.
#' Can include the following special terms
#`
#' 1. `{arg_name}` to refer to the name of the variable supplied to the assertion.
#'
#' 2. `{arg_value}` to refer to the value of the variable supplied to the assertion
#'
#' 3. `{code_to_evaluate}` to evaluate the code within the error message.
#' Replace `code_to_evaluate` with your code
#'
#' 4. `{.strong bold_text}` to perform inline formatting. Replace `bold_text` with your text.
#' See [cli documentation](https://cli.r-lib.org/reference/inline-markup.html) for details
#'
#'
#' @return An assertion function.
#'
#' @examples
#' \dontrun{
#' # Create an assertion function that checks that a character string is all
#' # lower case
#' assert_character <- assert_create(is.character, "{arg} must be a character vector, not a {class(x)}")
#'
#' # Use the assertion function
#' is_lower("hello") # Returns invisible TRUE
#' is_lower("Hello") # Aborts the function with the error message
#'}
#' @export
assert_create <- function(func,  default_error_msg){

  # Check arguments
  function_name <- deparse(substitute(func))

  # Ensure func is a valid function
  if(!is.function(func)){
    cli::cli_abort("`{function_name}` must be a function, not a {class(func)}")
  }

  # Ensure func has at least 1 argument
  if(func_arg_count(func) == 0){
    cli::cli_abort("`{function_name}` must have at least 1 paramater to be used in `assert_create`")
  }

  # Ensure default_error_msg is a string
  if(!is_string(default_error_msg)){
    default_error_msg_deparsed <- deparse(substitute(default_error_msg))
    cli::cli_abort("{default_error_msg_deparsed} must be a string (length 1 character vector). Class: {class(default_error_msg)}; Length: {length(default_error_msg)}")
  }


  # Create assertions function
  assertion <- function(x, msg = NULL, call = rlang::caller_env(), ...){

    arg_name <- deparse(substitute(x))
    arg_value <- x

    condition <- func(arg_value, ...)

     if(!is.logical(condition) || length(condition) != 1) # Change to is.flag once this method is created
        cli::cli_abort("Assertion Function `{.strong {function_name}}` must return TRUE / FALSE. Instead returned: `{condition}`")


    if(is.null(msg))
      msg <- default_error_msg

    if(!condition)
      cli::cli_abort(msg, call = call)
    else
      return(invisible(TRUE))

  }
}


assert_create_advanced <- function(func){

  function_name <- deparse(substitute(func))

  # Ensure func is a valid function
  if(!is.function(func)){
    function_name <- deparse(substitute(func))
    cli::cli_abort("`{function_name}` must be a function, not a {class(func)}")
  }

  # Ensure func has at least 1 argument
  if(func_arg_count(func) == 0){
   cli::cli_abort("`{function_name}` must have at least 1 paramater to be used in `assert_create_advanced`")
  }

  assertion <- function(x, msg = NULL, call = rlang::caller_env(), ...){
    arg_name <- deparse(substitute(x))
    arg_value <- x

    condition <- func(arg_value, ...)

    if(!is.character(condition) && !isTRUE(condition)){
     cli::cli_abort(
     c("When creating assertions using `assert_create_advanced`, the supplied function must return either",
       ' ' = "A) a character, representing the error message to throw"),
      ' ' =  "B) TRUE, meaning the assertion should be passed",
     "\n\n You function {.strong {function_name}} returned `{condition}` of class {class(condition)}")
    }

    if(is.null(msg) && is.character(condition))
      msg <- condition

    if(is.character(condition)){
      cli::cli_abort(msg, call = call)
    }

    return(invisible(TRUE))
  }

  return(assertion)
}

# myfunc <- function(func){
#   args <- func_args_as_pairlist(func)
#   args[1] <- NULL
#   args <- append(args, as.pairlist(alist(x = , msg = NULL, call = rlang::caller_env())), after = 0)
#
#   if(!func_arg_default_status(func)[1]){
#    cli::cli_abort("The first argument of the supplied function should NOT have default values")
#   }
#
#   #browser()
#   body = quote({
#
#     message(msg)
#     # Get the list of arguments and their supplied values
#     args <- as.list(match.call())[-1]
#
#     args <- args[names(args) != "msg"]
#
#     defualts <- lapply(args, function(x) {x})
#
#     do.call(func, args = unname(args), envir = parent.frame())
#     })
#
#   returned_func <- rlang::new_function(args, body, env = rlang::env(func = func))
#
#   return(returned_func)
# }
#
#
#
# myfunc2 <- function(a, b, c, d){
#   sum(a, b, c, d)
# }
#
# newfunc <- myfunc(myfunc2)

#newfunc(x = 1, msg = "Hello", b = 2, c = 3, d = 4)
