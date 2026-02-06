# Assert input is a number

A number is a length 1 numeric vector. Numbers can be either integers or
doubles.

## Usage

``` r
assert_number(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An object

- msg:

  A character string containing the error message to display if x is not
  a number

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if x is a number, otherwise aborts with the error
message specified by msg

## Examples

``` r
assert_number(2) # Passes
try({
assert_number(c(2, 3)) # Throws default error
assert_number("a") # Throws default error
assert_number(c("a", 1, "b"), "Custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   'c(2, 3)' is not a number! (length is 2, not 1)

```
