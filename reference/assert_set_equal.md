# Check if two sets are identical

This function checks that `x` and `y` contain exactly the same elements,
ignoring order and duplicates.

## Usage

``` r
assert_set_equal(x, y, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  A vector to compare

- y:

  Another vector to compare with `x`

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

Returns `invisible(TRUE)` if `x` and `y` contain all the same elements
(ignoring order and duplicates), otherwise throws an error.

## Examples

``` r
# Passes because elements are the same, order doesn't matter
assert_set_equal(c(1, 2, 3), c(3, 2, 1))

# Passes because elements are identical
assert_set_equal(c("A", "B", "C"), c("C", "A", "B"))

try({
  # Throws error because elements are not identical
  assert_set_equal(c(1, 2, 3), c(1, 2))

  # Throws error because elements differ
  assert_set_equal(c("A", "B"), c("A", "B", "C"))
})
#> Error in eval(expr, envir) : 
#>   'c(1, 2, 3)' contains an unexpected value: 3.
```
