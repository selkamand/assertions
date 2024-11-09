# assert_less_than() works [plain]

    Code
      assert_less_than(3, 2)
    Condition
      Error:
      ! 3 must be less than `2`.

---

    Code
      assert_less_than(4, 2)
    Condition
      Error:
      ! 4 must be less than `2`.

---

    Code
      assert_less_than("abc", 2)
    Condition
      Error:
      ! '"abc"' is not a number! (class is character, not numeric)

---

    Code
      assert_less_than(list(1, 2, 3), 2)
    Condition
      Error:
      ! 'list(1, 2, 3)' is not a number! (class is list, not numeric)

---

    Code
      assert_less_than(c(3, 4, 5), 2)
    Condition
      Error:
      ! 'c(3, 4, 5)' is not a number! (length is 3, not 1)

---

    Code
      assert_less_than(factor(4), 2)
    Condition
      Error:
      ! 'factor(4)' is not a number! (class is factor, not numeric)

---

    Code
      assert_less_than(TRUE, 2)
    Condition
      Error:
      ! 'TRUE' is not a number! (class is logical, not numeric)

---

    Code
      assert_less_than(NULL, 2)
    Condition
      Error:
      ! 'NULL' is not a number! (class is NULL, not numeric)

# assert_all_less_than() works [plain]

    Code
      assert_all_less_than(c(2, 3, 4), 3)
    Condition
      Error:
      ! c(2, 3, 4) must all be less than `3`.

---

    Code
      assert_all_less_than(2, 2)
    Condition
      Error:
      ! 2 must be less than `2`.

---

    Code
      assert_all_less_than("abc", 2)
    Condition
      Error:
      ! '"abc"' must be numeric, not a character

---

    Code
      assert_all_less_than(list(1, 2, 3), 2)
    Condition
      Error:
      ! 'list(1, 2, 3)' must be numeric, not a list

---

    Code
      assert_all_less_than(factor(c(1, 2, 3)), 2)
    Condition
      Error:
      ! 'factor(c(1, 2, 3))' must be numeric, not a factor

---

    Code
      assert_all_less_than(TRUE, 2)
    Condition
      Error:
      ! 'TRUE' must be numeric, not a logical

---

    Code
      assert_all_less_than(NULL, 2)
    Condition
      Error:
      ! 'NULL' must be numeric, not a NULL

# assert_all_less_than_or_equal_to() works [plain]

    Code
      assert_all_less_than_or_equal_to(c(2, 3, 4), 3)
    Condition
      Error:
      ! c(2, 3, 4) must all be less than or equal to `3`.

---

    Code
      assert_all_less_than_or_equal_to("abc", 2)
    Condition
      Error:
      ! '"abc"' must be numeric, not a character

---

    Code
      assert_all_less_than_or_equal_to(list(1, 2, 3), 2)
    Condition
      Error:
      ! 'list(1, 2, 3)' must be numeric, not a list

---

    Code
      assert_all_less_than_or_equal_to(factor(c(1, 2, 3)), 2)
    Condition
      Error:
      ! 'factor(c(1, 2, 3))' must be numeric, not a factor

---

    Code
      assert_all_less_than_or_equal_to(TRUE, 2)
    Condition
      Error:
      ! 'TRUE' must be numeric, not a logical

---

    Code
      assert_all_less_than_or_equal_to(NULL, 2)
    Condition
      Error:
      ! 'NULL' must be numeric, not a NULL

# assert_less_than_or_equal_to() works [plain]

    Code
      assert_less_than_or_equal_to(3, 2)
    Condition
      Error:
      ! 3 must be less than or equal to `2`.

---

    Code
      assert_less_than_or_equal_to("abc", 2)
    Condition
      Error:
      ! '"abc"' is not a number! (class is character, not numeric)

---

    Code
      assert_less_than_or_equal_to(list(1, 2, 3), 2)
    Condition
      Error:
      ! 'list(1, 2, 3)' is not a number! (class is list, not numeric)

---

    Code
      assert_less_than_or_equal_to(c(3, 2, 3), 2)
    Condition
      Error:
      ! 'c(3, 2, 3)' is not a number! (length is 3, not 1)

---

    Code
      assert_less_than_or_equal_to(factor(1), 2)
    Condition
      Error:
      ! 'factor(1)' is not a number! (class is factor, not numeric)

---

    Code
      assert_less_than_or_equal_to(TRUE, 2)
    Condition
      Error:
      ! 'TRUE' is not a number! (class is logical, not numeric)

---

    Code
      assert_less_than_or_equal_to(NULL, 2)
    Condition
      Error:
      ! 'NULL' is not a number! (class is NULL, not numeric)

