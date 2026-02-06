# Check if x is a string

This function is designed for use with `assert_create`. It returns TRUE
for the assertion to pass or a string representing the error message if
the assertion should fail.

## Usage

``` r
is_string_advanced(x)
```

## Arguments

- x:

  A value to be checked

## Value

Returns invisible(TRUE) if x is a character value with length 1. Returns
a string with an error message if x is not a character value or has a
length other than 1.
