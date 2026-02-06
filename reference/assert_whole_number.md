# Assert that the input object is a whole number

Check if `x` is a whole number (no decimal)

## Usage

``` r
assert_whole_number(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An object

- msg:

  The error message thrown if the assertion fails (string)

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is a whole number, otherwise aborts with the
error message specified by `msg`

## Examples

``` r
try({
assert_whole_number(24) # Passes
assert_whole_number(2.5) # Throws error
})
#> Error in eval(expr, envir) : 
#>   '2.5' is not a whole number
```
