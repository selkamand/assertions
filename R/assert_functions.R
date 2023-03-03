
# Notes -------------------------------------------------------------------

# assert_function is in assert_type.
# All other assertions that run on func are here

# Assertions --------------------------------------------------------------




# Utilities ---------------------------------------------------------------
func_arg_names <- function(func){
  names(formals(args(func)))
}

func_supports_variable_arguments <- function(func){
  arg_names <- func_arg_names(func)
  any(grepl(x = arg_names, pattern = "...", fixed = TRUE))
}

func_args_as_pairlist <- function(func){
  formals(args(func))
}
#
# func_args_as_alist <- function(func){
#   a= unlist(func_args_as_pairlist(func))
# }

# func_arg_remove_defaults <- function(func, n){
#   #foo <- as.pairlist(alist(foo=)) ; names(foo) <- names(formals(f))[1]; formals(f)[1] <- foo; f
#   formals(func)[[1]] <- substitute()
#   return(func)
# }


func_arg_count <- function(func, dots = c("count_as_0", "count_as_1", "count_as_inf")){

  dots <- rlang::arg_match(dots)

  param_names <- func_arg_names(func)
  param_count <- length(param_names)

  supports_varargs <-  func_supports_variable_arguments(func)

  if(supports_varargs){
    if(dots == "count_as_0") { param_count <- param_count - 1 }
    else if (dots == "count_as_1") { param_count <- param_count }
    else if (dots == "count_as_inf") { param_count <- Inf }
  }

  return(param_count)
}


# func_arg_has_dots <- function(func){
#   any(func_arg_names(func) == "...")
# }
#
# func_arg_default_status <- function(func){
#   args <- func_args_as_pairlist(func)
#   lgl <- unlist(args) == substitute()
#   return(lgl)
# }


