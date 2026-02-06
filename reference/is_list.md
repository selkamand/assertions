# Check if a value is a list

This function checks if a value is a list. By default, definition of a
'list' excludes data.frames in spite of them technically being lists.
This behaviour can be changed by setting `include_dataframes = TRUE`

## Usage

``` r
is_list(x, include_dataframes = FALSE)
```

## Arguments

- x:

  A value to check.

- include_dataframes:

  A logical indicating whether data_frames should be considered vectors.
  Default is `FALSE`.

## Value

A logical scalar indicating whether `x` is a list.

## Examples

``` r
if(interactive()){
is_list(list(1, 2)) # TRUE
is_list(c(1, 2, 3)) # FALSE
is_list(data.frame()) # FALSE
is_list(data.frame(), include_dataframes = TRUE) # TRUE
}
```
