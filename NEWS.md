# assertions 0.2.0.9000 (dev version)

* Added `assert_function_expects()` for checking argument names in functions

* Added `assert_function_variadic()` for checking whether functions declare `...`

* Added `assert_all_strings_contain()` and `assert_string_contains()` for checking character inputs against regular expressions

* Added `assert_packages_installed()`

* Added `assert_all_between()` and `assert_between()` assertions

* Added `assert_all_finite()` and `assert_finite()` for checking numeric inputs have no `NA`, `NaN`, or infinite values

* Improved factor support for `assert_includes()` and `assert_excludes()`

* Improved missing-value errors for numeric comparison assertions (e.g., `assert_greater_than()` with `NaN`)

* Improved `assert_numeric()` error messaging for non-numeric matrices/arrays

# assertions 0.2.0

* Improved factor support for `assert_includes()` and `assert_excludes()`

* Added `assert_connection()`

* Added `assert_set_equal()`

* Added `assert_one_of()`

* Added `assert_scalar()`

* Added missing `assert_less_than()` assertions.

* Added `assert_null()` and `assert_non_null()`

* Added `assert_length()`

* Improved error messages when `assert_create()` arguments are inappropriate

# assertions 0.1.0

* Added a `NEWS.md` file to track changes to the package.
