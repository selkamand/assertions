# assert_subset() works [plain]

    Code
      assert_subset(c(4, 5), c(1, 2, 3))
    Condition
      Error:
      x 'c(4, 5)' contains invalid values: 4 and 5. Valid values include: 1, 2, and 3

---

    Code
      assert_subset(c(2, 3), 1)
    Condition
      Error:
      x 'c(2, 3)' contains invalid values: 2 and 3. Valid values include: 1

---

    Code
      assert_subset(c(1, 3), c(2, 4))
    Condition
      Error:
      x 'c(1, 3)' contains invalid values: 1 and 3. Valid values include: 2 and 4

---

    Code
      assert_subset("def", "abc")
    Condition
      Error:
      x '"def"' contain an invalid value: def. Valid values include: abc

---

    Code
      assert_subset(c("A"), c(1, 2, 3))
    Condition
      Error:
      x 'c("A")' contain an invalid value: A. Valid values include: 1, 2, and 3

# assert_one_of() works [plain]

    Code
      assert_one_of(4, c(1, 2, 3))
    Condition
      Error:
      x '4' must be one of 1, 2, or 3, not 4.

---

    Code
      assert_one_of("D", c("A", "B", "C"))
    Condition
      Error:
      x '"D"' must be one of A, B, or C, not D.

---

    Code
      assert_one_of(3.5, c(1, 2.5, 3))
    Condition
      Error:
      x '3.5' must be one of 1, 2.5, or 3, not 3.5.

---

    Code
      assert_one_of(c(1, 2), c(1, 2, 3))
    Condition
      Error:
      ! 'c(1, 2)' must be a scalar, not a numeric

---

    Code
      assert_one_of(list(1, 2), c(1, 2, 3))
    Condition
      Error:
      ! 'list(1, 2)' must be a scalar, not a list

# assert_set_equal() works [plain]

    Code
      assert_set_equal(c(1, 2, 3), c(1, 2))
    Condition
      Error:
      ! 'c(1, 2, 3)' contains an unexpected value: 3.

---

    Code
      assert_set_equal(c("A", "B"), c("A", "B", "C"))
    Condition
      Error:
      ! 'c("A", "B")' is missing a required value: C.

---

    Code
      assert_set_equal(c(1, 3, 4), c(1, 2, 3))
    Condition
      Error:
      ! 'c(1, 3, 4)' is missing a required value: 2, and contains an unexpected value: 4.

---

    Code
      assert_set_equal(c("A", "B", "C"), c(1, 2, 3))
    Condition
      Error:
      ! 'c("A", "B", "C")' is missing required values: 1, 2, and 3, and contains unexpected values: A, B, and C.

