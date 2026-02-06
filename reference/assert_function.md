# Assert input is a function

Assert input is a function

## Usage

``` r
assert_function(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An object

- msg:

  A character string containing the error message to display if `x` is
  not a function

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is a function, otherwise aborts with the error
message specified by `msg`

## Examples

``` r
try({
# Assert that a variable is a function
x <- function(a, b) { a + b }
assert_function(x)  # does nothing

# Assert that a variable is not a function
x <- "not a function"
assert_function(x)  # stops execution and prints an error message
})
#> Error in eval(expr, envir) : 
#>   'x' must be a function, not a character

```
