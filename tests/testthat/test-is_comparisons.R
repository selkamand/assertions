# Unit tests for `compare`
test_that("compare function behaves correctly with different criteria", {
  # Single condition: equal to
  expect_true(compare(5, equal_to = 5))
  expect_false(compare(4, equal_to = 5))

  # Single condition: minimum (inclusive and exclusive)
  expect_true(compare(5, minimum = 5, comparison_inclusive = TRUE))
  expect_false(compare(4, minimum = 5, comparison_inclusive = TRUE))
  expect_true(compare(6, minimum = 5, comparison_inclusive = FALSE))
  expect_false(compare(5, minimum = 5, comparison_inclusive = FALSE))

  # Single condition: maximum (inclusive and exclusive)
  expect_true(compare(5, maximum = 5, comparison_inclusive = TRUE))
  expect_false(compare(6, maximum = 5, comparison_inclusive = TRUE))
  expect_true(compare(4, maximum = 5, comparison_inclusive = FALSE))
  expect_false(compare(5, maximum = 5, comparison_inclusive = FALSE))

  # Multiple conditions: equal to and minimum
  expect_true(compare(5, equal_to = 5, minimum = 3))
  expect_false(compare(5, equal_to = 5, minimum = 6))

  # All must satisfy with vector input
  expect_true(compare(c(5, 6, 7), minimum = 5, all_must_satisfy = TRUE))
  expect_false(compare(c(5, 6, 4), minimum = 5, all_must_satisfy = TRUE))

  # Any can satisfy with vector input
  expect_true(compare(c(5, 6, 4), minimum = 5, all_must_satisfy = FALSE))
  expect_false(compare(c(4, 3, 2), minimum = 5, all_must_satisfy = FALSE))
})

# Unit tests for `is_greater_than`
test_that("is_greater_than function checks if all values are greater than minimum", {
  expect_true(is_greater_than(c(2, 3, 4), minimum = 1))
  expect_false(is_greater_than(c(2, 3, 4), minimum = 4))
  expect_false(is_greater_than(c(2, 3, 1), minimum = 2))
})

# Unit tests for `is_greater_than_or_equal_to`
test_that("is_greater_than_or_equal_to function checks if all values are greater than or equal to minimum", {
  expect_true(is_greater_than_or_equal_to(c(2, 3, 4), minimum = 2))
  expect_false(is_greater_than_or_equal_to(c(2, 3, 1), minimum = 3))
})

# Unit tests for `is_less_than`
test_that("is_less_than function checks if all values are less than maximum", {
  expect_true(is_less_than(c(1, 2, 3), maximum = 4))
  expect_false(is_less_than(c(1, 2, 4), maximum = 3))
})

# Unit tests for `is_less_than_or_equal_to`
test_that("is_less_than_or_equal_to function checks if all values are less than or equal to maximum", {
  expect_true(is_less_than_or_equal_to(c(1, 2, 3), maximum = 3))
  expect_false(is_less_than_or_equal_to(c(1, 2, 4), maximum = 3))
})

# Unit tests for `is_identical`
test_that("is_identical function correctly identifies identical objects", {
  expect_true(is_identical(1, 1))
  expect_false(is_identical(c(1, 2), 1))
  expect_true(is_identical("A", "A"))
  expect_false(is_identical("A", "B"))
  expect_true(is_identical(list(a = 1), list(a = 1)))
  expect_false(is_identical(list(a = 1), list(a = 2)))
})

# Unit tests for `is_equal`
test_that("is_equal function correctly compares equality with tolerance", {
  expect_true(is_equal(1.00000001, 1.00000002))
  expect_false(is_equal(1.0001, 1.0002))
  expect_true(is_equal(c(1, 2), c(1, 2)))
  expect_false(is_equal(c(1, 2), c(2, 3)))
  expect_true(is_equal("hello", "hello"))
  expect_false(is_equal("hello", "world"))
})

# Unit tests for `is_same_type`
test_that("is_same_type function correctly identifies same types", {
  expect_true(is_same_type(1, 2))
  expect_false(is_same_type(1, "a"))
  expect_true(is_same_type(c(1, 2), c(3, 4)))
  expect_false(is_same_type(list(a = 1), c(1, 2)))
})
