cli::test_that_cli("assert_packages_installed() works", config = "plain", {
  expect_true(assert_packages_installed("stats"))
  expect_true(assert_packages_installed(c("stats", "utils")))
  expect_error(assert_packages_installed("notapackage123"), "Missing the required package: notapackage123. Please install and try again.", fixed = TRUE)
  expect_error(assert_packages_installed(c("notapackage123", "notapackage456")), "Missing the required packages: notapackage123 and notapackage456. Please install and try again.", fixed = TRUE)
  expect_error(assert_packages_installed(1), "character vector", fixed = TRUE)
})
