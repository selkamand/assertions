# Assert input is a list

Assert input is a list

## Usage

``` r
assert_list(
  x,
  include_dataframes = FALSE,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  An object

- include_dataframes:

  A logical indicating whether data_frames should be considered vectors.
  Default is `FALSE`.

- msg:

  A character string containing the error message to display if `x` is
  not a list

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is a list, otherwise aborts with the error
message specified by `msg`

## Examples

``` r
try({
# Assert that a variable is a list
x <- list(1, 2, 3)
assert_list(x)  # does nothing

# Assert that a variable is not a list
x <- "not a list"
assert_list(x)  # stops execution and prints an error message
})
#> Error in eval(expr, envir) : 
#>   'x' must be a list, not a character
```
