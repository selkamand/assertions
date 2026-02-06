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


cli::test_that_cli("assert_all_finite() works", config = "plain", {

  # Works for finite numeric inputs
  expect_true(assert_all_finite(1))
  expect_true(assert_all_finite(c(1, 2, 3)))
  expect_true(assert_all_finite(matrix(c(1, 2, 3, 4), nrow = 2)))

  # Aborts for non-finite values
  expect_error(assert_all_finite(Inf), "must be finite", fixed = TRUE)
  expect_error(assert_all_finite(-Inf), "must be finite", fixed = TRUE)
  expect_error(assert_all_finite(NaN), "must be finite", fixed = TRUE)
  expect_error(assert_all_finite(c(1, NA_real_)), "must all be finite", fixed = TRUE)

  # Aborts for non-numeric values
  expect_error(assert_all_finite("abc"), "must be numeric", fixed = TRUE)

  # Error messages use variable name of passed argument
  x <- c(1, Inf)
  expect_error(assert_all_finite(x), "x", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_all_finite(Inf, msg = "Custom finite error"), "Custom finite error")
})


cli::test_that_cli("assert_finite() works", config = "plain", {

  # Works for finite numeric inputs
  expect_true(assert_finite(1))
  expect_true(assert_finite(-2.5))

  # Aborts for non-finite values
  expect_error(assert_finite(Inf), "must be finite", fixed = TRUE)
  expect_error(assert_finite(-Inf), "must be finite", fixed = TRUE)
  expect_error(assert_finite(NaN), "must be finite", fixed = TRUE)
  expect_error(assert_finite(NA_real_), "must be finite", fixed = TRUE)

  # Aborts for non-numeric values
  expect_error(assert_finite("abc"), "not a number", fixed = TRUE)

  # Error messages use variable name of passed argument
  x <- Inf
  expect_error(assert_finite(x), "x", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_finite(Inf, msg = "Custom finite error"), "Custom finite error")
})
