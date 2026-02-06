# Assert object belongs to class

This function asserts that the input object belongs to `class`

## Usage

``` r
assert_class(x, class, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An input object

- class:

  checks if `x` belongs to `class`. If multiple values of `class` are
  supplied, returns whether `x` belongs to any of them (character)

- msg:

  A character string containing the error message to display if `x` does
  not belong to `class`

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` belongs to `class`, otherwise aborts with the
error message specified by `msg`

## Examples

``` r
try({
assert_has_class(1, "numeric")  # Passes
assert_has_class(1, "character")  # Throws default error
})
#> Error in assert_has_class(1, "numeric") : 
#>   could not find function "assert_has_class"
```
