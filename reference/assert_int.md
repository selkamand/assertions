# Assert input is an integer

Assert input is an integer

## Usage

``` r
assert_int(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An object

- msg:

  A character string containing the error message to display if `x` is
  not an integer

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is an integer, otherwise aborts with the error
message specified by `msg`

## Note

In R, integers are whole numbers. Both integers and doubles (numbers
with decimals) are considered numeric. This function checks that `x`
specifically belong to the integer class.

## Examples

``` r
try({
assert_int(1) # Passes
assert_int(1:10) # Passes
assert_int(c(1, 2, 3)) # Passes
assert_int("a") # Throws default error
assert_int(1.5, msg = "Custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   '1' must be an integer, not a numeric

```
