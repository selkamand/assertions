# Assert that x is reactive

Assert that x is reactive

## Usage

``` r
assert_reactive(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An object

- msg:

  A character string containing the error message to display if `x` is
  not reactive

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is a reactive, otherwise aborts with the error
message specified by `msg`

## Examples

``` r
try({
# Assert that a variable is reactive
x <- shiny::reactive(1)
assert_reactive(x)  # does nothing

# Assert that a variable is not a list
x <- 1
assert_reactive(x)  # stops execution and prints an error message
})
#> Error in eval(expr, envir) : 
#>   'x' must be a reactive, not a numeric
```
