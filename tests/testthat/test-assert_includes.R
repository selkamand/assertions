cli::test_that_cli("assert_includes() works", config = "plain", {
  # Works for objects that include all of the required elements
  expect_true(assert_includes(c(1, 2, 3), c(1, 2)))
  expect_true(assert_includes(c(1, 2, 3), 1))

  # Aborts for objects that do not include all of the required elements
  expect_snapshot(assert_includes(c(1, 2, 3), c(4, 5)), error = TRUE)
  expect_snapshot(assert_includes(1, c(2, 3)), error = TRUE)
  expect_snapshot(assert_includes(1, c(1, 3)), error = TRUE)
  expect_snapshot(assert_includes("abc", "def"), error = TRUE)

  # Aborts for object which have a different 'type' to the required elements (e.g. numeric vs character)
  expect_snapshot(assert_includes(c(1, 2, 3), c("A")), error = TRUE)

  # Error messages use variable name of passed arguments
  x <- c(1, 2, 3)
  expect_error(assert_includes(x, c(4, 5)), "'x' must include 4 and 5", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_includes(1, c(2, 3), msg = "Custom error message"), "Custom error message")
})


cli::test_that_cli("assert_excludes() works", config = "plain", {
  # Works for objects that exclude all of the illegal elements
  expect_true(assert_excludes(c(1, 2, 3), c(4, 5)))
  expect_true(assert_excludes(1, c(2, 3)))

  # Aborts for objects that contain any of the illegal elements
  expect_snapshot(assert_excludes(c(1, 2, 3), c(1, 2)), error = TRUE)
  expect_snapshot(assert_excludes(1, c(1, 3)), error = TRUE)
  expect_snapshot(assert_excludes("abc", "abc"), error = TRUE)

  # Aborts for object which have a different 'type' to the required elements (e.g. numeric vs character)
  expect_snapshot(assert_excludes(c(1, 2, 3), c("A")), error = TRUE)

  # Error messages use variable name of passed arguments
  x <- c(1, 2, 3)
  expect_error(assert_excludes(x, c(1, 2)), "'x' must exclude: 1 and 2", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_excludes(1, 1, msg = "Custom error message"), "Custom error message")
})

