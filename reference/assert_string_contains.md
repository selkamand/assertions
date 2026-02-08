# Assert string contains a regex pattern

Assert a string matches a regex pattern.

## Usage

``` r
assert_string_contains(
  x,
  pattern,
  ignore.case = FALSE,
  perl = FALSE,
  fixed = FALSE,
  useBytes = FALSE,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  An object to check

- pattern:

  A regular expression pattern (string)

- ignore.case, perl, fixed, useBytes:

  Logical flags passed to [`grepl()`](https://rdrr.io/r/base/grep.html)

- msg:

  A character string containing the error message to display if `x` does
  not match `pattern`

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` matches `pattern`, otherwise aborts with the
error message specified by `msg`

## Examples

``` r
try({
assert_string_contains("abc", "^a") # Passes
assert_string_contains("abc", "^b") # Throws default error
assert_string_contains("abc", "^b", msg = "Custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : '"abc"' must match regex `^b`
```
