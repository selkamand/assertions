# Count the number of duplicated values in a vector

This function returns the number of duplicated values in the input
vector.

## Usage

``` r
util_count_duplicates(x)
```

## Arguments

- x:

  A vector.

## Value

The number of duplicated values in the input vector.

## Examples

``` r
if(interactive()) {
util_count_duplicates(c(1, 2, 2))  # returns 1
util_count_duplicates(c(1, 2, 3))  # returns 0
}
```
