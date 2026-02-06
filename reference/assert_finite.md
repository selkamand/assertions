# Assert that a value is finite

Check that a single numeric value is finite (not `NA`, `NaN`, `Inf`, or
`-Inf`). For vectorized version see
[`assert_all_finite()`](assert_all_finite.md).

## Usage

``` r
assert_finite(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
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

invisible(TRUE) if `x` is finite, otherwise aborts with the error
message specified by `msg`

## Examples

``` r
try({
assert_finite(1) # Passes
assert_finite(Inf) # Throws error
})
#> Error in eval(expr, envir) : Inf must be finite.
```
