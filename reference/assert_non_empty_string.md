# Assert input is a non empty character string

Asserts input is a string, and nonempty (i.e. not equal to ”)

## Usage

``` r
assert_non_empty_string(
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
  a

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if x is a character vector, otherwise aborts with the
error message specified by msg

## Examples

``` r
try({
assert_non_empty_string("a") # Passes
assert_non_empty_string("") # Fails
})
#> Error in eval(expr, envir) : 
#>   '""' is an empty string!

```
