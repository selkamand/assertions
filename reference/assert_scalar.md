# Assert input is a scalar

Assert that an object is a scalar, meaning it is a length 1 atomic
vector (such as `numeric(1)`, `character(1)` or `logical(1)`). Note
lists, data.frames and matrices are never considered scalar objects,
even if they have only one element.

## Usage

``` r
assert_scalar(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An object

- msg:

  A character string containing the error message to display if `x` is
  not a scalar

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is a scalar, otherwise aborts with the error
message specified by `msg`

## Examples

``` r
# Pass when value is scalar
assert_scalar(5) # Passes
assert_scalar("single string") # Passes
assert_scalar(TRUE) # Passes

# Fail when value is not
try({
assert_scalar(c(1, 2, 3)) # Throws default error
assert_scalar(matrix(1:4, 2, 2)) # Throws default error
})
#> Error in eval(expr, envir) : 
#>   'c(1, 2, 3)' must be a scalar, not a numeric

```
