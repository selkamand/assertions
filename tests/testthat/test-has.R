# Assert Has No Duplicates ---------------------------------------------------
cli::test_that_cli("assert_no_duplicates() works", configs = "plain", {

  # Works for vectors with no duplicates
  expect_identical(assert_no_duplicates(c(1, 2, 3)), TRUE)

  # Works for empty vectors
  expect_identical(assert_no_duplicates(integer()), TRUE)

  # Aborts for vectors with duplicates
  expect_error(assert_no_duplicates(c(1, 2, 2, 3)), "'c(1, 2, 2, 3)' must have no duplicates! Found 1 duplicated value: 2", fixed=TRUE)

  # Error messages use variable name of passed arguments
  x <- c(1, 2, 2, 3)
  expect_error(assert_no_duplicates(x), "'x' must have no duplicates! Found 1 duplicated value: 2", fixed=TRUE)

  # Custom error messages work
  expect_error(assert_no_duplicates(c(1, 2, 2, 3), msg = "Custom error message"), "Custom error message", fixed=TRUE)
})

cli::test_that_cli("assert_class() works", configs = "plain", {

  # Works for correct classes
  expect_true(assert_class(1, class = "numeric"))
  expect_true(assert_class("abc", class = "character"))
  expect_true(assert_class(mtcars, class = "data.frame"))

  # Works if checking for multiple valid classes
  expect_true(assert_class(1, class = c("character", "numeric")))

  # Works for all classes for multi-class objects
  a <- 1
  class(a) <- c("class1", "class2")
  expect_true(assert_class(a, class = "class1"))
  expect_true(assert_class(a, class = "class2"))

  # Aborts for incorrect classes
  expect_snapshot(assert_class(1, class = "character"), error = TRUE)
  expect_snapshot(assert_class("abc", class = "numeric"), error = TRUE)
  expect_snapshot(assert_class(mtcars, class = "list"), error = TRUE)


  # Error messages use variable name of passed arguments
  x <- 1
  expect_error(assert_class(x, class = "character"), "'x'", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_class(1, class = "character", msg = "Custom error message"), "Custom error message")
})

