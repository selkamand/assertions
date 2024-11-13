test_that("assert_file_exists() works", {

  # Create self-deleting file
  file1 <- withr::local_tempfile()
  write("file contents", file1)

  # Expectations
  expect_true(assert_file_exists(file1))

  # Throws error if file doesn't exist (can't be snapshots since tempfiles)
  expect_error(assert_file_exists('sdasda'), "Failed to find file: 'sdasda'", fixed = TRUE)
  expect_snapshot(assert_file_exists(c('sdasda', 'file2')), error = TRUE)

  # Throws error if non-character filepath given
  expect_snapshot(assert_file_exists(2), error = TRUE)

  # Throws error if file is a directory (similarly to file.exists)
  dirpath <- withr::local_tempdir()
  dirpath2 <- withr::local_tempdir()
  expect_error(assert_file_exists(dirpath), "is a directory, not a file")
  expect_snapshot(assert_file_exists(c(dirpath, dirpath2)), error = TRUE)

  # Do NOT throw an error just because filepath is a glue string
  file1_as_glue <- glue::glue('{file1}')
  expect_error(assert_file_exists(file1_as_glue), regexp = NA)

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


  # Throws error if any files are directories
  dirpath <- withr::local_tempdir()
  dirpath2 <- withr::local_tempdir()
  expect_snapshot(assert_all_files_exist(c('sdasda', 'file2')), error = TRUE)
  expect_error(assert_all_files_exist(c(dirpath, dirpath2), "are directories, not files"))

  # Do NOT throw an error just because filepaths are glue strings
  file1_as_glue <- c(glue::glue('{file1}'), glue::glue('{file1}'))
  expect_error(assert_all_files_exist(file1_as_glue), regexp = NA)

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

  # Do NOT throw an error just because directory is a glue string
  dirpath_as_glue <- glue::glue('{dirpath}')
  expect_error(assert_directory_exists(dirpath_as_glue), regexp = NA)
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

  # Do NOT throw an error just because directories is a glue string
  dirpath_as_glue <- c(glue::glue('{dirpath}'), glue::glue('{dirpath2}'))
  expect_error(assert_all_directories_exist(dirpath_as_glue), regexp = NA)

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


# Test Underlying Functions -----------------------------------------------

##  All files exist ------------------------------------------------
test_that("all_files_exist() works", {
  # False when files don't exist
  expect_false(all_files_exist(c("ALKAWDWLKDLWADJWLD", "ADASKJDLAJWLDJKDKLWDJLAKDJWLKLDAW")))

  # Create two temporary files
  f1 <- withr::local_tempfile()
  f2 <- withr::local_tempfile()
  f3 <- "Does Not exist"

  # Write some content to the files to ensure they exist
  writeLines("Test content 1", f1)
  writeLines("Test content 2", f2)

  # Test that both files exist
  expect_true(file.exists(f1))
  expect_true(file.exists(f2))

  # Test all_files_exist() function
  expect_true(all_files_exist(c(f1, f2)))
  expect_false(all_files_exist(c(f1, f2, f3)))
})

##  Has Extension ------------------------------------------------
test_that("has_extension works() works", {
  # False when files don't exist
  expect_false(all_files_exist(c("ALKAWDWLKDLWADJWLD", "ADASKJDLAJWLDJKDKLWDJLAKDJWLKLDAW")))

  # Create two temporary files
  f1 <- withr::local_tempfile()
  f2 <- withr::local_tempfile()
  f3 <- "Does Not exist"

  # Write some content to the files to ensure they exist
  writeLines("Test content 1", f1)
  writeLines("Test content 2", f2)

  # Test that both files exist
  expect_true(file.exists(f1))
  expect_true(file.exists(f2))

  # Test all_files_exist() function
  expect_true(all_files_exist(c(f1, f2)))
  expect_false(all_files_exist(c(f1, f2, f3)))
})


test_that("has_extension works with single valid extensions", {
  expect_true(has_extension("file.txt", extensions = "txt"))
  expect_true(has_extension("file.csv", extensions = "csv"))
  expect_false(has_extension("file.doc", extensions = "txt"))
})

test_that("has_extension works with multiple valid extensions", {
  expect_true(has_extension("file.txt", extensions = c("txt", "csv")))
  expect_true(has_extension("file.csv", extensions = c("txt", "csv")))
  expect_false(has_extension("file.doc", extensions = c("txt", "csv")))
})

test_that("has_extension handles multiple files", {
  expect_true(has_extension(c("file1.txt", "file2.txt"), extensions = "txt"))
  expect_false(has_extension(c("file1.txt", "file2.csv"), extensions = "txt"))
  expect_true(has_extension(c("file1.txt", "file2.csv"), extensions = c("txt", "csv")))
})

test_that("has_extension handles compression correctly", {
  expect_true(has_extension("file.txt.gz", extensions = "txt", compression = TRUE))
  expect_false(has_extension("file.doc.gz", extensions = "txt", compression = TRUE))
  expect_true(has_extension("file.txt.bz2", extensions = "txt", compression = TRUE))
  expect_true(has_extension("file.csv.xz", extensions = "csv", compression = TRUE))
  expect_false(has_extension("file.csv.zip", extensions = "csv", compression = TRUE)) # zip is not supported as compression
})

test_that("has_extension handles files without extensions", {
  expect_false(has_extension("file", extensions = "txt"))
  expect_false(has_extension("file", extensions = c("txt", "csv")))
  expect_true(has_extension("file", extensions = "")) # No extension, treated as valid if `extensions` includes an empty string
})

test_that("has_extension handles mixed cases and unexpected inputs", {
  expect_false(has_extension(c("file.TXT", "file.csv"), extensions = "txt")) # Case sensitivity
  expect_true(has_extension("file.txt.gz", extensions = "txt", compression = TRUE))
  expect_false(has_extension("file.txt.gz", extensions = "gz", compression = TRUE)) # Compression stripped
  expect_true(has_extension(c("file.txt", "file.TXT"), extensions = c("txt", "TXT"))) # Mixed-case extensions
})

##  Files Missing Extension ------------------------------------------------

test_that("files_missing_extension identifies files without specified extensions", {
  # Only "file.doc" does not match the specified extensions
  expect_equal(files_missing_extension(c("file.txt", "file.csv", "file.doc"), extensions = c("txt", "csv")),
               c("file.doc"))

  # Both "file.doc" and "file.pdf" do not match "txt"
  expect_equal(files_missing_extension(c("file.txt", "file.doc", "file.pdf"), extensions = "txt"),
               c("file.doc", "file.pdf"))

  # No files are missing the specified extension
  expect_equal(files_missing_extension(c("file.txt", "file.csv"), extensions = c("txt", "csv")),
               character(0))
})


test_that("files_missing_extension handles compression correctly", {
  # Only "file.doc.gz" does not match "txt" when compression is enabled
  expect_equal(files_missing_extension(c("file.txt.gz", "file.csv.bz2", "file.doc.gz"), extensions = "txt", compression = TRUE),
               c("file.csv.bz2", "file.doc.gz"))

  # When compression is disabled, all files with compression extensions are treated as missing
  expect_equal(files_missing_extension(c("file.txt.gz", "file.csv.bz2", "file.doc.gz"), extensions = c("txt", "csv"), compression = FALSE),
               c("file.txt.gz", "file.csv.bz2", "file.doc.gz"))

  # Mixed case: Only "file.doc.xz" is missing the specified extensions
  expect_equal(files_missing_extension(c("file.txt.gz", "file.csv.bz2", "file.doc.xz"), extensions = c("txt", "csv"), compression = TRUE),
               c("file.doc.xz"))
})

test_that("files_missing_extension handles files without any extensions", {
  # Files without extensions should be identified as missing
  expect_equal(files_missing_extension(c("file1", "file2.txt", "file3"), extensions = "txt"),
               c("file1", "file3"))

  # If extensions includes an empty string, files without extensions should be considered valid
  expect_equal(files_missing_extension(c("file1", "file2.txt", "file3"), extensions = c("txt", "")),
               character(0))
})

