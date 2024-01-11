# assert_whole_number() works [plain]

    Code
      assert_whole_number(1.5)
    Condition
      Error:
      ! '1.5' is not a whole number

---

    Code
      assert_whole_number(0.5)
    Condition
      Error:
      ! '0.5' is not a whole number

---

    Code
      assert_whole_number(-1.5)
    Condition
      Error:
      ! '-1.5' is not a whole number

---

    Code
      assert_whole_number("abc")
    Condition
      Error:
      ! '"abc"' is not a number! (class is character, not numeric)

---

    Code
      assert_whole_number(c(1, 2, 3))
    Condition
      Error:
      ! 'c(1, 2, 3)' is not a number! (length is 3, not 1)

