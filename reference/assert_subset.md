# Check if a vector is a subset of another

This function checks that `x` is a subset of `y`

## Usage

``` r
assert_subset(x, y, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  A vector to check

- y:

  the acceptable values that x can take

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

Returns invisible(TRUE) if `x` is a subset of `y`, otherwise throws an
error

## Examples

``` r
try({
assert_subset(1:3, 1:5) # Passes
assert_subset(c("A", "B", "C"), c("A", "B")) # Throws error since "C" is not present in first vector
})
#> Error in eval(expr, envir) : 
#>   ✖ 'c("A", "B", "C")' contains an invalid value: C. Valid values include:
#>   A and B
```
