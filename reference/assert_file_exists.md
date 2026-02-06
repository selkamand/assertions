# Assert a file exists

Assert that a file exists. To assert all files in a vector exist, see
[`assert_all_files_exist()`](assert_all_files_exist.md)

## Usage

``` r
assert_file_exists(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  Path to a file (string)

- msg:

  A character string containing the error message if file `x` is does
  not exist

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if file `x` exists, otherwise aborts with the error
message specified by `msg`

## Examples

``` r
real_file <- system.file("DESCRIPTION", package = "assertions")

try({
assert_file_exists(real_file) # PASSES
assert_file_exists("foo") # Throws Error
assert_file_exists(c(real_file, real_file)) # Throws Error (should use assert_all_files_exist)

})
#> Error in eval(expr, envir) : Failed to find file: foo
```
