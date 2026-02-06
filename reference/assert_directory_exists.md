# Assert are directory exists

Assert a directory exists. To assert all directories in a vector exist,
see [`assert_all_directories_exist()`](assert_all_directories_exist.md)

## Usage

``` r
assert_directory_exists(
  x,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  Path to a directory (string)

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

invisible(TRUE) if `x` is exists and is a directory, otherwise aborts
with the error message specified by `msg`

## Examples

``` r
try({
assert_directory_exists(system.file("package = assertions")) # PASS
assert_all_directories_exist("foo") # Throws Error
})
#> Error in eval(expr, envir) : Failed to find directory:
```
