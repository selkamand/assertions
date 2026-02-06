# Create Chains of Assertions

Combine multiple assertion functions created by
[`assert_create()`](assert_create.md) into a single assertion function
with diverse failure modes and error messages.

## Usage

``` r
assert_create_chain(...)
```

## Arguments

- ...:

  assertion functions created by [`assert_create()`](assert_create.md).

## Value

A single assertion function that calls each of the input functions in
the order they are supplied.

## Examples

``` r
# Create an assertion function that checks for both positive integers and even values
assert_string <- assert_create_chain(
  assert_create(is.character, '{{arg_name}} must be a character'),
  assert_create(function(x){{ length(x)==1 }}, '{{arg_name}} must be length 1')
  )

# Use the assertion function to check a valid value
assert_string("String")

# Use the assertion function to check an invalid value
try({
assert_string(3)
# Output: Error: '3' must be a character
})
#> Error in eval(expr, envir) : {arg_name} must be a character
```
