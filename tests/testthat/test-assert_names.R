# Assert Names Include ---------------------------------------------------
cli::test_that_cli("assert_names_include() works", configs = "plain", {

  # Works when all names are present
  expect_identical(assert_names_include(mtcars, c("mpg", "cyl")), TRUE)

  # Aborts when any name is missing
  expect_error(assert_names_include(mtcars, c("mpg", "cyl", "foo")), "'mtcars' must include 3 names, 1 of which are missing:\nx foo", fixed = TRUE)

  # Aborts when all names are missing
  expect_error(assert_names_include(mtcars, c("foo", "bar")), "'mtcars' must include 2 names, all of which are missing:\nx foo\nx bar", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- mtcars[, c("mpg", "cyl")]
  expect_error(assert_names_include(y, c("mpg", "cyl", "foo")), "'y' must include 3 names, 1 of which are missing:\nx foo", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_names_include(mtcars, c("foo", "bar"), msg = "Custom error message"), "Custom error message")

})
