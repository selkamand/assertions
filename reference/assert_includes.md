# Assert object includes required

Assert x includes required elements

## Usage

``` r
assert_includes(
  x,
  required,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  An object

- required:

  The required elements to check for

- msg:

  A character string describing the error message if `x` does not
  include `required` elements

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` includes all `required` elements, otherwise
aborts with the error message specified by `msg`

## Examples

``` r
try({
assert_directory(system.file("package = assertions"))
assert_directory("foo") # Throws Error
})
#> Error in assert_directory(system.file("package = assertions")) : 
#>   could not find function "assert_directory"
```
