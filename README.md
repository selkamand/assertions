
<!-- README.md is generated from README.Rmd. Please edit that file -->

# assertions <a href="https://selkamand.github.io/assertions/"><img src="man/figures/logo.png" align="right" height="138"/></a>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/selkamand/assertions/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/selkamand/assertions/actions/workflows/R-CMD-check.yaml)
[![](https://img.shields.io/github/languages/code-size/selkamand/assertions.svg)](https://github.com/selkamand/assertions)
[![](https://img.shields.io/github/last-commit/selkamand/assertions.svg)](https://github.com/selkamand/assertions/commits/main)
[![Closed
issues](https://img.shields.io/github/issues-closed/selkamand/assertions.svg)](https://github.com/selkamand/assertions/issues?q=is%3Aissue+is%3Aclosed)
[![](http://cranlogs.r-pkg.org/badges/last-month/assertions)](https://cran.r-project.org/package=assertions)
[![](http://cranlogs.r-pkg.org/badges/grand-total/assertions)](https://cran.r-project.org/package=assertions)

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

``` r
install.packages("assertions")
```

### Development version

To get a bug fix or to use a feature from the development version, you
can install the development version of assertions from GitHub.

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

Creating your own assertion functions is extremely easy

Just use `assert_create()`, you just need to supply:

1.  a function that returns TRUE/FALSE when assertion should PASS/FAIL

2.  a default error message

**How about an example?**

``` r
# Create a function that asserts input is lowercase 
assert_lowercase <- assert_create(
  func = function(x) {x == tolower(x)}, 
  default_error_msg = "'{arg_name}' must be entirely lowercase" 
)

#Assertion passes if input is lowercase
assert_lowercase("all lower case")

#But throws the expected error if uppercase characters are present
assert_lowercase("NOT all lower case") 
```

See `?assert_create()` for details

## Vectorised assertions

Assertions may have *vectorised* versions that test whether *all*
elements in a vector/matrix meet a condition.

For example:

- `assert_greater_than()` expects a single number as an input

- `assert_all_greater_than()` works on vectors/matrices.

Vectorised functions have the `assert_all_` prefix.

## Contributing to this package

Two options

### Request an assertion

1.  Open a github issue and request away. I’m happy to implement a tonne
    more assertions, just let me know what you want

### Creating assertions yourself

1.  Create a custom `assert_something` function with a call to
    `assert_create()` or `assert_create_chain()`

2.  Create a github issue with the assertion creation code + any helper
    function you pass to the `func` argument (e.g. `is_something()`)

## Similar Packages

Great alternative packages for writing assertions include:

- [`assertthat`](https://github.com/hadley/assertthat)
- [`checkmate`](https://github.com/mllg/checkmate)
- [`assertive`](https://bitbucket.org/richierocks/assertive)
- [`ensurer`](https://github.com/smbache/ensurer)

Each package has its own features and syntax. So hopefully there is one
that suits your needs and preferences. I’m a big fan of `checkmate` for
its speed, `assertive` for its huge library of ready-made assertion
functions, and `assertthat` for its error message customization.
