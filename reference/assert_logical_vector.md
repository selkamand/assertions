# Assert input is an atomic logical vector

Assert input is an atomic logical vector

## Usage

``` r
assert_logical_vector(
  x,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  An object

- msg:

  A character string containing the error message to display if x is not
  an atomic logical vector

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if x is an atomic logical vector, otherwise aborts with
the error message specified by msg

## Examples

``` r
try({
assert_logical_vector(c(TRUE, TRUE, TRUE)) # Passes
assert_logical_vector("a") # Throws default error
assert_logical_vector(c(1, 0, 1), "Custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   '"a"' must be a logical vector, not a character

```
