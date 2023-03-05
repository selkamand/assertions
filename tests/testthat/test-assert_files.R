test_that("assert_file_exists() works", {

  # Create self-deleting file
  file1 <- withr::local_tempfile()
  write("file contents", file1)

  # Expectations
  expect_true(assert_file_exists(file1))

  # Throws error if file doesn't exist (can't be snapshots since tempfiles)
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


test_that("assert_directory_exists() works", {

  # Create self-deleting directories
  dirpath <- withr::local_tempdir()
  dirpath2 <- withr::local_tempdir()

  # Passes when inputs are directories
  expect_true(assert_directory_exists(dirpath))
  expect_true(assert_directory_exists(dirpath2))
  expect_true(assert_directory_exists(c(dirpath, dirpath2)))

  # Throws error when dir doesn't exist
  expect_snapshot(assert_directory_exists("asdasdaw"), error = TRUE)
  expect_snapshot(assert_directory_exists(c("asdasdaw", "adwadwad")), error = TRUE)

  # Throws error when path is non-character
  expect_snapshot(assert_directory_exists(100), error = TRUE)

  #Create self-deleting files
  file1 <- withr::local_tempfile()
  file2 <- withr::local_tempfile()
  write("file contents", file1)
  write("file contents", file2)
  expect_error(assert_directory_exists(file1), "is a file, not a directory")
  expect_error(assert_directory_exists(c(file1, file2)), "are files, not directories")
})


