# Test Creation of Simple Assertion Chains  -----------------------------------------------------

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

cli::test_that_cli(configs = "plain", "user supplied  custom error message has access to the environment in which it was called", {
  assert_is_numeric <- assert_create(is.numeric, "Error: Argument must be numeric")
  name = "billy"
  age = "26"
  expect_error(assert_is_numeric(age, "{name}'s age must be a number, not a {class(age)}"), "billy's age must be a number, not a character", fixed=TRUE)
})

cli::test_that_cli(configs = "plain", "user supplied  custom error message has access to the environment in which it was called (when run within a function)", {
  assert_is_numeric <- assert_create(is.numeric, "Error: Argument must be numeric")
  foo <- function(){
    name = "billy"
    assert_is_numeric("A", msg = "{name} was always going to fail")
  }
  expect_error(foo(), "billy was always going to fail")
})

cli::test_that_cli(configs = "plain", "user supplied  custom error message has special keywords", {

  assert_is_numeric <- assert_create(is.numeric, "Error: Argument must be numeric")
  name = "billy"
  age = "26"
  expect_error(assert_is_numeric(age, "{arg_name} must be a number, not a {class(arg_value)}"), "age must be a number, not a character", fixed=TRUE)
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

cli::test_that_cli(configs = "plain", "assertion function aborts if func does not return a logical scalar when default_error_msg is supplied", {
  assert_is_numeric <- assert_create(function(x) x, "Error: Argument must be numeric")
  expect_snapshot(assert_is_numeric(2), error = TRUE)
})


cli::test_that_cli(configs = "plain", "assertion function aborts if func returns FALSE without a default error message", {
  # Bad assertion: returns FALSE with no default error message
  bad_assert_no_default_error <- assert_create(function(x) FALSE)
  expect_snapshot(bad_assert_no_default_error(2), error = TRUE)

  # Good assertion: returns STRING with no default error message
  good_assert_no_default_error <- assert_create(function(x) "an error message")
  expect_snapshot(good_assert_no_default_error(2), error = TRUE)
})

cli::test_that_cli(configs = "plain", "assertion function throws appropriate error when returning neither a flag NOR a string", {
  # Bad assertion: returns character not string
  bad_assert_returns_char <- assert_create(function(x) c("a", "b"))
  expect_snapshot(bad_assert_returns_char("foo"), error = TRUE)

  # Bad assertion: returns logical not flag
  bad_assert_returns_logical <- assert_create(function(x) c(TRUE, TRUE))
  expect_snapshot(bad_assert_returns_logical("foo"), error = TRUE)

  # Bad assertion: returns factor
  bad_assert_returns_factor <- assert_create(function(x) factor(c(1, 4)))
  expect_snapshot(bad_assert_returns_factor("foo"), error = TRUE)

})

cli::test_that_cli(configs = "plain", "assertion function works as expected with string-returning assertion functions", {
  # Bad assertion: returns character not string
  is_between_min_and_max <- function(obj, min, max){
    if(!is.numeric(obj)) return(paste0("{arg_name} is a {class(arg_value)}, not numeric"))

    if(obj > max) return("{arg_name} is over {max}")
    else if (obj < min) return("{arg_name} is under {min}")

    return(TRUE)
  }

  assert_between_min_and_max <- assert_create(is_between_min_and_max)
  expect_true(assert_between_min_and_max(4, min = 3, max = 5))

  expect_snapshot(assert_between_min_and_max("foo", min = 3, max = 5), error = TRUE)
  expect_snapshot(assert_between_min_and_max(6, min = 3, max = 5), error = TRUE)
  expect_snapshot(assert_between_min_and_max(2, min = 3, max = 5), error = TRUE)
})



# Test Creation of Assertion Chains  -----------------------------------------------------
cli::test_that_cli(configs = "plain", "assertion chains can evaluate expressions part and not get confused if they contain variable names", {
  #assert_is_character <- assert_create(is.character, "Error: {arg_name} must be a character")
  assert_chain<- assert_create_chain(
    assert_create(is.character, "{arg_name} must be a character"),
    assert_create(is.numeric, "{arg_name} must be numeric")
  )
  y = c(1, 2)
  expect_error(assert_chain(length(y)), regexp = "length(y) must be a character", fixed = TRUE)
})


cli::test_that_cli(configs = "plain", "assert_create_chain:  user supplied  custom error message has access to the environment in which it was called", {
  assert_chain<- assert_create_chain(
    assert_create(is.numeric, "{arg_name} must be numeric"),
    assert_create(is.character, "{arg_name} must be a character")
  )

  name = "billy"
  age = "26"
  expect_error(assert_chain(age, msg = "{name}'s age must be a number, not a {class(age)}"), "billy's age must be a number, not a character", fixed=TRUE)
})

cli::test_that_cli(configs = "plain", "assert_create_chain: user supplied  custom error message has special keywords", {

  assert_chain<- assert_create_chain(
    assert_create(is.numeric, "{arg_name} must be numeric"),
    assert_create(is.character, "{arg_name} must be a character")
  )
  name = "billy"
  age = "26"
  expect_error(assert_chain(age, "{arg_name} must be a number, not a {class(arg_value)}"), "age must be a number, not a character", fixed=TRUE)
})
