# Check if a numeric vector is less than a specified maximum value

This function checks if a numeric vector is less than a specified
maximum value. It can also optionally check if all elements of the
vector must be less than the maximum value or if only one element is
sufficient

## Usage

``` r
is_less_than(x, maximum)
```

## Arguments

- x:

  a numeric vector to check

- maximum:

  The maximum value to compare against

## Value

A logical value indicating whether all elements of the numeric vector x
are less than the specified maximum value

## Examples

``` r
if(interactive()){
is_less_than(c(1,2,3), 4) # TRUE
is_less_than(c(1,2,3), 2) # FALSE
is_less_than(c(1,2,4), 3) # FALSE
}
```
