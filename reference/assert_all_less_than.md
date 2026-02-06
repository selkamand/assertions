# Assert input is less than a specified maximum value

Assert all elements in a numeric vector/matrix are below some maximum
value.

## Usage

``` r
assert_all_less_than(
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
assert_all_less_than(1, 2) # Passes
assert_all_less_than(c(1,2,3), 4) # Passes
assert_all_less_than(c(1,2,3), 2) # Throws default error
assert_all_less_than(c(1,2,3), 2, msg = "custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   c(1, 2, 3) must all be less than `2`.
```
