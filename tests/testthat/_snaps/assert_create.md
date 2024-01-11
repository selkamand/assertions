# assertion function aborts if func does not return a logical scalar when default_error_msg is supplied [plain]

    Code
      assert_is_numeric(2)
    Condition
      Error in `assert_is_numeric()`:
      ! Assertion Function `function(x) x` must return TRUE if assertion passes and FALSE or a String if assertion should fail. Instead returned: `2`

# assertion function aborts if func returns FALSE without a default error message [plain]

    Code
      bad_assert_no_default_error(2)
    Condition
      Error in `bad_assert_no_default_error()`:
      ! Assertion Function `function(x) FALSE` returned FALSE, indicating assertion should fail, however no `default_error_msg` was supplied! Please add a `default_error_msg` to your assert_create call, or change function to return a string describing the error instead of `FALSE`

---

    Code
      good_assert_no_default_error(2)
    Condition
      Error:
      ! an error message

# assertion function throws appropriate error when returning neither a flag NOR a string [plain]

    Code
      bad_assert_returns_char("foo")
    Condition
      Error in `bad_assert_returns_char()`:
      ! Assertion Function `function(x) c("a", "b")` must return TRUE if assertion passes and FALSE or a String if assertion should fail. Instead returned: `a and b`

---

    Code
      bad_assert_returns_logical("foo")
    Condition
      Error in `bad_assert_returns_logical()`:
      ! Assertion Function `function(x) c(TRUE, TRUE)` must return TRUE if assertion passes and FALSE or a String if assertion should fail. Instead returned: `TRUE and TRUE`

---

    Code
      bad_assert_returns_factor("foo")
    Condition
      Error in `bad_assert_returns_factor()`:
      ! Assertion Function `function(x) factor(c(1, 4))` must return TRUE if assertion passes and FALSE or a String if assertion should fail. Instead returned: `1 and 4`

# assertion function works as expected with string-returning assertion functions [plain]

    Code
      assert_between_min_and_max("foo", min = 3, max = 5)
    Condition
      Error:
      ! "foo" is a character, not numeric

---

    Code
      assert_between_min_and_max(6, min = 3, max = 5)
    Condition
      Error:
      ! 6 is over 5

---

    Code
      assert_between_min_and_max(2, min = 3, max = 5)
    Condition
      Error:
      ! 2 is under 3

