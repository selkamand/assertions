# Check object is some class

This function checks whether object is a specific class

## Usage

``` r
has_class(x, class)
```

## Arguments

- x:

  A value to check.

- class:

  checks if `x` belongs to `class`. If multiple values of `class` are
  supplied, returns whether `x` belongs to any of them (character)

## Value

A logical scalar indicating `x` belongs to `class`

## Examples

``` r
if(interactive()) {
  has_class(1, "numeric") # TRUE
  has_class(1, "character") # FALSE
}
```
