# Assert input is a numeric vector

Assert input is a numeric vector

## Usage

``` r
assert_numeric_vector(
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
  not a numeric vector

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is a numeric vector, otherwise aborts with the
error message specified by `msg`
