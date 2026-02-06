# Check if x is a flag

This function is designed for use with `assert_create_advanced`. It must
return TRUE for the assertion to pass or a string representing the error
message if the assertion should fail.

## Usage

``` r
is_flag_advanced(x)
```

## Arguments

- x:

  A value to be checked

## Value

Returns invisible(TRUE) if x is a logical value with length 1. Returns a
string with an error message if x is not a logical value or has a length
other than 1.
