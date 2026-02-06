# Check if an object contains required elements

This function checks that `x` includes all of the `required` elements.
`x` must be the same type as `required`. Factors are treated as
character vectors.

## Usage

``` r
includes_advanced(x, required)
```

## Arguments

- x:

  An object to check

- required:

  The required elements to check for

## Value

Returns TRUE if `x` is the same type as `required` and `x` includes all
the `required` elements. Otherwise returns a string representing the
appropriate error message to display
