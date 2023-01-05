
<!-- README.md is generated from README.Rmd. Please edit that file -->

# assertcli

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/assertcli)](https://CRAN.R-project.org/package=assertcli)

<!-- badges: end -->

Simple assertions with sensible defaults and customisable error
messages.

## Installation

You can install the development version of assertcli like so

``` r
# install.packages('remotes')
remotes::install_github('assertcli')
```

## Quick Start

All assertions start with `assert_`, so type it in and checkout
autocomplete for full list of options

``` r

# Use premade assertions
assert_character(c('a', 'b', 'c'))
assert_number(2)
assert_flag(TRUE)

# Custom any error messages"
assert_number("A") # Default
assert_number("A", msg = "Please supply a number!") # Custom Message
```

## Complete control over error messages

``` r

# Evaluate code in your error message using '{}' operators
foo = "A"
assert_number(foo, msg = "'{foo}' is not a number :(. Try again")


# Emphasise cetain words in error using {.strong text_to_emphasise}
assert_number("A", msg = "{.strong Try again}")
```

For advanced customisation, see [cli
documentation](https://cli.r-lib.org/reference/inline-markup.html?q=.strong#classes)
