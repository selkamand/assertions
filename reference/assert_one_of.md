# Check if a scalar value is one of the acceptable values

Assert `x` is one of the values of `y`.

## Usage

``` r
assert_one_of(x, y, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  A scalar value to check

- y:

  A vector of acceptable values that `x` can take

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

Returns invisible(TRUE) if `x` is a scalar and is one of the values in
`y`, otherwise throws an error

## Examples

``` r
assert_one_of(3, 1:5) # Passes because 3 is in 1:5
assert_one_of("A", c("A", "B", "C")) # Passes because "A" is in the vector

try({
  assert_one_of("D", c("A", "B", "C")) # Throws error because "D" is not in the vector
})
#> Error in eval(expr, envir) : 
#>   ✖ '"D"' must be one of A, B, or C, not D.
```
