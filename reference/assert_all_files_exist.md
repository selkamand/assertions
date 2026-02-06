# Assert that all files exist

Assert all files in vector exist. To assert a single file exists, see
[`assert_file_exists()`](assert_file_exists.md)

## Usage

``` r
assert_all_files_exist(
  x,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  Paths to files (character)

- msg:

  A character string containing the error message if any files in `x` is
  does not exist

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if all files in `x` exist, otherwise aborts with the
error message specified by `msg`

## Examples

``` r
real_file <- system.file("DESCRIPTION", package = "assertions")

try({
assert_all_files_exist(c(real_file, real_file))
assert_all_files_exist(c("foo", "bar")) # Throws Error
})
#> Error in eval(expr, envir) : 
#>   Failed to find files: foo and bar
```
