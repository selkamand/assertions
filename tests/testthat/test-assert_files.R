test_that("assert_file_exists() works", {

  # Create self-deleting file
  file1 <- withr::local_tempfile()
  write("file contents", file1)

  # Expectations
  expect_true(assert_file_exists(file1))

  # Throws error if file doesn't exist (can't be snapshots since tempfiles)
  expect_error(assert_file_exists('sdasda'), "Failed to find file: 'sdasda'", fixed=TRUE)
  expect_snapshot(assert_file_exists(c('sdasda', 'file2')), error = TRUE)

  # Throws error if non-character filepath given
  expect_snapshot(assert_file_exists(2), error = TRUE)

  # Throws error if file is a directory (similarly to file.exists)
  dirpath <- withr::local_tempdir()
  dirpath2 <- withr::local_tempdir()
  expect_error(assert_file_exists(dirpath), "is a directory, not a file")
  expect_snapshot(assert_file_exists(c(dirpath, dirpath2)), error = TRUE)


})

test_that("assert_all_files_exist() works", {
  # Create self-deleting file
  file1 <- withr::local_tempfile()
  write("file contents", file1)

  # Passes as Expected
  expect_true(assert_all_files_exist(file1))
  expect_true(assert_all_files_exist(c(file1, file1)))

  # Throws error if file doesn't exist (can't be snapshots since tempfiles)
  expect_error(assert_all_files_exist('sdasda'), "Failed to find file: 'sdasda'", fixed=TRUE)
  expect_snapshot(assert_all_files_exist(c('sdasda', 'file2')), error = TRUE)

  # Throws error if non-character filepath given
  expect_snapshot(assert_all_files_exist(2), error = TRUE)


  # Throws error if not
  dirpath <- withr::local_tempdir()
  dirpath2 <- withr::local_tempdir()
  expect_snapshot(assert_all_files_exist(c('sdasda', 'file2')), error = TRUE)
  expect_error(assert_all_files_exist(c(dirpath, dirpath2), "are directories, not files"))
})

test_that("assert_directory_exists() works", {

  # Create self-deleting directories
  dirpath <- withr::local_tempdir()
  dirpath2 <- withr::local_tempdir()

  # Passes when inputs are directories
  expect_true(assert_directory_exists(dirpath))
  expect_true(assert_directory_exists(dirpath2))

  # Throws error when dir doesn't exist
  expect_snapshot(assert_directory_exists("asdasdaw"), error = TRUE)

  # Throws error when path is non-string
  expect_snapshot(assert_directory_exists(100), error = TRUE)
  expect_snapshot(assert_directory_exists(c("asdasdaw", "adwadwad")), error = TRUE)
  expect_snapshot(assert_directory_exists(c(dirpath, dirpath2)), error = TRUE)

  #Create self-deleting files
  file1 <- withr::local_tempfile()
  file2 <- withr::local_tempfile()
  write("file contents", file1)
  write("file contents", file2)
  expect_error(assert_directory_exists(file1), "is a file, not a directory")
})


test_that("assert_all_directories_exist() works", {

  # Create self-deleting directories
  dirpath <- withr::local_tempdir()
  dirpath2 <- withr::local_tempdir()

  # Passes when inputs are directories
  expect_true(assert_all_directories_exist(dirpath))
  expect_true(assert_all_directories_exist(dirpath2))
  expect_true(assert_all_directories_exist(c(dirpath, dirpath2)))

  # Throws error when dir doesn't exist
  expect_snapshot(assert_all_directories_exist("asdasdaw"), error = TRUE)
  expect_snapshot(assert_all_directories_exist(c("asdasdaw", "adwadwad")), error = TRUE)

  # Throws error when path is non-character
  expect_snapshot(assert_all_directories_exist(100), error = TRUE)

  #Create self-deleting files
  file1 <- withr::local_tempfile()
  file2 <- withr::local_tempfile()
  write("file contents", file1)
  write("file contents", file2)
  expect_error(assert_all_directories_exist(file1), regexp = ".*? is a file, not a directory")
  expect_error(assert_all_directories_exist(c(file1, file2)), regexp = ".*? and .*? are files, not directories")
})


test_that("assert_file_has_extension() works", {

  # Passes when file has extensions
  expect_true(assert_file_has_extension("file.ext", extensions = "ext"))
  expect_true(assert_file_has_extension("file.ext.gz", extensions = "ext", compression = TRUE))
  expect_true(assert_file_has_extension("bob.billy.ext", extensions = "ext"))


  # Throws error when multiple inputs supplied
  expect_snapshot(assert_file_has_extension(c("file.ext.gz", "file.ext"), extensions = "ext", compression = TRUE), error = TRUE)
  expect_snapshot(assert_file_has_extension(c("file.fns", "billy.fasta", "bob.fa", "billy.fa"), extensions = c("fasta", "fa", "fns")), error = TRUE)

  # Throws error when dir doesn't exist
  expect_snapshot(assert_file_has_extension("file.ext", extensions = "bob"), error = TRUE)
  expect_snapshot(assert_file_has_extension("file.ADSAWD", extensions = "ext", compression = TRUE), error = TRUE)
  expect_snapshot(assert_file_has_extension("bob.blablaext", extensions = "ext"), error = TRUE)

  # Error messages use variable name of passed arguments
  x <- "file.ext"
  expect_error(assert_file_has_extension(x, "bobby"), "^'x'", fixed = FALSE)

  # Throws error when path is non-character
  expect_snapshot(assert_file_has_extension(c(TRUE), extensions = "ext"), error = TRUE)

})


test_that("assert_all_files_have_extension() works", {

  # Passes when file has extensions
  expect_true(assert_all_files_have_extension("file.ext", extensions = "ext"))
  expect_true(assert_all_files_have_extension("file.ext.gz", extensions = "ext", compression = TRUE))
  expect_true(assert_all_files_have_extension("bob.billy.ext", extensions = "ext"))

  # Passes when files all have one of the valid extension
  expect_true(assert_all_files_have_extension(c("file.ext.gz", "file.ext"), extensions = "ext", compression = TRUE))
  expect_true(assert_all_files_have_extension(c("file.fns", "billy.fasta", "bob.fa", "billy.fa"), extensions = c("fasta", "fa", "fns")))


  # Throws error when dir doesn't exist
  expect_snapshot(assert_all_files_have_extension("file.ext", extensions = "bob"), error = TRUE)
  expect_snapshot(assert_all_files_have_extension("file.ADSAWD", extensions = "ext", compression = TRUE), error = TRUE)
  expect_snapshot(assert_all_files_have_extension("bob.blablaext", extensions = "ext"), error = TRUE)

  # Error messages use variable name of passed arguments
  x <- "file.ext"
  expect_error(assert_all_files_have_extension(x, "bobby"), "^'x'", fixed = FALSE)

  # Throws error when path is non-character
  expect_snapshot(assert_all_files_have_extension(c(TRUE), extensions = "ext"), error = TRUE)

})

test_that("assert_file_does_not_exist() works", {

  # Create Self deleting file
  file1 <- withr::local_tempfile()
  write("file contents", file1)

  # Create self-deleting directory
  dirpath <- withr::local_tempdir()

  # Expectations
  expect_true(assert_file_does_not_exist("foo"))
  expect_true(assert_file_does_not_exist("asdaskld"))



  # Throws error if file exists
  expect_error(assert_file_does_not_exist(file1), regexp = "File .* already exists")

  # Throws error if multiple files are supplied
  expect_snapshot(assert_file_does_not_exist(c("foo", "bar")), error = TRUE)

  # Throws error if non-character filepath given
  expect_snapshot(assert_file_does_not_exist(2), error = TRUE)

  # Throws error if a directory already exists
  expect_error(assert_file_does_not_exist(dirpath), regexp = "Directory .* already exists")
})

test_that("assert_directory_does_not_exist() works", {

  # Create Self deleting file
  file1 <- withr::local_tempfile()
  write("file contents", file1)

  # Create self-deleting directory
  dirpath <- withr::local_tempdir()

  # Expectations
  expect_true(assert_directory_does_not_exist("foo"))
  expect_true(assert_directory_does_not_exist("asdaskld"))



  # Throws error if file exists
  expect_error(assert_file_does_not_exist(file1), regexp = "File .* already exists")

  # Throws error if multiple files are supplied
  expect_snapshot(assert_directory_does_not_exist(c("foo", "bar")), error = TRUE)

  # Throws error if non-character filepath given
  expect_snapshot(assert_directory_does_not_exist(2), error = TRUE)

  # Throws error if a directory already exists
  expect_error(assert_file_does_not_exist(dirpath), regexp = "Directory .* already exists")
})

