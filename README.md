
<!-- README.md is generated from README.Rmd. Please edit that file -->

# assertions <a href="https://selkamand.github.io/assertions/"><img src="man/figures/logo.png" align="right" height="138"/></a>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/assertions)](https://CRAN.R-project.org/package=assertions)
[![Codecov test
coverage](https://codecov.io/gh/selkamand/assertions/branch/main/graph/badge.svg)](https://app.codecov.io/gh/selkamand/assertions?branch=main)
[![R-CMD-check](https://github.com/selkamand/assertions/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/selkamand/assertions/actions/workflows/R-CMD-check.yaml)

<!-- badges: end -->

Simple assertions with sensible defaults and customisable error
messages.

## Overview

The goals with assertions are to provide

1.  Convenient assertion calls (e.g. `assert_number()`)

2.  A general `assert` function that asserts any possible condition/s
    and throws informative error messages

3.  Extremely user friendly error message defaults.

4.  Easily customisable error messages, with inline code evaluation &
    styling powered by the `cli` package

5.  Simple creation of custom assertion functions with user-specified
    defaults

## Installation

You can install the development version of assertions like so

``` r
# install.packages('remotes')
remotes::install_github('selkamand/assertions')
```

## Quick Start

All assertions start with `assert`, which means you just type it in and
levarage autocomplete suggestions to look through all available options

``` r
# Load library
library(assertions)

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

## Create your own assertion functions

Have a custom assertion you want to use repeatedly?

Creating your own assertion functions is extremely eas

Just use `assert_create()`, you just need to supply:

1.  a function that returns TRUE/FALSE when assertion should PASS/FAIL

2.  a default error message

**How about an example?**

See `?assert_create()` for details

## Contributing to this package

Two options

### Request an assertion

1.  Open a github issue and request away. I’m happy to implement a tonne
    more assertions, just let me know what you want

### Creating assertions yourself

1.  Create a custom `assert_something` function with a call to
    `assert_create()` or `assert_create_advanced()`

2.  Create a github issue with the assertion creation code + any helper
    function you pass to the `func` argument (e.g. `is_something()`)

## Similar Packages

Great alternative packages for writing assertions include:

- [`assertthat`](https://github.com/ropensci/assertthat)
- [`checkmate`](https://github.com/HenrikBengtsson/checkmate)
- [`assertive`](https://github.com/assertive/assertive)
- [`ensurer`](https://github.com/HenrikBengtsson/ensurer)

Each package has its own features and syntax. Choose whichever best fits
your needs and preferences. To find the best fit, try out a few options
and consider the speed, default error messages, flexibility, and breadth
of assertions available.
