# Assert input is a character string

Assert input is a character string

## Usage

``` r
assert_string(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An object

- msg:

  A character string containing the error message to display if x is not
  a string

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if x is a string, otherwise aborts with the error
message specified by msg

## Examples

``` r
try({
assert_string("a") # Passes
assert_string(c("a", "b", "c")) # Throws default error
assert_string(1:3) # Throws default error
assert_string(c("a", 1, "b"), "Custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   'c("a", "b", "c")' is not a string! (length is 3, not 1)

```
