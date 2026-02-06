# Assert that the input object is identical to a specified value

Assert that the input object is identical to a specified value

## Usage

``` r
assert_identical(x, y, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An object to check

- y:

  The value to compare against

- msg:

  A character string containing the error message to display if `x` is
  not identical to the specified value

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is identical to the specified value, otherwise
aborts with the error message specified by `msg`

## Examples

``` r
try({
assert_identical(3, 3) # Passes
assert_identical(c(3, 3, 3), 3) # Throws error
assert_identical(2, 3) # Throws error
})
#> Error in eval(expr, envir) : 
#>   c(3, 3, 3) must be identical to 3
```
