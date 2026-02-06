# Has Extension

Has Extension

## Usage

``` r
has_extension(x, extensions, compression = FALSE)
```

## Arguments

- x:

  object to test

- extensions:

  valid extensions (character vector). Do not include the '.', e.g.
  supply `extensions = 'txt'` not `extensions = '.txt'`

- compression:

  should compression extension ‘.gz’, ‘.bz2’ or ‘.xz’ be removed first?

## Value

TRUE if all x have valid extensions as supplied by `extensions` (flag)
