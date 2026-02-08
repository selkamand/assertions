# Assert function expects specific parameter names

Assert that a function signature includes required set of parameter
names in its formal argument list, regardless of whether those
parameters have default values. The `...` argument is ignored.

## Usage

``` r
assert_function_expects(
  x,
  required,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  a function to check for required parameter names

- required:

  a character vector of parameter names that must appear in the function
  signature (order does not matter)

- msg:

  The error message thrown if the assertion fails (string)

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if function `x` declares all required parameters,
otherwise aborts with the error message specified by `msg`

## Examples

``` r
my_fun <- function(x, y = 1, ...) x + y
assert_function_expects(my_fun, c("x", "y"))

try({
  assert_function_expects(my_fun, c("x", "z"))
})
#> Error in eval(expr, envir) : 
#>   Function 'my_fun' is missing the following parameter in its signature:
#> `z`
```
