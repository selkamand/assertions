# Assert packages are installed

Assert that one or more packages are installed.

## Usage

``` r
assert_packages_installed(
  x,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  Package name(s) (character vector)

- msg:

  A character string containing the error message to display if the
  package is not installed

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is installed, otherwise aborts with the message
specified by `msg`

## Examples

``` r
try({
assert_packages_installed("stats") # Passes
assert_packages_installed(c("stats", "utils")) # Passes
assert_packages_installed("notapackage123") # Throws Error
})
#> Error in eval(expr, envir) : 
#>   Missing the required package: notapackage123. Please install and try
#> again.
```
