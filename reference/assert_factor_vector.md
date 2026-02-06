# Assert input is a factor

Assert an R object is a factor. Note that no assert_factor function
exists since in R factors are always vector quantities (never scalar /
in matrices)

## Usage

``` r
assert_factor_vector(
  x,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  An object

- msg:

  A character string containing the error message to display if `x` is
  not a factor

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is a factor, otherwise aborts with the error
message specified by `msg`

## Details

Technically this function name is misleading, since
`is.vector(factor(1)) == FALSE` but since they act exactly like vectors
to end users, I think this name is the most suitable

## Examples

``` r
try({
assert_factor_vector(factor(c("a", "b", "c"))) # Passes
assert_factor_vector(c("a", "b", "c")) # Throws default error
assert_factor_vector(factor(c("a", "b", "c")), "Custom error message") # Passes
assert_factor_vector(1:3, "Custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   'c("a", "b", "c")' must be a factor, not a character
```
