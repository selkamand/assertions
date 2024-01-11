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

