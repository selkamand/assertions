# Assert that conditions are met

Assert that conditions are met

## Usage

``` r
assert(..., msg = NULL, call = rlang::caller_env())
```

## Arguments

- ...:

  a list of conditions to check

- msg:

  A character string containing the error message to display if any of
  the conditions are not met. The string can include the placeholder
  {failed_expressions} to insert a list of the failed expressions. The
  string can also include {?s} and {?is/are} to insert the correct
  pluralization for the list of failed expressions.

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

## Value

invisible(TRUE) if all conditions are met, otherwise aborts with the
error message specified by msg

## Examples

``` r
try({
assert(1 == 1) # Passes
assert(2 == 2, 3 == 3) # Passes
assert(2 == 1, 3 == 3) # Throws default error
assert(2 == 1, 3 == 3, msg = "Custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : The following assertions failed:
#> ✖ `2 == 1`
```
