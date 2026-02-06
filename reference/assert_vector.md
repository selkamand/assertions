# Assert input is a vector

Assert input is a vector

## Usage

``` r
assert_vector(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An object

- msg:

  A character string containing the error message to display if `x` is
  not a vector

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is a vector, otherwise aborts with the error
message specified by `msg`

## Note

By default, lists are not considered vectors (i.e.
`include_lists = FALSE`) to align with what end-users will expect, in
spite of these objects technically being vectors.

## Examples

``` r
try({
assert_vector(c(1, 2, 3)) # Passes
assert_vector(matrix(1:6, 2, 3)) # Throws default error message
assert_vector(1:3) # Passes

assert_vector(list(1, 2, 3)) # Throws default error message
assert_vector(list(1, 2, 3), include_lists = TRUE) # Passes

assert_vector(c("a", 1, "b"), "Custom error message") # Throws custom error message
assert_vector(factor(c(1, 2, 3)), "Custom error message") # Throws custom error message
})
#> Error in eval(expr, envir) : 
#>   'matrix(1:6, 2, 3)' must be a vector, not a matrix and array

```
