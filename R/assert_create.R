#' Create an assertion function
#'
#' This function creates an assertion function that can be used to check the
#' validity of an input.
#' All assertions provided with this package are created using either [assert_create()] or [assert_create_advanced()]
#'
#' @param func A function defining the assertion criteria. This function should
#'   return a logical value (`TRUE` when assertion is passed or `FALSE` when it fails)
#' @param default_error_msg A character string providing an error message in case
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
#' assert_character <- assert_create(
#'   is.character,
#'   "{arg_name} must be a character vector, not a {class(arg_value)}"
#' )
#'
#' # Use the assertion function
#' is_lower("hello") # Returns invisible TRUE
#' is_lower("Hello") # Aborts the function with the error message
#'}
#' @include utils.R
#' @concept assert_create
#' @export
assert_create <- function(func,  default_error_msg){

  # Check arguments
  function_name <- paste0(deparse(substitute(func)), collapse = "")


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


#' Create an advanced assertion function
#'
#' Creates a custom assertion function that can be used to check if a supplied value meets certain criteria.
#' The input function is required to return TRUE if the assertion should pass or a string error message if it should fail.
#'
#' @param func A function defining the assertion criteria.
#' This function should return a TRUE when assertion should pass,
#' or a character string representing an error message if it fail. E
#' Error message strings can contain the same special keywords / formatting as described in [assert_create()]
#'
#' @return Returns a custom assertion function that can be used to check if a supplied value meets the defined criteria.
#'
#'
#' @concept assert_create
#' @export
assert_create_advanced <- function(func){

  function_name <- deparse(substitute(func))
  function_name <- format_escape_curly(function_name)

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
