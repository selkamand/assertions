# Changelog

## assertions 0.2.0

CRAN release: 2024-11-19

- Added
  [`assert_function_expects()`](../reference/assert_function_expects.md)
  for checking required argument names in functions

- Added
  [`assert_function_variadic()`](../reference/assert_function_variadic.md)
  for checking whether functions declare `...`

- Added
  [`assert_all_strings_contain()`](../reference/assert_all_strings_contain.md)
  and
  [`assert_string_contains()`](../reference/assert_string_contains.md)
  for checking character inputs against regular expressions

- Added
  [`assert_packages_installed()`](../reference/assert_packages_installed.md)

- Added [`assert_all_between()`](../reference/assert_all_between.md) and
  [`assert_between()`](../reference/assert_between.md) assertions

- Added [`assert_all_finite()`](../reference/assert_all_finite.md) and
  [`assert_finite()`](../reference/assert_finite.md) for checking
  numeric inputs have no `NA`, `NaN`, or infinite values

- Improved factor support for
  [`assert_includes()`](../reference/assert_includes.md) and
  [`assert_excludes()`](../reference/assert_excludes.md)

- Added [`assert_connection()`](../reference/assert_connection.md)

- Added [`assert_set_equal()`](../reference/assert_set_equal.md)

- Added [`assert_one_of()`](../reference/assert_one_of.md)

- Added [`assert_scalar()`](../reference/assert_scalar.md)

- Added missing [`assert_less_than()`](../reference/assert_less_than.md)
  assertions.

- Added [`assert_null()`](../reference/assert_null.md) and
  [`assert_non_null()`](../reference/assert_non_null.md)

- Added [`assert_length()`](../reference/assert_length.md)

- Improved error messages when
  [`assert_create()`](../reference/assert_create.md) arguments are
  inappropriate

## assertions 0.1.0

CRAN release: 2023-06-02

- Added a `NEWS.md` file to track changes to the package.
