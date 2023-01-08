cli::test_that_cli(configs = "plain", "assert_create() returns an assertion function", {
  assert_create_output <- assert_create(is.numeric, "Error: Argument must be numeric")
  expect_true(is.function(assert_create_output))
})

cli::test_that_cli(configs = "plain", "assertion function returns invisible TRUE if condition is met", {
  assert_is_numeric <- assert_create(is.numeric, "Error: Argument must be numeric")
  expect_true(assert_is_numeric(2))
})

cli::test_that_cli(configs = "plain", "assertion function aborts with default error message if condition is not met", {
  assert_is_numeric <- assert_create(is.numeric, "Error: Argument must be numeric")
  expect_error(assert_is_numeric("a"), "Error: Argument must be numeric", fixed=TRUE)
})

cli::test_that_cli(configs = "plain", "assertion function aborts with custom error message if condition is not met", {
  assert_is_numeric <- assert_create(is.numeric, "Error: Argument must be numeric")
  expect_error(assert_is_numeric("a", "Custom error message"), "Custom error message", fixed=TRUE)
})

cli::test_that_cli(configs = "plain", "assert_create() aborts if func is not a function", {
  expect_error(assert_create("not a function", "Error message"), "`\"not a function\"` must be a function, not a character", fixed=TRUE)
})

cli::test_that_cli(configs = "plain", "assert_create() aborts if func has 0 arguments", {
  expect_error(assert_create(function(){}), "`function() {}` must have at least 1 paramater to be used in `assert_create`", fixed=TRUE)
})

cli::test_that_cli(configs = "plain", "assert_create() aborts if default_error_msg is not a string", {
  expect_error(assert_create(is.numeric, 1), "1 must be a string (length 1 character vector). Class: numeric; Length: 1", fixed=TRUE)
})

cli::test_that_cli(configs = "plain", "assertion function aborts if func does not return a logical scalar", {
  assert_is_numeric <- assert_create(function(x) x, "Error: Argument must be numeric")
  expect_error(assert_is_numeric(2), "Assertion Function `function(x) x` must return TRUE / FALSE. Instead returned: `2`", fixed=TRUE)
})
