# Assert that the input vector has no duplicates

Assert the input vector has no duplicated elements

## Usage

``` r
assert_no_duplicates(
  x,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  A vector.

- msg:

  A character string containing the error message to display if `x` has
  duplicates.

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` has no duplicates, otherwise aborts with the
error message specified by `msg`

## Examples

``` r
try({
assert_no_duplicates(c(1, 2, 3))  # Passes
assert_no_duplicates(c(1, 2, 2))  # Throws default error

assert_no_duplicates(c(1, 2, 3), msg = "Custom error message")  # Passes
assert_no_duplicates(c(1, 2, 2), msg = "Custom error message")  # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   'c(1, 2, 2)' must have no duplicates! Found 1 duplicated value: 2
```
