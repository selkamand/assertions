# Assert input is greater than or equal to a specified minimum value

Assert all elements in a numeric vector/matrix are above or equal to
some minimum value. For vectorized version see
[`assert_all_greater_than_or_equal_to()`](assert_all_greater_than_or_equal_to.md)

## Usage

``` r
assert_greater_than_or_equal_to(
  x,
  minimum,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  An object to check

- minimum:

  The minimum value to compare against

- msg:

  A character string containing the error message to display if `x` is
  not greater than or equal to the specified minimum value (string)

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is greater than or equal to the specified minimum
value, otherwise aborts with the error message specified by `msg`

## Examples

``` r
try({
assert_greater_than_or_equal_to(3, 2) # Passes
assert_greater_than_or_equal_to(c(3, 4, 5), 2) # Throws error
assert_greater_than_or_equal_to(2, 3) # Throws error
})
#> Error in eval(expr, envir) : 
#>   'c(3, 4, 5)' is not a number! (length is 3, not 1)
```
