# Assert function is variadic

Assert that a function signature declares the `...` argument (variadic
arguments).

## Usage

``` r
assert_function_variadic(
  x,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  a function to check includes `...` in its signature

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

invisible(TRUE) if function `x` declares `...`, otherwise aborts with
the error message specified by `msg`

## Examples

``` r
my_fun <- function(x, ...) x
assert_function_variadic(my_fun)

try({
  my_fun_no_dots <- function(x) x
  assert_function_variadic(my_fun_no_dots)
})
#> Error in eval(expr, envir) : 
#>   'my_fun_no_dots' must accept variable arguments via ...
```
