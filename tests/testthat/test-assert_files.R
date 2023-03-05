test_that("assert_file_exists", {

  # Create self-deleting file
  file1 <- withr::local_tempfile()
  write("file contents", file1)

  # Expectations
  expect_true(assert_file_exists(file1))

  # Throws error if file doesn't exist
  expect_error(assert_file_exists('sdasda'), "Failed to find file: 'sdasda'", fixed=TRUE)
  expect_error(assert_file_exists(c('sdasda', 'file2')), "Failed to find files: 'sdasda' and 'file2'", fixed=TRUE)

  # Throws error if non-character filepath given
  expect_snapshot(assert_file_exists(2), error = TRUE)

  # Throws error if file is a directory (similarly to file.exists)
  dirpath <- withr::local_tempdir()
  dirpath2 <- withr::local_tempdir()
  expect_error(assert_file_exists(dirpath), "is a directory, not a file")
  expect_error(assert_file_exists(c(dirpath, dirpath2), "are directories, not files"))
})
