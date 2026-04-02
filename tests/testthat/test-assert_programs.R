cli::test_that_cli("PATH program assertions work", config = "plain", {

  existing_program <- if (nzchar(Sys.which("Rscript"))) {
    "Rscript"
  } else if (nzchar(Sys.which("R"))) {
    "R"
  } else {
    NULL
  }

  skip_if(is.null(existing_program), "No known R executable found in PATH")

  # Single-program assertions
  expect_true(assert_program_exists_in_path(existing_program))
  expect_error(assert_program_exists_in_path(existing_program, msg = "Should not fail"), regexp = NA)
  expect_error(assert_program_exists_in_path("this_program_should_not_exist_123"), "Could not find executable in PATH: this_program_should_not_exist_123. Please ensure it is installed and available on PATH.", fixed = TRUE)
  expect_error(assert_program_exists_in_path(1), "string", fixed = TRUE)
  expect_error(assert_program_exists_in_path(c(existing_program, existing_program)), "not a string", fixed = TRUE)
  expect_error(assert_program_exists_in_path("this_program_should_not_exist_123", msg = "Custom message"), "Custom message")

  # Multi-program assertions
  expect_true(assert_all_programs_exist_in_path(existing_program))
  expect_true(assert_all_programs_exist_in_path(c(existing_program, existing_program)))
  expect_true(assert_all_programs_exist_in_path(existing_program, msg = "Custom all message"))
  expect_error(assert_all_programs_exist_in_path(c(existing_program, "this_program_should_not_exist_123")), "Could not find executable in PATH: this_program_should_not_exist_123. Please ensure it is installed and available on PATH.", fixed = TRUE)
  expect_error(assert_all_programs_exist_in_path(c("this_program_should_not_exist_123", "another_program_should_not_exist_456")), "Could not find executables in PATH", fixed = TRUE)
  expect_error(assert_all_programs_exist_in_path(1), "character vector", fixed = TRUE)
})
