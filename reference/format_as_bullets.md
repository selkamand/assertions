# Preprocess character vectors for cli::cli_abort()

The `format_as_bullets` function is used for preprocessing character
vectors by adding names. These names are used to denote bullet points
when the character vector is passed to
[`cli::cli_abort()`](https://cli.r-lib.org/reference/cli_abort.html).
This allows for the easy creation of bullet point lists in error
messages. The bullet argument allows the user to specify the desired
bullet point symbol. The default bullet point symbols are: \*, \>, , x,
v, i, and !.

## Usage

``` r
format_as_bullets(x, bullet = c("*", ">", " ", "x", "v", "i", "!"))
```

## Arguments

- x:

  A list of character strings

- bullet:

  One of ”, '\>', ' ', 'x', 'v', 'i', '!' (default: ”) The character to
  use as the bullet point for each element of x.

## Value

A character string with each element of x formatted as a bullet point
