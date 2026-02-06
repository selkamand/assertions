# Assert input is a character vector

Assert an object is a character vector. Length 1 character vectors
(strings) are considered vectors.

## Usage

``` r
assert_character_vector(
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
  not a character vector

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` is a character vector, otherwise aborts with the
error message specified by `msg`

## Examples

``` r
try({
assert_character_vector(c("a", "b", "c")) # Passes
assert_character_vector(c("a", 1, "b")) # Throws default error
assert_character_vector(matrix(c('A', 'B', 'C', 'D')))  # Throws error since type = matrix
assert_character_vector(c("a", 1, "b"), "Custom error message") # Throws custom error
assert_character_vector(glue::glue('A')) # Throws error
})
#> Error in eval(expr, envir) : 
#>   'matrix(c("A", "B", "C", "D"))' must be a character vector, not a matrix
#> and array

```
