# Assert input is between a specified minimum and maximum value

Assert all elements in a numeric vector/matrix are between some minimum
and maximum values.

## Usage

``` r
assert_all_between(
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

  The minimum value to compare against (number)

- maximum:

  The maximum value to compare against (number)

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
assert_all_between(3, 1, 4) # Passes
assert_all_between(c(2,3,4), 1, 4) # Passes
assert_all_between(c(2,3,4), 2, 4) # Passes
assert_all_between(c(2,3,1), 2, 4) # Throws default error
assert_all_between(c(2,3,1), 2, 4, msg = "custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   c(2, 3, 1) must all be between 2 and 4 (inclusive).
```
