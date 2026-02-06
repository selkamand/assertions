# Common Parameter Descriptions

Common Parameter Descriptions

## Usage

``` r
common_roxygen_params(call, arg_name, msg, ...)
```

## Arguments

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

- msg:

  The error message thrown if the assertion fails (string)

- ...:

  Used to pass any arguments to assertion function
