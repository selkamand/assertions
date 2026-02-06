# Check if a numeric vector is greater than or equal to a specified minimum value

This function checks if a numeric vector is greater than or equal to a
specified minimum value. It can also optionally check if all elements of
the vector must be greater than or equal to the minimum value or if only
one element is sufficient

## Usage

``` r
is_greater_than_or_equal_to(x, minimum)
```

## Arguments

- x:

  a numeric vector to check

- minimum:

  The minimum value to compare against

## Value

A logical value indicating whether all elements of the numeric vector x
are greater than or equal to the specified minimum value

## Examples

``` r
if(interactive()){
is_greater_than_or_equal_to(c(2,3,4), 1) # TRUE
is_greater_than_or_equal_to(c(2,3,4), 2) # TRUE
is_greater_than_or_equal_to(c(2,3,1), 3) # FALSE
}
```
