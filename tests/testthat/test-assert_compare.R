cli::test_that_cli("assert_greater_than() works", config = "plain", {

  # Passes
  expect_true(assert_greater_than(3, 2))
  expect_true(assert_greater_than(4, 2))


  # Throws default errors when false
  expect_snapshot(assert_greater_than(c(2,3,1), 3), error = TRUE)
  expect_snapshot(assert_greater_than(c(2,3,4), 2), error = TRUE)

  # Throws custom error
  expect_error(assert_greater_than(c(2,3,1), 3, msg = "custom error message"), "custom error message")

  # Error message uses variable name of passed arguments
  x <- c(2,3,1)
  expect_error(assert_greater_than(x, 3), "x", fixed = TRUE)

  # Passes with number inputs
  expect_true(assert_greater_than(2, 1))
  expect_true(assert_greater_than(2.5, 1))

  # Aborts with non-number input
  expect_snapshot(assert_greater_than('abc', 2), error = TRUE)
  expect_snapshot(assert_greater_than(list(1, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_greater_than(c(3, 4, 5), 2), error = TRUE)
  expect_snapshot(assert_greater_than(factor(4), 2), error = TRUE)
  expect_snapshot(assert_greater_than(TRUE, 2), error = TRUE)
  expect_snapshot(assert_greater_than(NULL, 2), error = TRUE)
})

cli::test_that_cli("assert_all_greater_than() works", config = "plain", {

  # Passes with number inputs
  expect_true(assert_all_greater_than(3, 2))
  expect_true(assert_all_greater_than(4, 2))
  expect_true(assert_all_greater_than(2, 1))
  expect_true(assert_all_greater_than(2.5, 1))

  # Passes with numeric inputs
  expect_true(assert_all_greater_than(c(2, 3, 4), 1))

  # Throws default errors when false
  expect_snapshot(assert_all_greater_than(c(2,3,1), 3), error = TRUE)
  expect_snapshot(assert_all_greater_than(c(2,3,4), 2), error = TRUE)
  expect_snapshot(assert_all_greater_than(2, 2), error = TRUE)

  # Throws custom error
  expect_error(assert_all_greater_than(c(2,3,1), 3, msg = "custom error message"), "custom error message")

  # Error message uses variable name of passed arguments
  x <- c(2,3,1)
  expect_error(assert_all_greater_than(x, 3), "x", fixed = TRUE)


  # Aborts with non-number input
  expect_snapshot(assert_all_greater_than('abc', 2), error = TRUE)
  expect_snapshot(assert_all_greater_than(list(1, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_all_greater_than(c(1, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_all_greater_than(factor(c(1, 2, 3)), 2), error = TRUE)
  expect_snapshot(assert_all_greater_than(TRUE, 2), error = TRUE)
  expect_snapshot(assert_all_greater_than(NULL, 2), error = TRUE)
})



cli::test_that_cli("assert_all_greater_than_or_equal_to() works", config = "plain", {

  # Passes
  expect_true(assert_all_greater_than_or_equal_to(3, 2))
  expect_true(assert_all_greater_than_or_equal_to(c(3, 2, 4), 2))
  expect_true(assert_all_greater_than_or_equal_to(c(2,3,4), 1))

  # Throws default errors when false
  expect_snapshot(assert_all_greater_than_or_equal_to(c(2,3,1), 3), error = TRUE)

  # Throws custom error
  expect_error(assert_all_greater_than_or_equal_to(c(2,3,1), 3, msg = "custom error message"), "custom error message")

  # Error message uses variable name of passed arguments
  x <- c(2,3,1)
  expect_error(assert_all_greater_than_or_equal_to(x, 3), "x", fixed = TRUE)

  # Passes with numeric input
  expect_true(assert_all_greater_than_or_equal_to(2, 1))
  expect_true(assert_all_greater_than_or_equal_to(2, 2))
  expect_true(assert_all_greater_than_or_equal_to(2.5, 1))

  # Aborts with non-numeric input
  expect_snapshot(assert_all_greater_than_or_equal_to('abc', 2), error = TRUE)
  expect_snapshot(assert_all_greater_than_or_equal_to(list(1, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_all_greater_than_or_equal_to(c(1, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_all_greater_than_or_equal_to(factor(c(1, 2, 3)), 2), error = TRUE)
  expect_snapshot(assert_all_greater_than_or_equal_to(TRUE, 2), error = TRUE)
  expect_snapshot(assert_all_greater_than_or_equal_to(NULL, 2), error = TRUE)
  expect_snapshot(assert_all_greater_than_or_equal_to(NA, 3), error = TRUE)
  expect_snapshot(assert_all_greater_than_or_equal_to(c(4, NA), 3), error = TRUE)
})

cli::test_that_cli("assert_greater_than_or_equal_to() works", config = "plain", {

  # Passes
  expect_true(assert_greater_than_or_equal_to(3, 2))
  expect_true(assert_greater_than_or_equal_to(2, 2))
  expect_true(assert_greater_than_or_equal_to(2, 1))
  expect_true(assert_greater_than_or_equal_to(2.5, 1))


  # Throws default errors when false
  expect_snapshot(assert_greater_than_or_equal_to(2, 3), error = TRUE)

  # Throws custom error
  expect_error(assert_greater_than_or_equal_to(c(2,3,1), 3, msg = "custom error message"), "custom error message")

  # Error message uses variable name of passed arguments
  x <- c(2,3,1)
  expect_error(assert_greater_than_or_equal_to(x, 3), "x", fixed = TRUE)



  # Aborts with non-number input
  expect_snapshot(assert_greater_than_or_equal_to('abc', 2), error = TRUE)
  expect_snapshot(assert_greater_than_or_equal_to(list(1, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_greater_than_or_equal_to(c(3, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_greater_than_or_equal_to(factor(1), 2), error = TRUE)
  expect_snapshot(assert_greater_than_or_equal_to(TRUE, 2), error = TRUE)
  expect_snapshot(assert_greater_than(NULL, 2), error = TRUE)
  expect_snapshot(assert_greater_than_or_equal_to(NA, 3), error = TRUE)
  expect_snapshot(assert_greater_than_or_equal_to(c(4, NA), 3), error = TRUE)
})

cli::test_that_cli("assert_all_between() works", config = "plain", {

  # Passes with number inputs
  expect_true(assert_all_between(3, 1, 4))
  expect_true(assert_all_between(2.5, 1, 4))

  # Passes with numeric inputs
  expect_true(assert_all_between(c(2, 3, 4), 1, 4))

  # Inclusive bounds by default
  expect_true(assert_all_between(c(2, 3, 4), 2, 4))

  # Exclusive bounds when requested
  expect_snapshot(assert_all_between(c(2, 3, 4), 2, 4, comparison_inclusive = FALSE), error = TRUE)
  expect_true(assert_all_between(c(2.1, 3), 2, 4, comparison_inclusive = FALSE))

  # Throws default errors when false
  expect_snapshot(assert_all_between(c(2, 3, 1), 2, 4), error = TRUE)

  # Throws custom error
  expect_error(assert_all_between(c(2, 3, 1), 2, 4, msg = "custom error message"), "custom error message")

  # Error message uses variable name of passed arguments
  x <- c(2, 3, 1)
  expect_error(assert_all_between(x, 2, 4), "x", fixed = TRUE)

  # Aborts with non-numeric input
  expect_snapshot(assert_all_between('abc', 2, 4), error = TRUE)
  expect_snapshot(assert_all_between(list(1, 2, 3), 2, 4), error = TRUE)
  expect_snapshot(assert_all_between(factor(c(1, 2, 3)), 2, 4), error = TRUE)
  expect_snapshot(assert_all_between(TRUE, 2, 4), error = TRUE)
  expect_snapshot(assert_all_between(NULL, 2, 4), error = TRUE)
})

cli::test_that_cli("assert_between() works", config = "plain", {

  # Passes
  expect_true(assert_between(3, 1, 4))
  expect_true(assert_between(2.5, 1, 4))

  # Throws default errors when false
  expect_snapshot(assert_between(5, 1, 4), error = TRUE)

  # Throws custom error
  expect_error(assert_between(5, 1, 4, msg = "custom error message"), "custom error message")

  # Error message uses variable name of passed arguments
  x <- 5
  expect_error(assert_between(x, 1, 4), "x", fixed = TRUE)

  # Aborts with non-number input
  expect_snapshot(assert_between('abc', 1, 4), error = TRUE)
  expect_snapshot(assert_between(list(1, 2, 3), 1, 4), error = TRUE)
  expect_snapshot(assert_between(c(2, 3, 4), 1, 4), error = TRUE)
  expect_snapshot(assert_between(factor(4), 1, 4), error = TRUE)
  expect_snapshot(assert_between(TRUE, 1, 4), error = TRUE)
  expect_snapshot(assert_between(NULL, 1, 4), error = TRUE)
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

  # Throws error when comparing function call to raw value
  expect_snapshot(assert_identical(x = length(1:3), y = 3), error = TRUE)

  # Throws errors when names are not identical
  expect_snapshot(assert_identical(c("a" = 3), c("b" = 3)), error = TRUE)

  # Throws custom error
  expect_error(assert_identical(3, 4, msg = "custom error message"), "custom error message")

  # Error message uses variable name of passed arguments
  x <- 3
  y <- 4
  expect_error(assert_identical(x, y), "x.*y")

})


cli::test_that_cli("assert_equal() works", config = "plain", {

  # Passes
  expect_true(assert_equal(3, 3))
  expect_true(assert_equal("hello", "hello"))
  expect_true(assert_equal(list(1, 2, 3), list(1, 2, 3)))
  expect_true(assert_equal(2, 2))
  expect_true(assert_equal(2.5, 2.5))
  expect_true(assert_equal('abc', 'abc'))
  expect_true(assert_equal(list(1, 2, 3), list(1, 2, 3)))
  expect_true(assert_equal(c(1, 2, 3), c(1, 2, 3)))
  expect_true(assert_equal(factor(c(1, 2, 3)), factor(c(1, 2, 3))))
  expect_true(assert_equal(TRUE, TRUE))
  expect_true(assert_equal(NULL, NULL))
  expect_true(assert_equal(NA, NA))
  expect_true(assert_equal(c(4, NA), c(4, NA)))

  #Passes even when comparing function call to exact match of returned value
  expect_true(assert_equal(x = length(1:3), y = 3))

  # Throws default errors when false
  expect_snapshot(assert_equal(c(3, 3, 3), 3), error = TRUE)
  expect_snapshot(assert_equal(3, 4), error = TRUE)
  expect_snapshot(assert_equal(c(1, 2, 3), 3), error = TRUE)
  expect_snapshot(assert_equal(list(1, 2, 3), list(1, 2, 4)), error = TRUE)

  # Throws errors when names are not identical, only when check_names = TRUE
  expect_snapshot(assert_equal(c("a" = 3), c("b" = 3), check_names = TRUE), error = TRUE)
  expect_true(assert_equal(c("a" = 3), c("b" = 3), check_names = FALSE))

  # Throws custom error
  expect_error(assert_equal(3, 4, msg = "custom error message"), "custom error message")

  # Error message uses variable name of passed arguments
  x <- 3
  y <- 4
  expect_error(assert_equal(x, y), "x.*y")

})

