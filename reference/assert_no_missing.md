# Assert that the input vector has no missing values

This function asserts that the input vector has no missing values (`NA`)
and aborts with an error message if it does.

## Usage

``` r
assert_no_missing(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  A vector.

- msg:

  A character string containing the error message to display if `x` has
  missing values.

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` has no missing values (NA), otherwise aborts with
the error message specified by `msg`

## Examples

``` r
try({
assert_no_missing(c(1, 2, 3))  # Passes
assert_no_missing(c(1, NA, 2))  # Throws default error

assert_no_missing(c(1, 2, 3), msg = "Custom error message")  # Passes
assert_no_missing(c(1, NA, 2), msg = "Custom error message")  # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   'c(1, NA, 2)' must have no missing values! Found 1
```
