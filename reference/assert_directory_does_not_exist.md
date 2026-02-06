# Assert a directory does not exist

Assert that a directory does not already exist. Useful for avoiding
overwriting. This function is an exact copy of
[`assert_file_does_not_exist()`](assert_file_does_not_exist.md) and
included to make assertion code more readable.

## Usage

``` r
assert_directory_does_not_exist(
  x,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  Path to a file (string)

- msg:

  A character string containing the error message if file `x` already
  exists

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if directory `x` does not already exist, otherwise
aborts with the error message specified by `msg`

## Examples

``` r
real_dir <- system.file("tests", package = "assertions")

try({
assert_directory_does_not_exist("foo") # Passes
assert_directory_does_not_exist(real_dir) # Throws error
assert_directory_does_not_exist(c("foo", "bar")) # Throws Error (single file only)
})
#> Error in eval(expr, envir) : 
#>   'c("foo", "bar")' is not a string! (length is 2, not 1)
```
