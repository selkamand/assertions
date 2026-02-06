# Assert that the input objects are equal

Is `x` equal to `y`. powered by the
[`all.equal()`](https://rdrr.io/r/base/all.equal.html) function.

## Usage

``` r
assert_equal(
  x,
  y,
  tolerance = sqrt(.Machine$double.eps),
  check_names = TRUE,
  check_environment = TRUE,
  check_tzone = TRUE,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  An object to check

- y:

  The value to compare against

- tolerance:

  Differences smaller than tolerance are not reported. The default value
  is close to 1.5e-8 (numeric \>= 0).

- check_names:

  should the names(.) of target and current should be compare (flag)

- check_environment:

  should the environments of functions should be compared? You may need
  to set check.environment=FALSE in unexpected cases, such as when
  comparing two nls() fits. (flag)

- check_tzone:

  should "tzone" attributes be compared. Important for comparing POSIXt
  objects. (flag)

- msg:

  A character string containing the error message to display if `x` is
  not equal to `y`

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is equal to the specified value, otherwise aborts
with the error message specified by `msg`

## Examples

``` r
try({
assert_equal(3, 3) # Passes
assert_equal(c(3, 3, 3), 3, ) # Fails
assert_equal(2, 3) # Throws error
})
#> Error in eval(expr, envir) : 
#>   c(3, 3, 3) must be equal to 3
```
