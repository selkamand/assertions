# Assert that all values are finite

Check that all values in `x` are finite (not `NA`, `NaN`, `Inf`, or
`-Inf`).

## Usage

``` r
assert_all_finite(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
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

invisible(TRUE) if all values in `x` are finite, otherwise aborts with
the error message specified by `msg`

## Examples

``` r
try({
assert_all_finite(c(1, 2, 3)) # Passes
assert_all_finite(c(1, Inf)) # Throws error
})
#> Error in eval(expr, envir) : 
#>   c(1, Inf) must all be finite.
```
