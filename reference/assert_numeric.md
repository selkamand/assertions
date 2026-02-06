# Assert input is numeric

Assert an R object is numeric Works for **vector** and **matrix**
objects. To assert an object is specifically a **numeric vector** see
[`assert_numeric_vector()`](assert_numeric_vector.md)

## Usage

``` r
assert_numeric(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An object

- msg:

  A character string containing the error message to display if `x` is
  not numeric

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is numeric, otherwise aborts with the error
message specified by `msg`

## Examples

``` r
try({
assert_numeric(1:3) # Passes
assert_numeric(1.5:5.5) # Passes
assert_numeric(c("a", "b", "c")) # Throws default error
assert_numeric(c("a", 1, "b"), "Custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   'c("a", "b", "c")' must be numeric, not a character

```
