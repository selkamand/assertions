# assert_function_expects_n_arguments() works [plain]

    Code
      assert_function_expects_n_arguments(my_func_dots, 2, dots = "throw_error")
    Condition
      Error:
      ! 'my_func_dots' must not contain ... arguments

---

    Code
      assert_function_expects_n_arguments(my_func2, 2)
    Condition
      Error:
      ! 'my_func2' must expect exactly 2 arguments, not 1

---

    Code
      assert_function_expects_n_arguments(123, 1)
    Condition
      Error:
      ! '123' must be a function, not a numeric

---

    Code
      assert_function_expects_n_arguments(c(1, 2, 3), 2)
    Condition
      Error:
      ! 'c(1, 2, 3)' must be a function, not a numeric

