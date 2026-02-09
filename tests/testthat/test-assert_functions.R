
# Test Underlying Functions -----------------------------------------------
# Define some test functions for validation
fn_0_args <- function() {}
fn_1_arg <- function(a) {}
fn_2_args <- function(a, b) {}
fn_1_arg_with_dots <- function(a, ...) {}
fn_2_args_with_dots <- function(a, b, ...) {}
fn_with_required_args <- function(x, y, z = 1, ...) {}
fn_with_defaults <- function(x = 1, y = 2) {}
fn_with_no_required <- function(...) {}
fn_no_dots <- function(x, y) x + y

# Unit tests for `function_expects_n_arguments_advanced`
test_that("function_expects_n_arguments_advanced behaves correctly for exact argument count", {
  # Exact argument match
  expect_true(function_expects_n_arguments_advanced(fn_0_args, 0))
  expect_true(function_expects_n_arguments_advanced(fn_1_arg, 1))
  expect_true(function_expects_n_arguments_advanced(fn_2_args, 2))

  # Mismatched argument counts
  expect_match(function_expects_n_arguments_advanced(fn_1_arg, 2), "must expect exactly {.strong {n}} argument", fixed = TRUE)
  expect_match(function_expects_n_arguments_advanced(fn_2_args, 1), "must expect exactly {.strong {n}} argument", fixed = TRUE)
})

test_that("function_expects_n_arguments_advanced handles dots behavior correctly", {
  # Test with `...` and dots="throw_error"
  expect_match(function_expects_n_arguments_advanced(fn_1_arg_with_dots, 1, dots = "throw_error"),
               "must not contain ... arguments", fixed = TRUE) # dots throw error by default

  # Test with `...` and dots="count_as_0"
  expect_true(function_expects_n_arguments_advanced(fn_1_arg_with_dots, 1, dots = "count_as_0"))
  expect_true(function_expects_n_arguments_advanced(fn_2_args_with_dots, 2, dots = "count_as_0"))

  # Test with `...` and dots="count_as_1"
  expect_true(function_expects_n_arguments_advanced(fn_1_arg_with_dots, 2, dots = "count_as_1"))
  expect_true(function_expects_n_arguments_advanced(fn_2_args_with_dots, 3, dots = "count_as_1"))

  # Test with `...` and dots="count_as_inf"
  expect_true(function_expects_n_arguments_advanced(fn_1_arg_with_dots, Inf, dots = "count_as_inf"))
  expect_true(function_expects_n_arguments_advanced(fn_2_args_with_dots, Inf, dots = "count_as_inf"))
})

test_that("function_expects_n_arguments_advanced returns correct error for non-function inputs", {
  # Input is not a function
  expect_match(function_expects_n_arguments_advanced(42, 1), "must be a function, not a", fixed = TRUE)
  expect_match(function_expects_n_arguments_advanced("not_a_function", 1), "must be a function, not a", fixed = TRUE)
  expect_match(function_expects_n_arguments_advanced(list(), 1), "must be a function, not a", fixed = TRUE)
  expect_match(function_expects_n_arguments_advanced(NULL, 1), "must be a function, not a", fixed = TRUE)
})

test_that("function_expects_n_arguments_advanced correctly counts arguments for functions with no arguments", {
  # Functions with no arguments should pass with 0 expected arguments
  expect_true(function_expects_n_arguments_advanced(fn_0_args, 0))

  # Mismatch for functions with no arguments
  expect_match(function_expects_n_arguments_advanced(fn_0_args, 1), "must expect exactly {.strong {n}} argument", fixed = TRUE)
})

test_that("function_expects_n_arguments_advanced correctly counts arguments for functions with multiple arguments", {
  # Functions with multiple arguments should match exactly
  expect_true(function_expects_n_arguments_advanced(fn_2_args, 2))

  # Mismatch for functions with multiple arguments
  expect_match(function_expects_n_arguments_advanced(fn_2_args, 3), "must expect exactly {.strong {n}} argument", fixed = TRUE)
})

test_that("function_expects_n_arguments_advanced handles `dots` parameter correctly with complex cases", {
  # Functions with variadic args (dots) should adapt based on `dots` parameter
  expect_true(function_expects_n_arguments_advanced(fn_1_arg_with_dots, 1, dots = "count_as_0"))
  expect_true(function_expects_n_arguments_advanced(fn_2_args_with_dots, 2, dots = "count_as_0"))
  expect_true(function_expects_n_arguments_advanced(fn_1_arg_with_dots, 2, dots = "count_as_1"))
  expect_true(function_expects_n_arguments_advanced(fn_2_args_with_dots, 3, dots = "count_as_1"))
  expect_true(function_expects_n_arguments_advanced(fn_1_arg_with_dots, Inf, dots = "count_as_inf"))
  expect_true(function_expects_n_arguments_advanced(fn_2_args_with_dots, Inf, dots = "count_as_inf"))
})

test_that("function_expects_advanced validates required argument names", {
  expect_true(function_expects_advanced(fn_2_args, c("a", "b")))
  expect_true(function_expects_advanced(fn_with_required_args, c("x", "y")))

  expect_match(function_expects_advanced(fn_2_args, "c"),
               "missing the following parameter", fixed = TRUE)
  expect_match(function_expects_advanced(fn_2_args, c("b", "c")),
               "missing the following parameter", fixed = TRUE)
  expect_match(function_expects_advanced(fn_with_no_required, "x"),
               "missing the following parameter", fixed = TRUE)
  expect_true(function_expects_advanced(fn_with_defaults, "x"))
  expect_match(function_expects_advanced(1, "x"),
               "must be a function, not a", fixed = TRUE)
})

test_that("function_variadic_advanced validates variable arguments", {
  expect_true(function_variadic_advanced(fn_1_arg_with_dots))
  expect_true(function_variadic_advanced(fn_2_args_with_dots))

  expect_match(function_variadic_advanced(fn_no_dots),
               "must accept variable arguments", fixed = TRUE)
  expect_match(function_variadic_advanced(1),
               "must be a function, not a", fixed = TRUE)
  expect_match(function_variadic_advanced(list()),
               "must be a function, not a", fixed = TRUE)
})




# Test Assertions ---------------------------------------------------------

cli::test_that_cli("assert_function_expects_n_arguments() works", config = "plain", {
  # Works for functions with the correct number of arguments
  my_func <- function(x, y) { x + y }
  expect_true(assert_function_expects_n_arguments(my_func, 2))

  # Works with primitive functions
  expect_true(assert_function_expects_n_arguments(class, 1))

  # Works with custom indication of how to deal with variable arguments (...)
  my_func_dots <- function(x, y, ...) { }
  expect_true(assert_function_expects_n_arguments(my_func_dots, 2, dots = "count_as_0"))
  expect_true(assert_function_expects_n_arguments(my_func_dots, 3, dots = "count_as_1"))
  expect_true(assert_function_expects_n_arguments(my_func_dots, Inf, dots = "count_as_inf"))
  expect_snapshot(assert_function_expects_n_arguments(my_func_dots, 2, dots = "throw_error"), error = TRUE)


  # Aborts for functions with the incorrect number of arguments
  my_func2 <- function(x) { x }
  expect_snapshot(assert_function_expects_n_arguments(my_func2, 2), error = TRUE)

  # Aborts for objects that are not functions
  expect_snapshot(assert_function_expects_n_arguments(123, 1), error = TRUE)
  expect_snapshot(assert_function_expects_n_arguments(c(1, 2, 3), 2), error = TRUE)

  # Error messages use variable name of passed arguments
  my_func3 <- function(z) { z }
  expect_error(assert_function_expects_n_arguments(my_func3, 2), "^'my_func3'", fixed = FALSE)

  # Custom error messages work
  expect_error(assert_function_expects_n_arguments(my_func, 3, msg = "Custom error message"), "Custom error message")
})

cli::test_that_cli("assert_function_expects() works", config = "plain", {

  # Function with required args and one defaulted argument
  my_func <- function(a, b, c = 1) { a + b + c }

  # Function that accepts additional arguments via ...
  my_func_dots <- function(a, b, ...) { a + b }

  # Succeeds when required parameters are present (ignores defaults)
  expect_true(assert_function_expects(my_func, c("a", "b")))

  # Succeeds when required parameters are present and ... is ignored
  expect_true(assert_function_expects(my_func_dots, c("a", "b")))

  # Succeeds when checking for a parameter with a default value
  expect_true(assert_function_expects(my_func, c("c")))

  # Function missing one of the required parameters
  my_func2 <- function(a, c) { a + c }

  # Errors when a required parameter is absent from the signature
  expect_error(
    assert_function_expects(my_func2, c("a", "b")),
    "Function 'my_func2' is missing the following parameter in its signature: `b`"
  )

  # Errors when input is not a function
  expect_error(
    assert_function_expects(123, "a"),
    "'123' must be a function, not a numeric"
  )

  # Errors when function has no matching required parameters
  expect_error(
    assert_function_expects(fn_with_no_required, "a"),
    "Function 'fn_with_no_required' is missing the following parameter in its signature: `a`"
  )

  # Succeeds when required parameter exists even if it has a default
  expect_true(assert_function_expects(fn_with_defaults, "x"))

  # Uses custom error message when provided
  expect_error(
    assert_function_expects(my_func, c("a", "d"), msg = "Custom error message"),
    "Custom error message"
  )

  # Works with a single required argument
  expect_true(assert_function_expects(fn_with_required_args, "x"))

  # Reports missing parameters when multiple are absent
  expect_error(
    assert_function_expects(fn_with_defaults, c("x", "z")),
    "missing the following parameter",
    fixed = TRUE
  )
})

cli::test_that_cli("assert_function_variadic() works", config = "plain", {
  my_fun <- function(a, ...) { a }
  my_fun_no_dots <- function(a) { a }
  my_fun_with_defaults <- function(a = 1, ...) { a }
  my_fun_only_dots <- function(...) { }
  my_fun_many <- function(a, b = 1, ...) { a + b }

  # Accepts a basic variadic signature
  expect_true(assert_function_variadic(my_fun))

  # Accepts variadic signatures with defaults
  expect_true(assert_function_variadic(my_fun_with_defaults))

  # Accepts dots-only signatures
  expect_true(assert_function_variadic(my_fun_only_dots))

  # Accepts multiple arguments with dots
  expect_true(assert_function_variadic(my_fun_many))

  # Rejects non-variadic signatures
  expect_error(assert_function_variadic(my_fun_no_dots), "must accept variable arguments", fixed = TRUE)

  # Rejects non-function numeric input
  expect_error(assert_function_variadic(123), "'123' must be a function, not a numeric")

  # Rejects non-function list input
  expect_error(assert_function_variadic(list()), "must be a .*function", fixed = FALSE)
})
