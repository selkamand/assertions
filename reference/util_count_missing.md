# Count the number of missing values in a vector

This function returns the number of missing values (`NA`) in the input
vector.

## Usage

``` r
util_count_missing(x)
```

## Arguments

- x:

  A vector.

## Value

The number of missing values in the input vector.

## Examples

``` r
if(interactive()){
util_count_missing(c(1, 2, 3))  # returns 0
util_count_missing(c(1, NA, 2))  # returns 1
}
```
