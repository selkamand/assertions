# Assert input is a scalar logical

Assert input is a flag (a logical of length 1: `TRUE` or `FALSE`)

## Usage

``` r
assert_flag(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An object

- msg:

  A character string containing the error message to display if `x` is
  not a scalar logical

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is a scalar logical, otherwise aborts with the
error message specified by `msg`

## Examples

``` r
try({
assert_flag(TRUE) # Passes
assert_flag(FALSE) # Passes
assert_flag(c(TRUE, FALSE)) # Throws default error
assert_flag(1, "Custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   'c(TRUE, FALSE)' is not a flag! (length is 2, not 1)

```
