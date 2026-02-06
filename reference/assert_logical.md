# Assert input is logical

Assert an R object is 'logical' (TRUE/FALSE). Works for **vector** and
**matrix** objects. To assert an object is specifically a **logical
vector** see [`assert_logical_vector()`](assert_logical_vector.md)

## Usage

``` r
assert_logical(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An object

- msg:

  A character string containing the error message to display if `x` is
  not logical

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is logical, otherwise aborts with the error
message specified by `msg`

## Examples

``` r
try({
assert_logical(TRUE) # Passes
assert_logical(c(TRUE, FALSE, TRUE)) # Passes
assert_logical(c("a", "b")) # Throws default error
assert_logical(1:3, "Custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   'c("a", "b")' must be logical, not a character


```
