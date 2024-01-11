# assert_class() works [plain]

    Code
      assert_class(1, class = "character")
    Condition
      Error:
      ! '1' must belong to class 'character', not numeric

---

    Code
      assert_class("abc", class = "numeric")
    Condition
      Error:
      ! '"abc"' must belong to class 'numeric', not character

---

    Code
      assert_class(mtcars, class = "list")
    Condition
      Error:
      ! 'mtcars' must belong to class 'list', not data.frame

# assert_no_missing() works [plain]

    Code
      assert_no_missing(c(1, 2, NA))
    Condition
      Error:
      ! 'c(1, 2, NA)' must have no missing values! Found 1

---

    Code
      assert_no_missing(c("a", NA, "c"))
    Condition
      Error:
      ! 'c("a", NA, "c")' must have no missing values! Found 1

