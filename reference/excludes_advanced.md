# Check if an object does not contain prohibited elements

This function checks that `x` does not include any of the `illegal`
elements. `x` must be the same type as `illegal`. Factors are treated as
character vectors.

## Usage

``` r
excludes_advanced(x, illegal)
```

## Arguments

- x:

  An object to check

- illegal:

  The prohibited elements to check for

## Value

Returns TRUE if `x` is the same type as `illegal` and `x` does not
include any of the `illegal` elements. Otherwise returns a string
representing the appropriate error message to display
