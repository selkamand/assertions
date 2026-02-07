# Check if a numeric vector is between a specified minimum and maximum value

This function checks if a numeric vector is between a specified minimum
and maximum value. It can also optionally check if all elements of the
vector must be between the thresholds or if only one element is
sufficient

## Usage

``` r
is_between(x, minimum, maximum, inclusive = TRUE)
```

## Arguments

- x:

  a numeric vector to check

- minimum:

  The minimum value to compare against

- maximum:

  The maximum value to compare against

- inclusive:

  should comparisons allow equality with the minimum and maximum values?
  (flag)

## Value

A logical value indicating whether all elements of the numeric vector x
are between the specified minimum and maximum values

## Examples

``` r
if(interactive()){
is_between(c(2,3,4), 1, 4) # TRUE
is_between(c(2,3,4), 2, 4) # TRUE
is_between(c(2,3,1), 2, 4) # FALSE
}
```
