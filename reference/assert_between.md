# Assert input is between a specified minimum and maximum value

Assert a number is between a specified minimum and maximum value. To
check all numbers in a vector / matrix are between minimum and maximum
values, see [`assert_all_between()`](assert_all_between.md)

## Usage

``` r
assert_between(
  x,
  minimum,
  maximum,
  inclusive = TRUE,
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

- maximum:

  The maximum value to compare against

- inclusive:

  should comparisons allow equality with the minimum and maximum values?
  (flag)

- msg:

  A character string containing the error message to display if `x` is
  not between the specified minimum and maximum values (string)

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is between the specified minimum and maximum
values, otherwise aborts with the error message specified by `msg`

## Examples

``` r
try({
assert_between(3, 1, 4) # Passes
assert_between(3, 1, 4) # Passes
assert_between(c(2,3,4), 1, 4) # Throws error (Must be a number)
assert_between('A', 1, 4) # Throws error (Must be a number)
assert_between(5, 1, 4, msg = "custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   'c(2, 3, 4)' is not a number! (length is 3, not 1)
```
