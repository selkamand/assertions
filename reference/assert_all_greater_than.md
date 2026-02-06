# Assert input is greater than a specified minimum value

Assert all elements in a numeric vector/matrix are above some minimum
value.

## Usage

``` r
assert_all_greater_than(
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

  The minimum value to compare against (number)

- msg:

  A character string containing the error message to display if `x` is
  not greater than the specified minimum value (string)

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is greater than the specified minimum value,
otherwise aborts with the error message specified by `msg`

## Examples

``` r
try({
assert_all_greater_than(3, 2) # Passes
assert_all_greater_than(c(2,3,4), 1) # Passes
assert_all_greater_than(c(2,3,4), 2) # Passes
assert_all_greater_than(c(2,3,1), 3) # Throws default error
assert_all_greater_than(c(2,3,1), 3, msg = "custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   c(2, 3, 4) must all be greater than `2`.
```
