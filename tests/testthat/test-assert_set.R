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


cli::test_that_cli("assert_one_of() works", config = "plain", {
  # Works for scalar values that are part of the required set
  expect_true(assert_one_of(1, c(1, 2, 3)))   # 1 is in the set
  expect_true(assert_one_of("A", c("A", "B", "C")))  # "A" is in the set
  expect_true(assert_one_of(2.5, c(1.0, 2.5, 3.0)))  # 2.5 is in the set

  # Aborts for scalar values that are not part of the required set
  expect_snapshot(assert_one_of(4, c(1, 2, 3)), error = TRUE)  # 4 is not in the set
  expect_snapshot(assert_one_of("D", c("A", "B", "C")), error = TRUE)  # "D" is not in the set
  expect_snapshot(assert_one_of(3.5, c(1.0, 2.5, 3.0)), error = TRUE)  # 3.5 is not in the set

  # Aborts for non-scalar values (vectors, lists, etc.)
  expect_snapshot(assert_one_of(c(1, 2), c(1, 2, 3)), error = TRUE)  # c(1, 2) is not a scalar
  expect_snapshot(assert_one_of(list(1, 2), c(1, 2, 3)), error = TRUE)  # list(1, 2) is not a scalar

  # Error messages use variable name of passed arguments
  x <- 4
  expect_error(assert_one_of(x, c(1, 2, 3)), "'x' must be one of 1, 2, or 3, not 4", fixed = TRUE)
  x <- "D"
  expect_error(assert_one_of(x, c("A", "B", "C")), "'x' must be one of A, B, or C, not D", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_one_of(2, c(1, 3), msg = "Custom error message"), "Custom error message")
})


cli::test_that_cli("assert_set_equal() works", config = "plain", {
  # Works for sets that are equivalent (same elements, ignoring order and duplicates)
  expect_true(assert_set_equal(c(1, 2, 3), c(3, 2, 1)))       # Same elements, different order
  expect_true(assert_set_equal(c("A", "B", "C"), c("C", "A", "B")))  # Same elements, different order
  expect_true(assert_set_equal(c(1, 2, 2, 3), c(3, 2, 1)))    # Duplicate in x, equivalent to y

  # Aborts for sets that differ in elements
  expect_snapshot(assert_set_equal(c(1, 2, 3), c(1, 2)), error = TRUE) # Missing 3 in y
  expect_snapshot(assert_set_equal(c("A", "B"), c("A", "B", "C")), error = TRUE) # Missing "C" in x
  expect_snapshot(assert_set_equal(c(1, 3, 4), c(1, 2, 3)), error = TRUE) # Extra 4 in x, missing 2

  # Aborts for sets with different types
  expect_snapshot(assert_set_equal(c("A", "B", "C"), c(1, 2, 3)), error = TRUE) # Different types

  # Error messages use variable name of passed arguments
  x <- c(1, 2)
  y <- c(1, 2, 3)
  expect_error(assert_set_equal(x, y), "'x' is missing a required value: 3", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_set_equal(c(1, 2, 3), c(1, 2), msg = "Custom error message"), "Custom error message")
})
