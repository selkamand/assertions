# assert_class() works [plain]

    Code
      assert_class(1, class = "character")
    Error <rlang_error>
      '1' must belong to class 'character', not numeric

---

    Code
      assert_class("abc", class = "numeric")
    Error <rlang_error>
      '"abc"' must belong to class 'numeric', not character

---

    Code
      assert_class(mtcars, class = "list")
    Error <rlang_error>
      'mtcars' must belong to class 'list', not data.frame

