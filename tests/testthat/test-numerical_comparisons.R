cli::test_that_cli("assert_greater_than() works", config = "plain", {

  # Passes
  expect_true(assert_greater_than(3, 2))
  expect_true(assert_greater_than(3, 2, all_must_satisfy = TRUE))
  expect_true(assert_greater_than(c(2,3,4), 1))
  expect_true(assert_greater_than(c(2,3,4), 3, all_must_satisfy=FALSE))

  # Throws default errors when false
  expect_snapshot(assert_greater_than(c(2,3,1), 3), error = TRUE)
  expect_snapshot(assert_greater_than(c(2,3,4), 2), error = TRUE)

  # Throws custom error
  expect_error(assert_greater_than(c(2,3,1), 3, msg = "custom error message"), "custom error message")

  # Error message uses variable name of passed arguments
  x <- c(2,3,1)
  expect_error(assert_greater_than(x, 3), "x", fixed = TRUE)

  # Passes with numeric input
  expect_true(assert_greater_than(2, 1))
  expect_true(assert_greater_than(2.5, 1))

  # Aborts with non-numeric input
  expect_snapshot(assert_greater_than('abc', 2), error = TRUE)
  expect_snapshot(assert_greater_than(list(1, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_greater_than(c(1, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_greater_than(factor(c(1, 2, 3)), 2), error = TRUE)
  expect_snapshot(assert_greater_than(TRUE, 2), error = TRUE)
  expect_snapshot(assert_greater_than(NULL, 2), error = TRUE)
})


cli::test_that_cli("assert_greater_than_or_equal_to() works", config = "plain", {

  # Passes
  expect_true(assert_greater_than_or_equal_to(3, 2))
  expect_true(assert_greater_than_or_equal_to(c(3, 2, 4), 2, all_must_satisfy = TRUE))
  expect_true(assert_greater_than_or_equal_to(c(2,3,4), 1))
  expect_true(assert_greater_than_or_equal_to(c(2,3,4), 2, all_must_satisfy=FALSE))
  expect_true(assert_greater_than_or_equal_to(c(2,3,4), 3, all_must_satisfy=FALSE))

  # Throws default errors when false
  expect_snapshot(assert_greater_than_or_equal_to(c(2,3,1), 3), error = TRUE)

  # Throws custom error
  expect_error(assert_greater_than_or_equal_to(c(2,3,1), 3, msg = "custom error message"), "custom error message")

  # Error message uses variable name of passed arguments
  x <- c(2,3,1)
  expect_error(assert_greater_than_or_equal_to(x, 3), "x", fixed = TRUE)

  # Passes with numeric input
  expect_true(assert_greater_than_or_equal_to(2, 1))
  expect_true(assert_greater_than_or_equal_to(2, 2))
  expect_true(assert_greater_than_or_equal_to(2.5, 1))

  # Aborts with non-numeric input
  expect_snapshot(assert_greater_than_or_equal_to('abc', 2), error = TRUE)
  expect_snapshot(assert_greater_than_or_equal_to(list(1, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_greater_than_or_equal_to(c(1, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_greater_than_or_equal_to(factor(c(1, 2, 3)), 2), error = TRUE)
  expect_snapshot(assert_greater_than_or_equal_to(TRUE, 2), error = TRUE)
  expect_snapshot(assert_greater_than(NULL, 2), error = TRUE)
  expect_snapshot(assert_greater_than_or_equal_to(NA, 3), error = TRUE)
  expect_snapshot(assert_greater_than_or_equal_to(c(4, NA), 3), error = TRUE)
})

cli::test_that_cli("assert_identical() works", config = "plain", {

  # Passes
  expect_true(assert_identical(3, 3))
  expect_true(assert_identical("hello", "hello"))
  expect_true(assert_identical(list(1, 2, 3), list(1, 2, 3)))
  expect_true(assert_identical(2, 2))
  expect_true(assert_identical(2.5, 2.5))
  expect_true(assert_identical('abc', 'abc'))
  expect_true(assert_identical(list(1, 2, 3), list(1, 2, 3)))
  expect_true(assert_identical(c(1, 2, 3), c(1, 2, 3)))
  expect_true(assert_identical(factor(c(1, 2, 3)), factor(c(1, 2, 3))))
  expect_true(assert_identical(TRUE, TRUE))
  expect_true(assert_identical(NULL, NULL))
  expect_true(assert_identical(NA, NA))
  expect_true(assert_identical(c(4, NA), c(4, NA)))


  # Throws default errors when false
  expect_snapshot(assert_identical(c(3, 3, 3), 3), error = TRUE)
  expect_snapshot(assert_identical(3, 4), error = TRUE)
  expect_snapshot(assert_identical(c(1, 2, 3), 3), error = TRUE)
  expect_snapshot(assert_identical(list(1, 2, 3), list(1, 2, 4)), error = TRUE)

  # Throws errors when names are not identical
  expect_snapshot(assert_identical(c("a" = 3), c("b" = 3)), error = TRUE)

  # Throws custom error
  expect_error(assert_identical(3, 4, msg = "custom error message"), "custom error message")

  # Error message uses variable name of passed arguments
  x <- 3
  y <- 4
  expect_error(assert_identical(x, y), "x.*y")

})


