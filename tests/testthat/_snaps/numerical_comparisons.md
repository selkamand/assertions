# assert_greater_than() works [plain]

    Code
      assert_greater_than(c(2, 3, 1), 3)
    Error <rlang_error>
      c(2, 3, 1) must all be greater than `3`.

---

    Code
      assert_greater_than(c(2, 3, 4), 2)
    Error <rlang_error>
      c(2, 3, 4) must all be greater than `2`.

---

    Code
      assert_greater_than("abc", 2)
    Error <rlang_error>
      '"abc"' must be numeric, not a character

---

    Code
      assert_greater_than(list(1, 2, 3), 2)
    Error <rlang_error>
      'list(1, 2, 3)' must be numeric, not a list

---

    Code
      assert_greater_than(c(1, 2, 3), 2)
    Error <rlang_error>
      c(1, 2, 3) must all be greater than `2`.

---

    Code
      assert_greater_than(factor(c(1, 2, 3)), 2)
    Error <rlang_error>
      'factor(c(1, 2, 3))' must be numeric, not a factor

---

    Code
      assert_greater_than(TRUE, 2)
    Error <rlang_error>
      'TRUE' must be numeric, not a logical

---

    Code
      assert_greater_than(NULL, 2)
    Error <rlang_error>
      'NULL' must be numeric, not a NULL

# assert_greater_than_or_equal_to() works [plain]

    Code
      assert_greater_than_or_equal_to(c(2, 3, 1), 3)
    Error <rlang_error>
      c(2, 3, 1) must all be greater than or equal to `3`.

---

    Code
      assert_greater_than_or_equal_to("abc", 2)
    Error <rlang_error>
      '"abc"' must be numeric, not a character

---

    Code
      assert_greater_than_or_equal_to(list(1, 2, 3), 2)
    Error <rlang_error>
      'list(1, 2, 3)' must be numeric, not a list

---

    Code
      assert_greater_than_or_equal_to(c(1, 2, 3), 2)
    Error <rlang_error>
      c(1, 2, 3) must all be greater than or equal to `2`.

---

    Code
      assert_greater_than_or_equal_to(factor(c(1, 2, 3)), 2)
    Error <rlang_error>
      'factor(c(1, 2, 3))' must be numeric, not a factor

---

    Code
      assert_greater_than_or_equal_to(TRUE, 2)
    Error <rlang_error>
      'TRUE' must be numeric, not a logical

---

    Code
      assert_greater_than(NULL, 2)
    Error <rlang_error>
      'NULL' must be numeric, not a NULL

---

    Code
      assert_greater_than_or_equal_to(NA, 3)
    Error <rlang_error>
      'NA' must be numeric, not a logical

---

    Code
      assert_greater_than_or_equal_to(c(4, NA), 3)
    Error <rlang_error>
      ''c(4, NA)' must have no missing values! Found 1

