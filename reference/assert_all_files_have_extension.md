# Assert file extensions

Assert that all filepaths supplied have one of the selected extensions.
Does not require file to actually exist.

## Usage

``` r
assert_all_files_have_extension(
  x,
  extensions,
  compression = FALSE,
  msg = NULL,
  call = rlang::caller_env(),
  arg_name = NULL
)
```

## Arguments

- x:

  An object

- extensions:

  valid extensions (character vector). Do not include the '.', e.g.
  supply `extensions = 'txt'` not `extensions = '.txt'`

- compression:

  should compression extension ‘.gz’, ‘.bz2’ or ‘.xz’ be removed first?

- msg:

  A character string containing the error message if file `x` does not
  have the specified extensions

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

invisible(TRUE) if `x` has any of the specified extensions, otherwise
aborts with the error message specified by `msg`

## Examples

``` r
try({
assert_all_files_have_extension(c("foo.txt", "bar.txt"), extensions = "txt") # Passes
assert_all_files_have_extension(c("foo.txt", "bar.csv"), extensions = "csv") # Throws Error
})
#> Error in eval(expr, envir) : 
#>   'c("foo.txt", "bar.csv")' has an invalid extension (required
#> extension/s: csv). The following file has an unexpected extension: [foo.txt]
```
