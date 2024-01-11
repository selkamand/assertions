# assert_file_exists() works

    Code
      assert_file_exists(c("sdasda", "file2"))
    Condition
      Error:
      ! 'c("sdasda", "file2")' is not a string! (length is 2, not 1)

---

    Code
      assert_file_exists(2)
    Condition
      Error:
      ! '2' is not a string! (class is numeric, not character)

---

    Code
      assert_file_exists(c(dirpath, dirpath2))
    Condition
      Error:
      ! 'c(dirpath, dirpath2)' is not a string! (length is 2, not 1)

# assert_all_files_exist() works

    Code
      assert_all_files_exist(c("sdasda", "file2"))
    Condition
      Error:
      ! Failed to find files: 'sdasda' and 'file2'

---

    Code
      assert_all_files_exist(2)
    Condition
      Error:
      ! '2' must be a character vector, not a numeric

---

    Code
      assert_all_files_exist(c("sdasda", "file2"))
    Condition
      Error:
      ! Failed to find files: 'sdasda' and 'file2'

# assert_directory_exists() works

    Code
      assert_directory_exists("asdasdaw")
    Condition
      Error:
      ! Failed to find directory: 'asdasdaw'

---

    Code
      assert_directory_exists(100)
    Condition
      Error:
      ! '100' is not a string! (class is numeric, not character)

---

    Code
      assert_directory_exists(c("asdasdaw", "adwadwad"))
    Condition
      Error:
      ! 'c("asdasdaw", "adwadwad")' is not a string! (length is 2, not 1)

---

    Code
      assert_directory_exists(c(dirpath, dirpath2))
    Condition
      Error:
      ! 'c(dirpath, dirpath2)' is not a string! (length is 2, not 1)

# assert_all_directories_exist() works

    Code
      assert_all_directories_exist("asdasdaw")
    Condition
      Error:
      ! Failed to find directory: 'asdasdaw'

---

    Code
      assert_all_directories_exist(c("asdasdaw", "adwadwad"))
    Condition
      Error:
      ! Failed to find directories: 'asdasdaw' and 'adwadwad'

---

    Code
      assert_all_directories_exist(100)
    Condition
      Error:
      ! '100' must be a character, not a numeric

# assert_file_has_extension() works

    Code
      assert_file_has_extension(c("file.ext.gz", "file.ext"), extensions = "ext",
      compression = TRUE)
    Condition
      Error:
      ! 'c("file.ext.gz", "file.ext")' is not a string! (length is 2, not 1)

---

    Code
      assert_file_has_extension(c("file.fns", "billy.fasta", "bob.fa", "billy.fa"),
      extensions = c("fasta", "fa", "fns"))
    Condition
      Error:
      ! 'c("file.fns", "billy.fasta", "bob.fa", "billy.fa")' is not a string! (length is 4, not 1)

---

    Code
      assert_file_has_extension("file.ext", extensions = "bob")
    Condition
      Error:
      ! '"file.ext"' has an invalid extension (required extension/s: bob). The following file has an unexpected extension: [file.ext]

---

    Code
      assert_file_has_extension("file.ADSAWD", extensions = "ext", compression = TRUE)
    Condition
      Error:
      ! '"file.ADSAWD"' has an invalid extension (required extension/s: ext). The following file has an unexpected extension: [file.ADSAWD]

---

    Code
      assert_file_has_extension("bob.blablaext", extensions = "ext")
    Condition
      Error:
      ! '"bob.blablaext"' has an invalid extension (required extension/s: ext). The following file has an unexpected extension: [bob.blablaext]

---

    Code
      assert_file_has_extension(c(TRUE), extensions = "ext")
    Condition
      Error:
      ! 'c(TRUE)' is not a string! (class is logical, not character)

# assert_all_files_have_extension() works

    Code
      assert_all_files_have_extension("file.ext", extensions = "bob")
    Condition
      Error:
      ! '"file.ext"' has an invalid extension (required extension/s: bob). The following file has an unexpected extension: [file.ext]

---

    Code
      assert_all_files_have_extension("file.ADSAWD", extensions = "ext", compression = TRUE)
    Condition
      Error:
      ! '"file.ADSAWD"' has an invalid extension (required extension/s: ext). The following file has an unexpected extension: [file.ADSAWD]

---

    Code
      assert_all_files_have_extension("bob.blablaext", extensions = "ext")
    Condition
      Error:
      ! '"bob.blablaext"' has an invalid extension (required extension/s: ext). The following file has an unexpected extension: [bob.blablaext]

---

    Code
      assert_all_files_have_extension(c(TRUE), extensions = "ext")
    Condition
      Error:
      ! 'c(TRUE)' must be a character, not a logical

# assert_file_does_not_exist() works

    Code
      assert_file_does_not_exist(c("foo", "bar"))
    Condition
      Error:
      ! 'c("foo", "bar")' is not a string! (length is 2, not 1)

---

    Code
      assert_file_does_not_exist(2)
    Condition
      Error:
      ! '2' is not a string! (class is numeric, not character)

# assert_directory_does_not_exist() works

    Code
      assert_directory_does_not_exist(c("foo", "bar"))
    Condition
      Error:
      ! 'c("foo", "bar")' is not a string! (length is 2, not 1)

---

    Code
      assert_directory_does_not_exist(2)
    Condition
      Error:
      ! '2' is not a string! (class is numeric, not character)

