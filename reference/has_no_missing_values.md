# Check if a vector has no missing values

This function returns a logical value indicating whether the input
vector contains no missing values (`NA`).

## Usage

``` r
has_no_missing_values(x)
```

## Arguments

- x:

  A vector.

## Value

A logical value indicating whether the input vector contains no missing
values.

## Examples

``` r
if(interactive()){
has_no_missing_values(c(1, 2, 3))  # returns TRUE
has_no_missing_values(c(1, NA, 2))  # returns FALSE
}
```
