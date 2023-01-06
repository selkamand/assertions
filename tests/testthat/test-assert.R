cli::test_that_cli("assert() works", configs = "plain", {
  # Test that expressions that are TRUE do not raise an error
  expect_identical(assert(1 == 1, 2 < 3, 5 > 1), TRUE)

  # Test that expressions that are FALSE do raise an error
  expect_error(assert(1 == 2, 2 < 3, 5 > 1), "The following assertions failed:\nx `1 == 2`", fixed = TRUE)
  expect_error(assert(1 == 1, 2 < 1, 5 > 1), "The following assertions failed:\nx `2 < 1`", fixed = TRUE)

  # Test that custom error messages work
  expect_error(assert(1 == 2, 2 < 1, 5 > 1, msg = "Custom error message"), "Custom error message", fixed = TRUE)

  # Test that expressions containing variables work correctly
  x <- 1
  y <- 2
  expect_error(assert(x == y, y < 1, 5 > 1), "The following assertions failed:\nx `x == y`\nx `y < 1`", fixed = TRUE)
})
