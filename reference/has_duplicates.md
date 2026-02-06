# Check if a vector has duplicates

This function returns a logical value indicating whether the input
vector contains duplicated elements.

## Usage

``` r
has_duplicates(x)
```

## Arguments

- x:

  A vector.

## Value

A logical value indicating whether the input vector contains duplicated
elements.

## Examples

``` r
if(interactive()){
has_duplicates(c(1, 2, 3))  # returns FALSE
has_duplicates(c(1, 2, 2))  # returns TRUE
}
```
