cli::test_that_cli("assert_subset() works", config = "plain", {
  # Works for sets that are subsets of the required set
  expect_true(assert_subset(c(1, 2), c(1, 2, 3)))
  expect_true(assert_subset(1, c(1, 2, 3)))

  # Aborts for sets that are not subsets of the required set
  expect_snapshot(assert_subset(c(4, 5), c(1, 2, 3)), error = TRUE)
  expect_snapshot(assert_subset(c(2, 3), 1), error = TRUE)
  expect_snapshot(assert_subset(c(1, 3), c(2, 4)), error = TRUE)
  expect_snapshot(assert_subset("def", "abc"), error = TRUE)

  # Aborts for sets that are of a different type than the required set
  expect_snapshot(assert_subset(c("A"), c(1, 2, 3)), error = TRUE)

  # Error messages use variable name of passed arguments
  x <- c(1, 2)
  expect_error(assert_subset(x, c(4, 5)), "'x' contains invalid values: 1 and 2. Valid values include: 4 and 5", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_subset(c(2, 3), 1, msg = "Custom error message"), "Custom error message")
})
