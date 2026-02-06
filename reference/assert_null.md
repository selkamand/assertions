# Assert that the input is NULL

This function asserts that the input is NULL and aborts with an error
message if it is not.

## Usage

``` r
assert_null(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  A value to check.

- msg:

  A character string containing the error message to display if `x` is
  not NULL.

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is NULL, otherwise aborts with the error message
specified by `msg`.

## Examples

``` r
assert_null(NULL)  # Passes

try({
 assert_null(1)  # Throws default error
 assert_null(1, msg = "Custom error message")  # Throws custom error
})
#> Error in eval(expr, envir) : '1' must be NULL!
```
