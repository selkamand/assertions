# Assert function expects n arguments

Assert a function expects n arguments, with user control over how
variable arguments (...) are counted (default throws error)

## Usage

``` r
assert_function_expects_n_arguments(
  x,
  n,
  dots = c("throw_error", "count_as_0", "count_as_1", "count_as_inf"),
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  a function to check has exactly N arguments

- n:

  number of arguments that must be expected by function to pass
  assertion (integer)

- dots:

  how to deal with '...' dots (a.k.a variable arguments). Should we
  count as 0, 1 or infinite arguments. Or, do we just throw an error
  when we see '...' (default)

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

invisible(TRUE) if function `x` expects exactly n arguments, otherwise
aborts with the error message specified by `msg`
