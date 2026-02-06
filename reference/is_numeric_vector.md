# Check if an object is a numeric vector

This function checks if an object is a numeric vector in R.

## Usage

``` r
is_numeric_vector(x)
```

## Arguments

- x:

  An object to check.

## Value

A logical value indicating whether `x` is a numeric vector.

## Examples

``` r
if(interactive()){
is_numeric_vector(c(1, 2, 3)) # TRUE
is_numeric_vector(list(1, 2, 3)) # FALSE
is_numeric_vector(1:5) # TRUE
is_numeric_vector("hello") # FALSE
is_numeric_vector(list(1, 2, "a")) # FALSE
}
```
