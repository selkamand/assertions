test_that("assertions are sufficiently unit tested", {
  expect_true(check_all_assertions_are_tested_enough(min_required_tests = 5))
})
