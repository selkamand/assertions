# Assert that the input is not NULL

This function asserts that the input is not NULL and aborts with an
error message if it is.

## Usage

``` r
assert_non_null(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  A value to check.

- msg:

  A character string containing the error message to display if `x` is
  NULL.

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is not NULL, otherwise aborts with the error
message specified by `msg`.

## Examples

``` r
# Passes for non-NULL
assert_non_null(1)

try({
 # Throws default error for NULL
 assert_non_null(NULL)

 # Throws custom error message
 assert_non_null(NULL, msg = "Custom error message")
})
#> Error in eval(expr, envir) : 'NULL' must not be NULL!
```
