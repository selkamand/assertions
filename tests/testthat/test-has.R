# Assert Has No Duplicates ---------------------------------------------------
cli::test_that_cli("assert_has_no_duplicates() works", configs = "plain", {

  # Works for vectors with no duplicates
  expect_identical(assert_has_no_duplicates(c(1, 2, 3)), TRUE)

  # Works for empty vectors
  expect_identical(assert_has_no_duplicates(integer()), TRUE)

  # Aborts for vectors with duplicates
  expect_error(assert_has_no_duplicates(c(1, 2, 2, 3)), "'c(1, 2, 2, 3)' must have no duplicates! Found 1 duplicated value: 2", fixed=TRUE)

  # Error messages use variable name of passed arguments
  x <- c(1, 2, 2, 3)
  expect_error(assert_has_no_duplicates(x), "'x' must have no duplicates! Found 1 duplicated value: 2", fixed=TRUE)

  # Custom error messages work
  expect_error(assert_has_no_duplicates(c(1, 2, 2, 3), msg = "Custom error message"), "Custom error message", fixed=TRUE)
})
