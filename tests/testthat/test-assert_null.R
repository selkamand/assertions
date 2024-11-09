# Assert Null -------------------------------------------------------------
cli::test_that_cli("assert_null() works", configs = "plain", {
  # Works for NULL
  expect_true(assert_null(NULL))
  
  # Aborts for non-NULL objects
  expect_snapshot(assert_null(1), error = TRUE)
  expect_snapshot(assert_null("abc"), error = TRUE)
  expect_snapshot(assert_null(c(1, 2, 3)), error = TRUE)
  expect_snapshot(assert_null(list(a = 1, b = 2)), error = TRUE)
  expect_snapshot(assert_null(data.frame(a = 1, b = 2)), error = TRUE)
  expect_snapshot(assert_null(function(x) x), error = TRUE)
  expect_snapshot(assert_null(environment()), error = TRUE)
  
  # Error messages use variable name of passed arguments
  y <- 1:3
  expect_error(assert_null(y), "'y' must be NULL!", fixed = TRUE)
  
  # Custom error messages work
  expect_error(assert_null(1, msg = "Custom error message"), "Custom error message")
})

# Assert Non-Null --------------------------------------------------------
cli::test_that_cli("assert_non_null() works", configs = "plain", {
  # Works for non-NULL objects
  expect_true(assert_non_null(1))
  expect_true(assert_non_null("abc"))
  expect_true(assert_non_null(c(1, 2, 3)))
  expect_true(assert_non_null(list(a = 1)))
  expect_true(assert_non_null(data.frame(a = 1)))
  expect_true(assert_non_null(function(x) x))
  expect_true(assert_non_null(environment()))
  
  # Aborts for NULL
  expect_snapshot(assert_non_null(NULL), error = TRUE)
  
  # Error messages use variable name of passed arguments
  y <- NULL
  expect_error(assert_non_null(y), "'y' must not be NULL!", fixed = TRUE)
  
  # Custom error messages work
  expect_error(assert_non_null(NULL, msg = "Custom error message"), "Custom error message")
})
