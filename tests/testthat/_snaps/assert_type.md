# assert_non_empty_string() works [plain]

    Code
      assert_non_empty_string("")
    Error <rlang_error>
      '""' is an empty string!

---

    Code
      assert_non_empty_string(123)
    Error <rlang_error>
      '123' is not a string! (class is numeric, not character)

---

    Code
      assert_non_empty_string(c(1, 2, 3))
    Error <rlang_error>
      'c(1, 2, 3)' is not a string! (class is numeric, not character)

# assert_list() works [plain]

    Code
      assert_list(1)
    Error <rlang_error>
      '1' must be a list, not a numeric

---

    Code
      assert_list(1.5)
    Error <rlang_error>
      '1.5' must be a list, not a numeric

---

    Code
      assert_list("abc")
    Error <rlang_error>
      '"abc"' must be a list, not a character

---

    Code
      assert_list(c(1, 2, 3))
    Error <rlang_error>
      'c(1, 2, 3)' must be a list, not a numeric

---

    Code
      assert_list(mtcars)
    Error <rlang_error>
      'mtcars' must be a list, not a data.frame

---

    Code
      assert_list(factor(c(1, 2, 3)))
    Error <rlang_error>
      'factor(c(1, 2, 3))' must be a list, not a factor

# assert_reactive() works [plain]

    Code
      assert_reactive(1)
    Error <rlang_error>
      '1' must be a reactive, not a numeric

---

    Code
      assert_reactive(1.5)
    Error <rlang_error>
      '1.5' must be a reactive, not a numeric

---

    Code
      assert_reactive("abc")
    Error <rlang_error>
      '"abc"' must be a reactive, not a character

---

    Code
      assert_reactive(c(1, 2, 3))
    Error <rlang_error>
      'c(1, 2, 3)' must be a reactive, not a numeric

---

    Code
      assert_reactive(mtcars)
    Error <rlang_error>
      'mtcars' must be a reactive, not a data.frame

---

    Code
      assert_reactive(factor(c(1, 2, 3)))
    Error <rlang_error>
      'factor(c(1, 2, 3))' must be a reactive, not a factor

