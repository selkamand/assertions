# Assert input is a database connection

Assert the input object is a database connection, specifically of the
"DBIConnection" class, which is the standard virtual class used by the
DBI package for database connections. Note this assertion does not test
if the database connection is valid and/or active.

## Usage

``` r
assert_connection(x, msg = NULL, call = rlang::caller_env(), arg_name = NULL)
```

## Arguments

- x:

  An object to assert is a database connection

- msg:

  A custom error message displayed if `x` is not a valid database
  connection.

- call:

  Only relevant when pooling assertions into multi-assertion helper
  functions. See
  [cli_abort](https://cli.r-lib.org/reference/cli_abort.html) for
  details.

- arg_name:

  Advanced use only. Name of the argument passed (default: NULL, will
  automatically extract arg_name).

## Value

`invisible(TRUE)` if `x` is a valid database connection, otherwise
aborts with an error message.

## Details

This function is designed for use with objects inheriting from the
"DBIConnection" class, which is used widely across database connection
implementations in R. As other database interface packages are
introduced, additional checks may be added to support other connection
classes.

## Examples

``` r
try({
  # Assuming a valid DBI connection `conn`:
  assert_connection(conn) # Passes if `conn` is a DBI connection

  assert_connection(42) # Fails with error message
})
#> Error in eval(match.call()[[2]], envir = call) : object 'conn' not found
```
