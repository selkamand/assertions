
# Assertions --------------------------------------------------------------




# Utilities ---------------------------------------------------------------
func_arg_names <- function(func){
  names(formals(args(func)))
}

func_arg_count <- function(func){
    arg_names <-func_arg_names(func)
    length(arg_names)
}

func_arg_has_dots <- function(func){
  any(func_arg_names(func) == "...")
}

