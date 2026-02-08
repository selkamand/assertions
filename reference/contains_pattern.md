# Check if strings contain a regex pattern

This helper checks whether all elements of a character vector match a
regex pattern.

## Usage

``` r
contains_pattern(
  x,
  pattern,
  ignore.case = FALSE,
  perl = FALSE,
  fixed = FALSE,
  useBytes = FALSE
)
```

## Arguments

- x:

  A character vector to check

- pattern:

  A regular expression pattern (string)

- ignore.case, perl, fixed, useBytes:

  Logical flags passed to [`grepl()`](https://rdrr.io/r/base/grep.html)

## Value

TRUE if all strings in `x` match `pattern`, otherwise FALSE or a string
error message.
