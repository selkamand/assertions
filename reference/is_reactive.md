# Check if a value is reactive

This function checks if a value is reactive

## Usage

``` r
is_reactive(x)
```

## Arguments

- x:

  A value to check.

## Value

A logical scalar indicating whether `x` is a list.

## Examples

``` r
if(interactive()){
is_reactive(shiny::reactive(1)) # TRUE
is_reactive(1) # FALSE
}
```
