# assert_null() works [plain]

    Code
      assert_null(1)
    Condition
      Error:
      ! '1' must be NULL!

---

    Code
      assert_null("abc")
    Condition
      Error:
      ! '"abc"' must be NULL!

---

    Code
      assert_null(c(1, 2, 3))
    Condition
      Error:
      ! 'c(1, 2, 3)' must be NULL!

---

    Code
      assert_null(list(a = 1, b = 2))
    Condition
      Error:
      ! 'list(a = 1, b = 2)' must be NULL!

---

    Code
      assert_null(data.frame(a = 1, b = 2))
    Condition
      Error:
      ! 'data.frame(a = 1, b = 2)' must be NULL!

---

    Code
      assert_null(function(x) x)
    Condition
      Error:
      ! 'function(x) x' must be NULL!

---

    Code
      assert_null(environment())
    Condition
      Error:
      ! 'environment()' must be NULL!

# assert_non_null() works [plain]

    Code
      assert_non_null(NULL)
    Condition
      Error:
      ! 'NULL' must not be NULL!

