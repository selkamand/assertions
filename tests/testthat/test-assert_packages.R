cli::test_that_cli("assert_packages_installed() works", config = "plain", {

  # Packages included with base R are installed
  expect_true(assert_packages_installed("stats"))
  expect_true(assert_packages_installed(c("stats", "utils")))

  # Missing packages error
  expect_error(assert_packages_installed("notapackage123"), "Missing the required package: notapackage123. Please install and try again.", fixed = TRUE)
  expect_error(assert_packages_installed(c("notapackage123", "notapackage456")), "Missing the required packages: notapackage123 and notapackage456. Please install and try again.", fixed = TRUE)

  # Input must be a character vector
  expect_error(assert_packages_installed(1), "character vector", fixed = TRUE)

  # Error messages do NOT use variable name of passed arguments
  # (for this assertion we ALWAYS want error message to use literal package name)
  y <- "notapackage123"
  expect_error(assert_packages_installed(y), "Missing the required package: notapackage123. Please install and try again.", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_packages_installed("notapackage", msg = "Custom error message"), "Custom error message")
})
