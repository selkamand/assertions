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

test_that("assert_file_permissions() works", {


  file_with_write_permission <- withr::local_tempfile()
  write("file contents", file_with_write_permission)
  Sys.chmod(file_with_write_permission, mode = "200")


  file_with_read_permission <- withr::local_tempfile()
  write("file contents", file_with_read_permission)
  Sys.chmod(file_with_read_permission, mode = "400")

  file_with_execute_permission <- withr::local_tempfile()
  write("file contents", file_with_execute_permission)
  Sys.chmod(file_with_execute_permission, mode = "100")

  # Passes when file has permission
  expect_true(assert_file_permissions(file_with_write_permission, permission = "write"))
  expect_true(assert_file_permissions(file_with_execute_permission, permission = "execute"))
  expect_true(assert_file_permissions(file_with_read_permission, permission = "read"))

  # Works even when vector of files is passed
  expect_true(assert_file_permissions(c(file_with_write_permission, file_with_write_permission), permission = "write"))

  # # Throws error when file doesn't have the required permission (Can't be snapshots due to tempfile name randomisation)
  expect_error(assert_file_permissions(file_with_write_permission, permission = "execute"), "does not have permission: execute")
  expect_error(assert_file_permissions(file_with_write_permission, permission = "read"), "does not have permission: read")
  expect_error(assert_file_permissions(file_with_execute_permission, permission = "write"), "does not have permission: write")
  expect_error(assert_file_permissions(
    c(
      file_with_execute_permission,
      file_with_write_permission,
      file_with_read_permission
      ),
    permission = "execute"),
    "^Files [:a-zA-Z0-9\\/_']+ and [:a-zA-Z0-9\\/_']+ do not have permission: execute"
  )

  # Throws error when path is non-character
  expect_snapshot(assert_file_permissions(c(TRUE), permission = "write"), error = TRUE)


  # Change permissions back to write so files can be deleted
  Sys.chmod(file_with_write_permission, mode = "200")
  Sys.chmod(file_with_execute_permission, mode = "200")
  Sys.chmod(file_with_read_permission, mode = "200")
})


test_that("assert_file_extension() works", {

  # Passes when file has extensions
  expect_true(assert_file_extension("file.ext", extensions = "ext"))
  expect_true(assert_file_extension("file.ext.gz", extensions = "ext", compression = TRUE))
  expect_true(assert_file_extension("bob.billy.ext", extensions = "ext"))
  expect_true(assert_file_extension(c("file.ext.gz", "file.ext"), extensions = "ext", compression = TRUE))

  # Passes when files all have one of the valid extension
  expect_true(assert_file_extension(c("file.fns", "billy.fasta", "bob.fa", "billy.fa"), extensions = c("fasta", "fa", "fns")))

  # Throws error when dir doesn't exist
  expect_snapshot(assert_file_extension("file.ext", extensions = "bob"), error = TRUE)
  expect_snapshot(assert_file_extension("file.ADSAWD", extensions = "ext", compression = TRUE), error = TRUE)
  expect_snapshot(assert_file_extension("bob.blablaext", extensions = "ext"), error = TRUE)

  # Error messages use variable name of passed arguments
  x <- "file.ext"
  expect_error(assert_file_extension(x, "bobby"), "^'x'", fixed = FALSE)

  # Throws error when path is non-character
  expect_snapshot(assert_file_extension(c(TRUE), extensions = "ext"), error = TRUE)

})

