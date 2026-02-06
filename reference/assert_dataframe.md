# Assert input is a data frame

Assert input is a data frame

## Usage

``` r
assert_dataframe(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An object

- msg:

  A character string containing the error message to display if `x` is
  not a data frame

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is a data frame, otherwise aborts with the error
message specified by `msg`

## Examples

``` r
try({
assert_dataframe(mtcars) # Passes
assert_dataframe(data.frame()) # Passes

assert_dataframe(1:10) # Throws default error
assert_dataframe(matrix(1:6, 2, 3)) # Throws default error
assert_dataframe(c(1, 2, 3)) # Throws default error: "Error
assert_dataframe(list(a = 1, b = 2)) # Throws default error
assert_dataframe(factor(c(1, 2, 3))) # Throws default error

assert_dataframe(1:10, msg = "Custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   '1:10' must be a data.frame, not a integer

```
