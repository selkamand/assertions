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
