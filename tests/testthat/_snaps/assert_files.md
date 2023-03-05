# assert_file_exists() works

    Code
      assert_file_exists(2)
    Error <rlang_error>
      '2' must be a character, not a numeric

# assert_directory_exists() works

    Code
      assert_directory_exists("asdasdaw")
    Error <rlang_error>
      Failed to find directory: 'asdasdaw'

---

    Code
      assert_directory_exists(c("asdasdaw", "adwadwad"))
    Error <rlang_error>
      Failed to find directories: 'asdasdaw' and 'adwadwad'

---

    Code
      assert_directory_exists(100)
    Error <rlang_error>
      '100' must be a character, not a numeric

# assert_file_permissions() works

    Code
      assert_file_permissions(c(TRUE), permission = "write")
    Error <rlang_error>
      'c(TRUE)' must be a character, not a logical

# assert_file_extension() works

    Code
      assert_file_extension("file.ext", extensions = "bob")
    Error <rlang_error>
      '"file.ext"' have an invalid extension (required extension/s: bob). The following file has unexpected extensions: [file.ext]

---

    Code
      assert_file_extension("file.ADSAWD", extensions = "ext", compression = TRUE)
    Error <rlang_error>
      '"file.ADSAWD"' have an invalid extension (required extension/s: ext). The following file has unexpected extensions: [file.ADSAWD]

---

    Code
      assert_file_extension("bob.blablaext", extensions = "ext")
    Error <rlang_error>
      '"bob.blablaext"' have an invalid extension (required extension/s: ext). The following file has unexpected extensions: [bob.blablaext]

---

    Code
      assert_file_extension(c(TRUE), extensions = "ext")
    Error <rlang_error>
      'c(TRUE)' must be a character, not a logical

