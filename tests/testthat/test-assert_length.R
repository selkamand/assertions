cli::test_that_cli("assert_length() works", configs = "plain", {
  # Works for objects with correct length
  expect_true(assert_length(1:3, 3))
  expect_true(assert_length(c("a", "b"), 2))
  expect_true(assert_length(list(1, 2, 3), 3))
  expect_true(assert_length(NULL, 0))
  
  # Aborts for objects with incorrect length
  expect_error(assert_length(1:3, 2), "'1:3' must have length 2, not 3", fixed = TRUE)
  expect_error(assert_length(c("a", "b"), 3), "'c(\"a\", \"b\")' must have length 3, not 2", fixed = TRUE)
  
  # Aborts for invalid length parameter
  expect_error(assert_length(1:3, "3"), "'length' must be numeric", fixed = TRUE)
  expect_error(assert_length(1:3, c(2, 3)), "'length' must be a single number", fixed = TRUE)
  expect_error(assert_length(1:3, 2.5), "'length' must be a whole number", fixed = TRUE)
  expect_error(assert_length(1:3, -1), "'length' must be non-negative", fixed = TRUE)
  
  # Error messages use variable name
  x <- 1:3
  expect_error(assert_length(x, 2), "'x' must have length 2, not 3", fixed = TRUE)
  
  # Custom error messages work
  expect_error(assert_length(1:3, 2, msg = "Custom error"), "Custom error", fixed = TRUE)
})

cli::test_that_cli("assert_length_greater_than() works", configs = "plain", {
  # Works for objects with length > threshold
  expect_true(assert_length_greater_than(1:3, 2))
  expect_true(assert_length_greater_than(c("a", "b", "c"), 1))
  
  # Aborts for objects with length <= threshold
  expect_error(assert_length_greater_than(1:3, 3), "'1:3' must have length greater than 3, not 3", fixed = TRUE)
  expect_error(assert_length_greater_than(1:3, 4), "'1:3' must have length greater than 4, not 3", fixed = TRUE)
  
  # Aborts for invalid length parameter
  expect_error(assert_length_greater_than(1:3, "3"), "'length' must be numeric", fixed = TRUE)
  expect_error(assert_length_greater_than(1:3, c(2, 3)), "'length' must be a single number", fixed = TRUE)
  expect_error(assert_length_greater_than(1:3, 2.5), "'length' must be a whole number", fixed = TRUE)
  expect_error(assert_length_greater_than(1:3, -1), "'length' must be non-negative", fixed = TRUE)
})

cli::test_that_cli("assert_length_greater_than_or_equal_to() works", configs = "plain", {
  # Works for objects with length >= threshold
  expect_true(assert_length_greater_than_or_equal_to(1:3, 2))
  expect_true(assert_length_greater_than_or_equal_to(1:3, 3))
  
  # Aborts for objects with length < threshold
  expect_error(assert_length_greater_than_or_equal_to(1:3, 4), 
              "'1:3' must have length greater than or equal to 4, not 3", fixed = TRUE)
  
  # Aborts for invalid length parameter
  expect_error(assert_length_greater_than_or_equal_to(1:3, "3"), "'length' must be numeric", fixed = TRUE)
  expect_error(assert_length_greater_than_or_equal_to(1:3, c(2, 3)), "'length' must be a single number", fixed = TRUE)
  expect_error(assert_length_greater_than_or_equal_to(1:3, 2.5), "'length' must be a whole number", fixed = TRUE)
  expect_error(assert_length_greater_than_or_equal_to(1:3, -1), "'length' must be non-negative", fixed = TRUE)
})

cli::test_that_cli("assert_length_less_than() works", configs = "plain", {
  # Works for objects with length < threshold
  expect_true(assert_length_less_than(1:3, 4))
  expect_true(assert_length_less_than(c("a", "b"), 3))
  
  # Aborts for objects with length >= threshold
  expect_error(assert_length_less_than(1:3, 3), "'1:3' must have length less than 3, not 3", fixed = TRUE)
  expect_error(assert_length_less_than(1:3, 2), "'1:3' must have length less than 2, not 3", fixed = TRUE)
  
  # Aborts for invalid length parameter
  expect_error(assert_length_less_than(1:3, "3"), "'length' must be numeric", fixed = TRUE)
  expect_error(assert_length_less_than(1:3, c(2, 3)), "'length' must be a single number", fixed = TRUE)
  expect_error(assert_length_less_than(1:3, 2.5), "'length' must be a whole number", fixed = TRUE)
  expect_error(assert_length_less_than(1:3, -1), "'length' must be non-negative", fixed = TRUE)
})

cli::test_that_cli("assert_length_less_than_or_equal_to() works", configs = "plain", {
  # Works for objects with length <= threshold
  expect_true(assert_length_less_than_or_equal_to(1:3, 4))
  expect_true(assert_length_less_than_or_equal_to(1:3, 3))
  
  # Aborts for objects with length > threshold
  expect_error(assert_length_less_than_or_equal_to(1:3, 2), 
              "'1:3' must have length less than or equal to 2, not 3", fixed = TRUE)
  
  # Aborts for invalid length parameter
  expect_error(assert_length_less_than_or_equal_to(1:3, "3"), "'length' must be numeric", fixed = TRUE)
  expect_error(assert_length_less_than_or_equal_to(1:3, c(2, 3)), "'length' must be a single number", fixed = TRUE)
  expect_error(assert_length_less_than_or_equal_to(1:3, 2.5), "'length' must be a whole number", fixed = TRUE)
  expect_error(assert_length_less_than_or_equal_to(1:3, -1), "'length' must be non-negative", fixed = TRUE)
})
