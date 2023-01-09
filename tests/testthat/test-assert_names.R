# Assert names include --------------------------------------------------
cli::test_that_cli("assert_names_include() works", configs = "plain", {

  x <- list(a = 1, b = 2, c = 3)

  # Passes when all names are present
  expect_identical(assert_names_include(x, "a"), TRUE)
  expect_identical(assert_names_include(x, c("a", "b")), TRUE)

  # Aborts when any names are missing
  expect_error(assert_names_include(x, c("a", "b", "d")), "'x' is missing 1 required name: `d`", fixed = TRUE)
  expect_error(assert_names_include(x, c("a", "b", "d", "e")), "'x' is missing 2 required names: `d and e`", fixed = TRUE)

  # Aborts when input has no names
  expect_error(assert_names_include(1:10, c("a", "b", "c", "d")), "'1:10' is missing 4 required names: `a, b, c, and d`", fixed = TRUE)

  # Aborts when input is an object that names() won't run on
  expect_error(assert_names_include(matrix(1:6, 2, 3), c("a", "b", "c", "d")), "'matrix(1:6, 2, 3)' is missing 4 required names: `a, b, c, and d`", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_names_include(x, c("a", "b", "d"), "Custom error message"), "Custom error message")

  # Error messages use variable name of passed arguments
  y <- list(a = 1, b = 2)
  expect_error(assert_names_include(y, "c"), "'y' is missing 1 required name: `c`", fixed = TRUE)
})
