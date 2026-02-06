# Assert input is a matrix

Assert input is a matrix

## Usage

``` r
assert_matrix(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An object

- msg:

  A character string containing the error message to display if `x` is
  not a matrix

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is a matrix, otherwise aborts with the error
message specified by `msg`

## Examples

``` r
try({
assert_matrix(matrix(1:9, 3)) # Passes
assert_matrix(matrix(1:9, 3, 3)) # Passes
assert_matrix(c(1, 2, 3)) # Throws default error
assert_matrix(1:10, "Custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   'c(1, 2, 3)' must be a matrix, not a numeric
```
