# Get the duplicated values in a vector

This function returns a vector of the duplicated values in the input
vector.

## Usage

``` r
util_get_duplicated_values(x)
```

## Arguments

- x:

  A vector.

## Value

A vector of the duplicated values in the input vector.

## Examples

``` r
if(interactive()) {
util_get_duplicated_values(c(1, 2, 2))  # returns 2
util_get_duplicated_values(c(1, 2, 3))  # returns NULL
}
```
