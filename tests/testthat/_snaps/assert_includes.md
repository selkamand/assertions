# assert_includes() works [plain]

    Code
      assert_includes(c(1, 2, 3), c(4, 5))
    Error <rlang_error>
      'c(1, 2, 3)' must include 4 and 5

---

    Code
      assert_includes(1, c(2, 3))
    Error <rlang_error>
      '1' must include 2 and 3

---

    Code
      assert_includes(1, c(1, 3))
    Error <rlang_error>
      '1' must include 3

---

    Code
      assert_includes("abc", "def")
    Error <rlang_error>
      '"abc"' must include def

---

    Code
      assert_includes(c(1, 2, 3), c("A"))
    Error <rlang_error>
      'c(1, 2, 3)' (type: double) must be the same type as c("A") (type: character)

# assert_excludes() works [plain]

    Code
      assert_excludes(c(1, 2, 3), c(1, 2))
    Error <rlang_error>
      'c(1, 2, 3)' must exclude: 1 and 2

---

    Code
      assert_excludes(1, c(1, 3))
    Error <rlang_error>
      '1' must exclude: 1

---

    Code
      assert_excludes("abc", "abc")
    Error <rlang_error>
      '"abc"' must exclude: abc

---

    Code
      assert_excludes(c(1, 2, 3), c("A"))
    Error <rlang_error>
      'c(1, 2, 3)' (type: double) must be the same type as c("A") (type: character)

