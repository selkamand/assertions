# Assert a file does not exist

Assert that a file does not exist. Useful for avoiding overwriting.

## Usage

``` r
assert_file_does_not_exist(
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

invisible(TRUE) if file `x` does not exist, otherwise aborts with the
error message specified by `msg`

## Examples

``` r
real_file <- system.file("DESCRIPTION", package = "assertions")

try({
assert_file_does_not_exist("foo") # Passes
assert_file_does_not_exist(real_file) # Throws error
assert_file_does_not_exist(c("foo", "bar")) # Throws Error (single file only)
})
#> Error in eval(expr, envir) : 
#>   File (/home/runner/work/_temp/Library/assertions/DESCRIPTION) already
#> exists
```
