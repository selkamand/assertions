# assert_greater_than() works [plain]

    Code
      assert_greater_than(c(2, 3, 1), 3)
    Condition
      Error:
      ! 'c(2, 3, 1)' is not a number! (length is 3, not 1)

---

    Code
      assert_greater_than(c(2, 3, 4), 2)
    Condition
      Error:
      ! 'c(2, 3, 4)' is not a number! (length is 3, not 1)

---

    Code
      assert_greater_than("abc", 2)
    Condition
      Error:
      ! '"abc"' is not a number! (class is character, not numeric)

---

    Code
      assert_greater_than(list(1, 2, 3), 2)
    Condition
      Error:
      ! 'list(1, 2, 3)' is not a number! (class is list, not numeric)

---

    Code
      assert_greater_than(c(3, 4, 5), 2)
    Condition
      Error:
      ! 'c(3, 4, 5)' is not a number! (length is 3, not 1)

---

    Code
      assert_greater_than(factor(4), 2)
    Condition
      Error:
      ! 'factor(4)' is not a number! (class is factor, not numeric)

---

    Code
      assert_greater_than(TRUE, 2)
    Condition
      Error:
      ! 'TRUE' is not a number! (class is logical, not numeric)

---

    Code
      assert_greater_than(NULL, 2)
    Condition
      Error:
      ! 'NULL' is not a number! (class is NULL, not numeric)

# assert_all_greater_than() works [plain]

    Code
      assert_all_greater_than(c(2, 3, 1), 3)
    Condition
      Error:
      ! c(2, 3, 1) must all be greater than `3`.

---

    Code
      assert_all_greater_than(c(2, 3, 4), 2)
    Condition
      Error:
      ! c(2, 3, 4) must all be greater than `2`.

---

    Code
      assert_all_greater_than(2, 2)
    Condition
      Error:
      ! 2 must be greater than `2`.

---

    Code
      assert_all_greater_than("abc", 2)
    Condition
      Error:
      ! '"abc"' must be numeric, not a character

---

    Code
      assert_all_greater_than(list(1, 2, 3), 2)
    Condition
      Error:
      ! 'list(1, 2, 3)' must be numeric, not a list

---

    Code
      assert_all_greater_than(c(1, 2, 3), 2)
    Condition
      Error:
      ! c(1, 2, 3) must all be greater than `2`.

---

    Code
      assert_all_greater_than(factor(c(1, 2, 3)), 2)
    Condition
      Error:
      ! 'factor(c(1, 2, 3))' must be numeric, not a factor

---

    Code
      assert_all_greater_than(TRUE, 2)
    Condition
      Error:
      ! 'TRUE' must be numeric, not a logical

---

    Code
      assert_all_greater_than(NULL, 2)
    Condition
      Error:
      ! 'NULL' must be numeric, not a NULL

# assert_all_greater_than_or_equal_to() works [plain]

    Code
      assert_all_greater_than_or_equal_to(c(2, 3, 1), 3)
    Condition
      Error:
      ! c(2, 3, 1) must all be greater than or equal to `3`.

---

    Code
      assert_all_greater_than_or_equal_to("abc", 2)
    Condition
      Error:
      ! '"abc"' must be numeric, not a character

---

    Code
      assert_all_greater_than_or_equal_to(list(1, 2, 3), 2)
    Condition
      Error:
      ! 'list(1, 2, 3)' must be numeric, not a list

---

    Code
      assert_all_greater_than_or_equal_to(c(1, 2, 3), 2)
    Condition
      Error:
      ! c(1, 2, 3) must all be greater than or equal to `2`.

---

    Code
      assert_all_greater_than_or_equal_to(factor(c(1, 2, 3)), 2)
    Condition
      Error:
      ! 'factor(c(1, 2, 3))' must be numeric, not a factor

---

    Code
      assert_all_greater_than_or_equal_to(TRUE, 2)
    Condition
      Error:
      ! 'TRUE' must be numeric, not a logical

---

    Code
      assert_all_greater_than_or_equal_to(NULL, 2)
    Condition
      Error:
      ! 'NULL' must be numeric, not a NULL

---

    Code
      assert_all_greater_than_or_equal_to(NA, 3)
    Condition
      Error:
      ! 'NA' must be numeric, not a logical

---

    Code
      assert_all_greater_than_or_equal_to(c(4, NA), 3)
    Condition
      Error in `compare()`:
      ! 'c(4, NA)' must have no missing values! Found 1

# assert_greater_than_or_equal_to() works [plain]

    Code
      assert_greater_than_or_equal_to(2, 3)
    Condition
      Error:
      ! 2 must be greater than or equal to `3`.

---

    Code
      assert_greater_than_or_equal_to("abc", 2)
    Condition
      Error:
      ! '"abc"' is not a number! (class is character, not numeric)

---

    Code
      assert_greater_than_or_equal_to(list(1, 2, 3), 2)
    Condition
      Error:
      ! 'list(1, 2, 3)' is not a number! (class is list, not numeric)

---

    Code
      assert_greater_than_or_equal_to(c(3, 2, 3), 2)
    Condition
      Error:
      ! 'c(3, 2, 3)' is not a number! (length is 3, not 1)

---

    Code
      assert_greater_than_or_equal_to(factor(1), 2)
    Condition
      Error:
      ! 'factor(1)' is not a number! (class is factor, not numeric)

---

    Code
      assert_greater_than_or_equal_to(TRUE, 2)
    Condition
      Error:
      ! 'TRUE' is not a number! (class is logical, not numeric)

---

    Code
      assert_greater_than(NULL, 2)
    Condition
      Error:
      ! 'NULL' is not a number! (class is NULL, not numeric)

---

    Code
      assert_greater_than_or_equal_to(NA, 3)
    Condition
      Error:
      ! 'NA' is not a number! (class is logical, not numeric)

---

    Code
      assert_greater_than_or_equal_to(c(4, NA), 3)
    Condition
      Error:
      ! 'c(4, NA)' is not a number! (length is 2, not 1)

# assert_all_between() works [plain]

    Code
      assert_all_between(c(2, 3, 4), 2, 4, comparison_inclusive = FALSE)
    Condition
      Error:
      ! c(2, 3, 4) must all be between `2`and`4`.

---

    Code
      assert_all_between(c(2, 3, 1), 2, 4)
    Condition
      Error:
      ! c(2, 3, 1) must all be between `2`and`4`.

---

    Code
      assert_all_between("abc", 2, 4)
    Condition
      Error:
      ! '"abc"' must be numeric, not a character

---

    Code
      assert_all_between(list(1, 2, 3), 2, 4)
    Condition
      Error:
      ! 'list(1, 2, 3)' must be numeric, not a list

---

    Code
      assert_all_between(factor(c(1, 2, 3)), 2, 4)
    Condition
      Error:
      ! 'factor(c(1, 2, 3))' must be numeric, not a factor

---

    Code
      assert_all_between(TRUE, 2, 4)
    Condition
      Error:
      ! 'TRUE' must be numeric, not a logical

---

    Code
      assert_all_between(NULL, 2, 4)
    Condition
      Error:
      ! 'NULL' must be numeric, not a NULL

# assert_between() works [plain]

    Code
      assert_between(5, 1, 4)
    Condition
      Error:
      ! 5 must be between `1`and`4`.

---

    Code
      assert_between("abc", 1, 4)
    Condition
      Error:
      ! '"abc"' is not a number! (class is character, not numeric)

---

    Code
      assert_between(list(1, 2, 3), 1, 4)
    Condition
      Error:
      ! 'list(1, 2, 3)' is not a number! (class is list, not numeric)

---

    Code
      assert_between(c(2, 3, 4), 1, 4)
    Condition
      Error:
      ! 'c(2, 3, 4)' is not a number! (length is 3, not 1)

---

    Code
      assert_between(factor(4), 1, 4)
    Condition
      Error:
      ! 'factor(4)' is not a number! (class is factor, not numeric)

---

    Code
      assert_between(TRUE, 1, 4)
    Condition
      Error:
      ! 'TRUE' is not a number! (class is logical, not numeric)

---

    Code
      assert_between(NULL, 1, 4)
    Condition
      Error:
      ! 'NULL' is not a number! (class is NULL, not numeric)

# assert_identical() works [plain]

    Code
      assert_identical(c(3, 3, 3), 3)
    Condition
      Error:
      ! c(3, 3, 3) must be identical to 3

---

    Code
      assert_identical(3, 4)
    Condition
      Error:
      ! 3 must be identical to 4

---

    Code
      assert_identical(c(1, 2, 3), 3)
    Condition
      Error:
      ! c(1, 2, 3) must be identical to 3

---

    Code
      assert_identical(list(1, 2, 3), list(1, 2, 4))
    Condition
      Error:
      ! list(1, 2, 3) must be identical to list(1, 2, 4)

---

    Code
      assert_identical(x = length(1:3), y = 3)
    Condition
      Error:
      ! length(1:3) must be identical to 3

---

    Code
      assert_identical(c(a = 3), c(b = 3))
    Condition
      Error:
      ! c(a = 3) must be identical to c(b = 3)

# assert_equal() works [plain]

    Code
      assert_equal(c(3, 3, 3), 3)
    Condition
      Error:
      ! c(3, 3, 3) must be equal to 3

---

    Code
      assert_equal(3, 4)
    Condition
      Error:
      ! 3 must be equal to 4

---

    Code
      assert_equal(c(1, 2, 3), 3)
    Condition
      Error:
      ! c(1, 2, 3) must be equal to 3

---

    Code
      assert_equal(list(1, 2, 3), list(1, 2, 4))
    Condition
      Error:
      ! list(1, 2, 3) must be equal to list(1, 2, 4)

---

    Code
      assert_equal(c(a = 3), c(b = 3), check_names = TRUE)
    Condition
      Error:
      ! c(a = 3) must be equal to c(b = 3)
