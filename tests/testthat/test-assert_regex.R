cli::test_that_cli("assert_all_strings_contain() works", configs = "plain", {
  # Works for matching strings
  expect_identical(assert_all_strings_contain(c("abc", "a1"), "^a"), TRUE)

  # Aborts for non-matching strings
  expect_error(
    assert_all_strings_contain(c("abc", "b1"), "^a"),
    "must all match regex `\\^a`.*1/2 elements did not match pattern",
    fixed = FALSE
  )

  # Single element does not include count
  expect_error(
    assert_all_strings_contain("abc", "^b"),
    "must match regex `\\^b`$",
    fixed = FALSE
  )

  # Aborts for non-character inputs
  expect_error(assert_all_strings_contain(1, "^a"), "character vector", fixed = FALSE)

  # Aborts for invalid pattern inputs
  expect_error(assert_all_strings_contain("abc", 1), "pattern.*string", fixed = FALSE)

  # Error messages use variable name of passed arguments
  x <- c("abc", "b1")
  expect_error(assert_all_strings_contain(x, "^a"), "'x'.*match regex", fixed = FALSE)

  # Custom error messages work
  expect_error(assert_all_strings_contain(c("abc", "b1"), "^a", msg = "Custom error message"), "Custom error message")
})

cli::test_that_cli("assert_string_contains() works", configs = "plain", {
  # Works for matching string
  expect_identical(assert_string_contains("abc", "^a"), TRUE)
  expect_identical(assert_string_contains("Abc", "^a", ignore.case = TRUE), TRUE)

  # Aborts for non-matching string
  expect_error(assert_string_contains("abc", "^b"), "must match regex `\\^b`$", fixed = FALSE)

  # Aborts for non-string inputs
  expect_error(assert_string_contains(c("abc", "b1"), "^a"), "string", fixed = FALSE)

  # Custom error messages work
  expect_error(assert_string_contains("abc", "^b", msg = "Custom error message"), "Custom error message")
})
