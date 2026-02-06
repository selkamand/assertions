# Create an assertion function

This function creates an assertion function that can be used to check
the validity of an input. All assertions provided with this package are
created using either `assert_create()` or
[`assert_create_chain()`](assert_create_chain.md)

## Usage

``` r
assert_create(func, default_error_msg = NULL)
```

## Arguments

- func:

  A function defining the assertion criteria. This function should
  return a logical value (`TRUE` when assertion is passed or `FALSE`
  when it fails). Alternatively, instead of returning FALSE, you can
  return a string which will act as the error message. In this latter
  case, you don't need to supply a `default_error_msg`

- default_error_msg:

  A character string providing an error message in case the assertion
  fails. Must be supplied if function `func` returns `FALSE` when
  assertion fails (as opposed to a string) Can include the following
  special terms

  1.  `{arg_name}` to refer to the name of the variable supplied to the
      assertion.

  2.  `{arg_value}` to refer to the value of the variable supplied to
      the assertion

  3.  `{code_to_evaluate}` to evaluate the code within the error
      message. Replace `code_to_evaluate` with your code

  4.  `{.strong bold_text}` to perform inline formatting. Replace
      `bold_text` with your text. See [cli
      documentation](https://cli.r-lib.org/reference/inline-markup.html)
      for details

## Value

An assertion function.

## Examples

``` r
#' # Create an assertion function that checks that a character string is all
# lower case
assert_character <- assert_create(
  is.character,
  "{arg_name} must be a character vector, not a {class(arg_value)}"
)

# Use the assertion function
try({
is_lower("hello") # Returns invisible TRUE
is_lower("Hello") # Aborts the function with the error message
})
#> Error in is_lower("hello") : could not find function "is_lower"
```
