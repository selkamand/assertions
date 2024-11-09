cli::test_that_cli("assert_less_than() works", config = "plain", {
  
  # Passes
  expect_true(assert_less_than(2, 3))
  expect_true(assert_less_than(2, 4))
  
  # Throws default errors when false
  expect_snapshot(assert_less_than(3, 2), error = TRUE)
  expect_snapshot(assert_less_than(4, 2), error = TRUE)
  
  # Throws custom error
  expect_error(assert_less_than(3, 2, msg = "custom error message"), "custom error message")
  
  # Error message uses variable name of passed arguments
  x <- 3
  expect_error(assert_less_than(x, 2), "x", fixed = TRUE)
  
  # Passes with number inputs
  expect_true(assert_less_than(1, 2))
  expect_true(assert_less_than(1.5, 2))
  
  # Aborts with non-number input
  expect_snapshot(assert_less_than('abc', 2), error = TRUE)
  expect_snapshot(assert_less_than(list(1, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_less_than(c(3, 4, 5), 2), error = TRUE)
  expect_snapshot(assert_less_than(factor(4), 2), error = TRUE)
  expect_snapshot(assert_less_than(TRUE, 2), error = TRUE)
  expect_snapshot(assert_less_than(NULL, 2), error = TRUE)
})

cli::test_that_cli("assert_all_less_than() works", config = "plain", {
  
  # Passes with number inputs
  expect_true(assert_all_less_than(2, 3))
  expect_true(assert_all_less_than(2, 4))
  expect_true(assert_all_less_than(1, 2))
  expect_true(assert_all_less_than(1.5, 2))
  
  # Passes with numeric inputs
  expect_true(assert_all_less_than(c(1, 2, 3), 4))
  
  # Throws default errors when false
  expect_snapshot(assert_all_less_than(c(2,3,4), 3), error = TRUE)
  expect_snapshot(assert_all_less_than(2, 2), error = TRUE)
  
  # Throws custom error
  expect_error(assert_all_less_than(3, 2, msg = "custom error message"), "custom error message")
  
  # Error message uses variable name of passed arguments
  x <- 3
  expect_error(assert_all_less_than(x, 2), "x", fixed = TRUE)
  
  # Aborts with non-numeric input
  expect_snapshot(assert_all_less_than('abc', 2), error = TRUE)
  expect_snapshot(assert_all_less_than(list(1, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_all_less_than(factor(c(1, 2, 3)), 2), error = TRUE)
  expect_snapshot(assert_all_less_than(TRUE, 2), error = TRUE)
  expect_snapshot(assert_all_less_than(NULL, 2), error = TRUE)
})

cli::test_that_cli("assert_all_less_than_or_equal_to() works", config = "plain", {
  
  # Passes
  expect_true(assert_all_less_than_or_equal_to(2, 3))
  expect_true(assert_all_less_than_or_equal_to(c(2, 3, 3), 3))
  expect_true(assert_all_less_than_or_equal_to(c(1,2,3), 4))
  
  # Throws default errors when false
  expect_snapshot(assert_all_less_than_or_equal_to(c(2,3,4), 3), error = TRUE)
  
  # Throws custom error
  expect_error(assert_all_less_than_or_equal_to(3, 2, msg = "custom error message"), "custom error message")
  
  # Error message uses variable name of passed arguments
  x <- 3
  expect_error(assert_all_less_than_or_equal_to(x, 2), "x", fixed = TRUE)
  
  # Aborts with non-numeric input
  expect_snapshot(assert_all_less_than_or_equal_to('abc', 2), error = TRUE)
  expect_snapshot(assert_all_less_than_or_equal_to(list(1, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_all_less_than_or_equal_to(factor(c(1, 2, 3)), 2), error = TRUE)
  expect_snapshot(assert_all_less_than_or_equal_to(TRUE, 2), error = TRUE)
  expect_snapshot(assert_all_less_than_or_equal_to(NULL, 2), error = TRUE)
})

cli::test_that_cli("assert_less_than_or_equal_to() works", config = "plain", {
  
  # Passes
  expect_true(assert_less_than_or_equal_to(2, 3))
  expect_true(assert_less_than_or_equal_to(2, 2))
  expect_true(assert_less_than_or_equal_to(1, 2))
  expect_true(assert_less_than_or_equal_to(1.5, 2))
  
  # Throws default errors when false
  expect_snapshot(assert_less_than_or_equal_to(3, 2), error = TRUE)
  
  # Throws custom error
  expect_error(assert_less_than_or_equal_to(3, 2, msg = "custom error message"), "custom error message")
  
  # Error message uses variable name of passed arguments
  x <- 3
  expect_error(assert_less_than_or_equal_to(x, 2), "x", fixed = TRUE)
  
  # Aborts with non-number input
  expect_snapshot(assert_less_than_or_equal_to('abc', 2), error = TRUE)
  expect_snapshot(assert_less_than_or_equal_to(list(1, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_less_than_or_equal_to(c(3, 2, 3), 2), error = TRUE)
  expect_snapshot(assert_less_than_or_equal_to(factor(1), 2), error = TRUE)
  expect_snapshot(assert_less_than_or_equal_to(TRUE, 2), error = TRUE)
  expect_snapshot(assert_less_than_or_equal_to(NULL, 2), error = TRUE)
}) 
