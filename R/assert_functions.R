
# Assertions --------------------------------------------------------------




# Utilities ---------------------------------------------------------------
func_arg_names <- function(func){
  names(formals(args(func)))
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

func_arg_count <- function(func){
  arg_names <-func_arg_names(func)
  length(arg_names)
}

func_arg_has_dots <- function(func){
  any(func_arg_names(func) == "...")
}

func_arg_default_status <- function(func){
  args <- func_args_as_pairlist(func)
  lgl <- unlist(args) == substitute()
  return(lgl)
}


