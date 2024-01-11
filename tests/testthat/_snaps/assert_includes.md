# assert_includes() works [plain]

    Code
      assert_includes(c(1, 2, 3), c(4, 5))
    Condition
      Error:
      ! 'c(1, 2, 3)' must include 4 and 5

---

    Code
      assert_includes(1, c(2, 3))
    Condition
      Error:
      ! '1' must include 2 and 3

---

    Code
      assert_includes(1, c(1, 3))
    Condition
      Error:
      ! '1' must include 3

---

    Code
      assert_includes("abc", "def")
    Condition
      Error:
      ! '"abc"' must include def

---

    Code
      assert_includes(c(1, 2, 3), c("A"))
    Condition
      Error:
      ! 'c(1, 2, 3)' (type: double) must be the same type as c("A") (type: character)

# assert_excludes() works [plain]

    Code
      assert_excludes(c(1, 2, 3), c(1, 2))
    Condition
      Error:
      ! 'c(1, 2, 3)' must exclude: 1 and 2

---

    Code
      assert_excludes(1, c(1, 3))
    Condition
      Error:
      ! '1' must exclude: 1

---

    Code
      assert_excludes("abc", "abc")
    Condition
      Error:
      ! '"abc"' must exclude: abc

---

    Code
      assert_excludes(c(1, 2, 3), c("A"))
    Condition
      Error:
      ! 'c(1, 2, 3)' (type: double) must be the same type as c("A") (type: character)

