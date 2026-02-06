# Assert input is a character vector

Assert an R object is a 'character' type. Works for **vector** and
**matrix** objects. To assert an object is specifically a **character
vector** see [`assert_character_vector()`](assert_character_vector.md)

## Usage

``` r
assert_character(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
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
assert_character("a") # Passes
assert_character("a") # Passes
assert_character(c("a", "b", "c")) # Passes
assert_character(matrix(c('A', 'B', 'C', 'D')))  # Passes
assert_character(1:3) # Throws default error
assert_character(c("a", 1, "b"), "Custom error message") # Throws custom error
})
#> Error in eval(expr, envir) : 
#>   '1:3' must be a character, not a integer

```
