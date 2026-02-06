# Assert all files are directories

Assert that all paths supplied exist and are directories. To assert a
single directory exists, see
[`assert_directory_exists()`](assert_directory_exists.md)

## Usage

``` r
assert_all_directories_exist(
  x,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  Paths to directories (character)

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
assert_directory(system.file("package = assertions")) # PASSES
assert_directory("foo") # Throws Error
})
#> Error in assert_directory(system.file("package = assertions")) : 
#>   could not find function "assert_directory"
```
