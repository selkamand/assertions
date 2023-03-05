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

