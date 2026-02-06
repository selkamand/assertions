# Check if a vector has no duplicates

This function returns a logical value indicating whether the input
vector contains no duplicated elements.

## Usage

``` r
has_no_duplicates(x)
```

## Arguments

- x:

  A vector.

## Value

A logical value indicating whether the input vector contains no
duplicated elements.

## Examples

``` r
if(interactive()){
has_no_duplicates(c(1, 2, 3))  # returns TRUE
has_no_duplicates(c(1, 2, 2))  # returns FALSE
}
```
