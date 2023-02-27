cli::test_that_cli("assert_whole_number() works", config = "plain", {

  # Works for whole numbers
  expect_true(assert_whole_number(1))
  expect_true(assert_whole_number(5L))
  expect_true(assert_whole_number(-20))

  # Aborts for non-integer numbers
  expect_snapshot(assert_whole_number(1.5), error = TRUE)
  expect_snapshot(assert_whole_number(0.5), error = TRUE)
  expect_snapshot(assert_whole_number(-1.5), error = TRUE)

  # Aborts for non-numeric values
  expect_snapshot(assert_whole_number("abc"), error = TRUE)
  expect_snapshot(assert_whole_number(c(1, 2, 3)), error = TRUE)

  # Error messages use variable name of passed argument
  x <- 1.5
  expect_error(assert_whole_number(x), "'x' is not a whole number", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_whole_number(1.5, msg = "Custom error message"), "Custom error message")
})
