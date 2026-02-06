# Assert input is less than or equal to a specified maximum value

Assert a number is less than or equal to a specified maximum value. For
vectorized version see
[`assert_all_less_than_or_equal_to()`](assert_all_less_than_or_equal_to.md)

## Usage

``` r
assert_less_than_or_equal_to(
  x,
  maximum,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  An object to check

- maximum:

  The maximum value to compare against

- msg:

  A character string containing the error message to display if `x` is
  not less than or equal to the specified maximum value (string)

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is less than or equal to the specified maximum
value, otherwise aborts with the error message specified by `msg`

## Examples

``` r
try({
assert_less_than_or_equal_to(1, 2) # Passes
assert_less_than_or_equal_to(c(1, 2, 3), 3) # Throws error
assert_less_than_or_equal_to(3, 2) # Throws error
})
#> Error in eval(expr, envir) : 
#>   'c(1, 2, 3)' is not a number! (length is 3, not 1)
```
