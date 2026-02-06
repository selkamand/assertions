# Assert input is less than some maximum value

Assert a number is less than a specified maximum value. To check all
numbers in a vector / matrix are below a maximum value, see
[`assert_all_less_than()`](assert_all_less_than.md)

## Usage

``` r
assert_less_than(
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

  The maximum value to compare against (number)

- msg:

  A character string containing the error message to display if `x` is
  not less than the specified maximum value (string)

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is less than the specified maximum value,
otherwise aborts with the error message specified by `msg`

## Examples

``` r
try({
assert_less_than(1, 2) # Passes
assert_less_than(1, 2) # Passes
assert_less_than(c(1,2,3), 4) # Throws error (Must be a number)
assert_less_than('A', 1) # Throws error (Must be a number)
assert_less_than(3, 2, msg = "custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   'c(1, 2, 3)' is not a number! (length is 3, not 1)
```
