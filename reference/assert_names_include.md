# Assert that the input object includes a specified name

Assert that the input object includes a specified name

## Usage

``` r
assert_names_include(
  x,
  names,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  An object to check for the presence of specific names

- names:

  A character vector of names to check for in `x`

- msg:

  A character string containing the error message to display if any of
  the `names` are not present in `x`

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if all `names` are present in `x`, otherwise aborts with
the error message specified by `msg`

## Examples

``` r
try({
x <- list(a = 1, b = 2, c = 3)

assert_includes_name(x, "a") # Passes
assert_includes_name(x, c("a", "b")) # Passes
assert_includes_name(x, c("a", "b", "d")) # Throws default error message

assert_includes_name(x, c("a", "b", "d"), "Custom error message") # Throws custom error message
})
#> Error in assert_includes_name(x, "a") : 
#>   could not find function "assert_includes_name"
```
