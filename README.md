
<!-- README.md is generated from README.Rmd. Please edit that file -->

# assertcli

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/assertcli)](https://CRAN.R-project.org/package=assertcli)
[![Codecov test
coverage](https://codecov.io/gh/selkamand/assertcli/branch/main/graph/badge.svg)](https://app.codecov.io/gh/selkamand/assertcli?branch=main)
[![R-CMD-check](https://github.com/selkamand/assertcli/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/selkamand/assertcli/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

Simple assertions with sensible defaults and customisable error
messages.

## Overview

The goals with assertcli are to provide

1.  Convenient assertion calls (e.g. `assert_number()`)

2.  A general `assert` function that asserts any possible condition/s
    and throws informative error messages

3.  Extremely user friendly error message defaults.

4.  Easily customisable error messages, with inline code evaluation &
    styling powered by the `cli` package

## Installation

You can install the development version of assertcli like so

``` r
# install.packages('remotes')
remotes::install_github('assertcli')
```

## Quick Start

All assertions start with `assert`, which means you just type it in and
levarage autocomplete suggestions to look through all available options

``` r
# Load library
library(assertcli)

# Use premade assertions
assert_character(c('a', 'b', 'c'))
assert_number(2)
assert_flag(TRUE)

# Assert anything 
assert(1000 % 2 == 0)

# Assert multiple conditions at once (all must be true)
assert(1000 % 2 == 0, 6/2 == 3)
```

## Customizing Error Messages

``` r
# Customise any error messages using the `msg` argument
assert_number("A", msg = "Please supply a number!")

# Evaluate code in your error message using '{}' operators
foo = "A"
assert_number(foo, msg = "'{foo}' is not a number :(. Try again")

# Emphasise cetain words in error using {.strong text_to_emphasise}
assert_number("A", msg = "{.strong Try again}")
```

For advanced customisation, see [cli
documentation](https://cli.r-lib.org/reference/inline-markup.html?q=.strong#classes)

## Similar Packages

Great alternative packages for writing assertions include:

- [`assertthat`](https://github.com/ropensci/assertthat)
- [`checkmate`](https://github.com/HenrikBengtsson/checkmate)
- [`assertive`](https://github.com/assertive/assertive)
- [`ensurer`](https://github.com/HenrikBengtsson/ensurer)

Each package has its own features and syntax, and users can choose the
one that best fits their needs and preferences. To find the best fit, it
can be helpful to try out a few options and consider the default error
messages, flexibility, and included assertion capabilities.
