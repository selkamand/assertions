
# Test Underlying Functions -----------------------------------------------
# Define some test functions for validation
fn_0_args <- function() {}
fn_1_arg <- function(a) {}
fn_2_args <- function(a, b) {}
fn_1_arg_with_dots <- function(a, ...) {}
fn_2_args_with_dots <- function(a, b, ...) {}

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
               "must not contain ... arguments", fixed = TRUE)

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
