# Check if a vector has missing values

This function returns a logical value indicating whether the input
vector contains missing values (`NA`).

## Usage

``` r
has_missing_values(x)
```

## Arguments

- x:

  A vector.

## Value

A logical value indicating whether the input vector contains missing
values.

## Examples

``` r
if(interactive()){
has_missing_values(c(1, 2, 3))  # returns FALSE
has_missing_values(c(1, NA, 2))  # returns TRUE
}
```
