test_that("code injection fails", {

  # Attempt to Inject if Assertion passes
  expect_error(assert_character("{stop('throw this error')}"), regexp = NA)
  expect_error(assert_character("stop('throw this error')"), regexp = NA)

  expect_message(assert_character("{message('output this message')}"), regexp = NA)
  expect_message(assert_character("message('output this message')"), regexp = NA)

  # Attempt to Inject if Assertion Fails
  expect_error(assert_number("{stop('throw this error')}"), regexp = 'is not a number')
  expect_error(assert_number("stop('throw this error')"), regexp = 'is not a number')

  expect_message(try(silent = TRUE, assert_number("{message('output this message')}")), regexp = NA)
  expect_message(try(silent = TRUE, assert_number("message('output this message')")), regexp = NA)
})
