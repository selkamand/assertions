# assert_whole_number() works [plain]

    Code
      assert_whole_number(1.5)
    Error <rlang_error>
      '1.5' is not a whole number

---

    Code
      assert_whole_number(0.5)
    Error <rlang_error>
      '0.5' is not a whole number

---

    Code
      assert_whole_number(-1.5)
    Error <rlang_error>
      '-1.5' is not a whole number

---

    Code
      assert_whole_number("abc")
    Error <rlang_error>
      '"abc"' is not a number! (class is character, not numeric)

---

    Code
      assert_whole_number(c(1, 2, 3))
    Error <rlang_error>
      'c(1, 2, 3)' is not a number! (length is 3, not 1)

