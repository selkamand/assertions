# assert_non_empty_string() works [plain]

    Code
      assert_non_empty_string("")
    Condition
      Error:
      ! '""' is an empty string!

---

    Code
      assert_non_empty_string(123)
    Condition
      Error:
      ! '123' is not a string! (class is numeric, not character)

---

    Code
      assert_non_empty_string(c(1, 2, 3))
    Condition
      Error:
      ! 'c(1, 2, 3)' is not a string! (class is numeric, not character)

# assert_list() works [plain]

    Code
      assert_list(1)
    Condition
      Error:
      ! '1' must be a list, not a numeric

---

    Code
      assert_list(1.5)
    Condition
      Error:
      ! '1.5' must be a list, not a numeric

---

    Code
      assert_list("abc")
    Condition
      Error:
      ! '"abc"' must be a list, not a character

---

    Code
      assert_list(c(1, 2, 3))
    Condition
      Error:
      ! 'c(1, 2, 3)' must be a list, not a numeric

---

    Code
      assert_list(mtcars)
    Condition
      Error:
      ! 'mtcars' must be a list, not a data.frame

---

    Code
      assert_list(factor(c(1, 2, 3)))
    Condition
      Error:
      ! 'factor(c(1, 2, 3))' must be a list, not a factor

# assert_reactive() works [plain]

    Code
      assert_reactive(1)
    Condition
      Error:
      ! '1' must be a reactive, not a numeric

---

    Code
      assert_reactive(1.5)
    Condition
      Error:
      ! '1.5' must be a reactive, not a numeric

---

    Code
      assert_reactive("abc")
    Condition
      Error:
      ! '"abc"' must be a reactive, not a character

---

    Code
      assert_reactive(c(1, 2, 3))
    Condition
      Error:
      ! 'c(1, 2, 3)' must be a reactive, not a numeric

---

    Code
      assert_reactive(mtcars)
    Condition
      Error:
      ! 'mtcars' must be a reactive, not a data.frame

---

    Code
      assert_reactive(factor(c(1, 2, 3)))
    Condition
      Error:
      ! 'factor(c(1, 2, 3))' must be a reactive, not a factor

# assert_function() works [plain]

    Code
      assert_function(1)
    Condition
      Error:
      ! '1' must be a function, not a numeric

---

    Code
      assert_function("abc")
    Condition
      Error:
      ! '"abc"' must be a function, not a character

---

    Code
      assert_function(c(1, 2, 3))
    Condition
      Error:
      ! 'c(1, 2, 3)' must be a function, not a numeric

