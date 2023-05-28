
# Assert DataFrame -------------------------------------------------------
cli::test_that_cli("assert_dataframe() works", configs = "plain", {

  # Works for data.frames
  expect_identical(assert_dataframe(mtcars), TRUE)

  # Works for empty data.frames
  expect_identical(assert_dataframe(data.frame()), TRUE)

  # Aborts for non-data.frame objects
  expect_error(assert_dataframe(1:10), "'1:10' must be a data.frame, not a integer", fixed = TRUE)
  expect_error(assert_dataframe(matrix(1:6, 2, 3)), "'matrix(1:6, 2, 3)' must be a data.frame, not a matrix", fixed = TRUE)
  expect_error(assert_dataframe(c(1, 2, 3)), "'c(1, 2, 3)' must be a data.frame, not a numeric", fixed = TRUE)
  expect_error(assert_dataframe(list(a = 1, b = 2)), "'list(a = 1, b = 2)' must be a data.frame, not a list", fixed = TRUE)
  expect_error(assert_dataframe(factor(c(1, 2, 3))), "'factor(c(1, 2, 3))' must be a data.frame, not a factor", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- matrix(1:6, 2, 3)
  expect_error(assert_dataframe(y), "'y' must be a data.frame, not a matrix", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_dataframe(1:10, msg = "Custom error message"), "Custom error message")
})


# Assert Matrix ----------------------------------------------------------------
cli::test_that_cli("assert_matrix() works", configs = "plain", {

  # Works for matrices
  expect_identical(assert_matrix(matrix(1:9, 3)), TRUE)

  # Works for empty matrices
  expect_identical(assert_matrix(matrix()), TRUE)

  # Aborts for non-matrix objects
  expect_error(assert_matrix(1:10), "'1:10' must be a matrix, not a integer", fixed = TRUE)
  expect_error(assert_matrix(c(1, 2, 3)), "'c(1, 2, 3)' must be a matrix, not a numeric", fixed = TRUE)
  expect_error(assert_matrix(list(a = 1, b = 2)), "'list(a = 1, b = 2)' must be a matrix, not a list", fixed = TRUE)
  expect_error(assert_matrix(factor(c(1, 2, 3))), "'factor(c(1, 2, 3))' must be a matrix, not a factor", fixed = TRUE)
  expect_error(assert_matrix(data.frame(a = 1, b = 2)), "'data.frame(a = 1, b = 2)' must be a matrix, not a data.frame", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- data.frame(a = 1:5, b = 6:10)
  expect_error(assert_matrix(y), "'y' must be a matrix, not a data.frame", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_matrix(1:10, msg = "Custom error message"), "Custom error message")
})

# Assert Vector -----------------------------------------------------------
cli::test_that_cli("assert_vector() works", configs = "plain",  {
  #Works for vectors
  expect_identical(assert_vector(1:10), TRUE)
  expect_identical(assert_vector(c("a", "b", "c")), TRUE)

  #Works for empty vectors
  expect_identical(assert_vector(integer()), TRUE)
  expect_identical(assert_vector(character()), TRUE)

  #Aborts for non-vector objects
  expect_error(assert_vector(matrix(1:9, 3)), "'matrix(1:9, 3)' must be a vector, not a matrix", fixed = TRUE)
  expect_error(assert_vector(list(a = 1, b = 2)), "'list(a = 1, b = 2)' must be a vector, not a list", fixed = TRUE)
  expect_error(assert_vector(data.frame(a = 1, b = 2)), "'data.frame(a = 1, b = 2)' must be a vector, not a data.frame", fixed = TRUE)
  expect_error(assert_vector(function(x) x), "'function(x) x' must be a vector, not a function", fixed = TRUE)
  expect_error(assert_vector(environment()), "'environment()' must be a vector, not a environment", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- data.frame(a = 1:5, b = 6:10)
  expect_error(assert_vector(y), "'y' must be a vector, not a data.frame", fixed = TRUE)


  # Aborts for lists
  expect_error(assert_vector(list(a = 1, b = 2)), "'list(a = 1, b = 2)' must be a vector, not a list", fixed = TRUE)

  #Custom error messages work
  expect_error(assert_vector(matrix(1:9, 3), msg = "Custom error message"), "Custom error message")
})



# Assert Factor -----------------------------------------------------------
cli::test_that_cli("assert_vector() works", configs = "plain",  {
  # Works for factors
  expect_identical(assert_factor_vector(factor(c("a", "b", "c"))), TRUE)
  expect_identical(assert_factor_vector(factor(c(1, 2, 3))), TRUE)

  # Works for empty factors
  expect_identical(assert_factor_vector(factor()), TRUE)

  # Aborts for non-factor objects
  expect_error(assert_factor_vector(c("a", "b", "c")), "'c(\"a\", \"b\", \"c\")' must be a factor, not a character", fixed = TRUE)
  expect_error(assert_factor_vector(1:5), "'1:5' must be a factor, not a integer", fixed = TRUE)
  expect_error(assert_factor_vector(data.frame(a = 1, b = 2)), "'data.frame(a = 1, b = 2)' must be a factor, not a data.frame", fixed = TRUE)
  expect_error(assert_factor_vector(matrix(1:9, 3)), "'matrix(1:9, 3)' must be a factor, not a matrix", fixed = TRUE)
  expect_error(assert_factor_vector(list(a = 1, b = 2)), "'list(a = 1, b = 2)' must be a factor, not a list", fixed = TRUE)
  expect_error(assert_factor_vector(function(x) x), "'function(x) x' must be a factor, not a function", fixed = TRUE)
  expect_error(assert_factor_vector(environment()), "'environment()' must be a factor, not a environment", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- c("a", "b", "c")
  expect_error(assert_factor_vector(y), "'y' must be a factor, not a character", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_factor_vector(1:5, msg = "Custom error message"), "Custom error message")
})


# Assert Numeric ----------------------------------------------------------
cli::test_that_cli("assert_numeric() works", configs = "plain", {
  # Works for numeric vectors
  expect_identical(assert_numeric(1:5), TRUE)
  expect_identical(assert_numeric(c(1, 2.5, 3.14)), TRUE)

  # Works for empty numeric vectors
  expect_identical(assert_numeric(integer()), TRUE)
  expect_identical(assert_numeric(double()), TRUE)

  # Works for numeric matrices
  expect_identical(assert_numeric(matrix(1:9, 3)), TRUE)

  # Aborts for non-numeric objects
  expect_error(assert_numeric(c("a", "b", "c")), "'c(\"a\", \"b\", \"c\")' must be numeric, not a character", fixed = TRUE)
  expect_error(assert_numeric(factor(c(1, 2, 3))), "'factor(c(1, 2, 3))' must be numeric, not a factor", fixed = TRUE)
  expect_error(assert_numeric(data.frame(a = 1, b = 2)), "'data.frame(a = 1, b = 2)' must be numeric, not a data.frame", fixed = TRUE)
  expect_error(assert_numeric(list(a = 1, b = 2)), "'list(a = 1, b = 2)' must be numeric, not a list", fixed = TRUE)
  expect_error(assert_numeric(function(x) x), "'function(x) x' must be numeric, not a function", fixed = TRUE)
  expect_error(assert_numeric(environment()), "'environment()' must be numeric, not a environment", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- c("a", "b", "c")
  expect_error(assert_numeric(y), "'y' must be numeric, not a character", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_numeric(factor(c(1, 2, 3)), msg = "Custom error message"), "Custom error message")
})

# Assert Numeric Vector -----------------------------------------------------------
cli::test_that_cli("assert_numeric_vector() works", configs = "plain",  {
  # Works for numeric vectors
  expect_identical(assert_numeric_vector(c(1, 2, 3)), TRUE)
  expect_identical(assert_numeric_vector(c(1.5, 2.5, 3.5)), TRUE)

  # Works for empty numeric vectors
  expect_identical(assert_numeric_vector(numeric()), TRUE)

  # Aborts for non-numeric vectors
  expect_error(assert_numeric_vector(c("a", "b", "c")), "'c(\"a\", \"b\", \"c\")' must be a numeric vector, not a character", fixed = TRUE)
  expect_error(assert_numeric_vector(factor(c("a", "b", "c"))), "'factor(c(\"a\", \"b\", \"c\"))' must be a numeric vector, not a factor", fixed = TRUE)
  expect_error(assert_numeric_vector(list(a = 1, b = 2)), "'list(a = 1, b = 2)' must be a numeric vector, not a list", fixed = TRUE)
  expect_error(assert_numeric_vector(matrix(1:9, 3)), "'matrix(1:9, 3)' must be a numeric vector, not a matrix", fixed = TRUE)
  expect_error(assert_numeric_vector(data.frame(a = 1, b = 2)), "'data.frame(a = 1, b = 2)' must be a numeric vector, not a data.frame", fixed = TRUE)
  expect_error(assert_numeric_vector(function(x) x), "'function(x) x' must be a numeric vector, not a function", fixed = TRUE)
  expect_error(assert_numeric_vector(environment()), "'environment()' must be a numeric vector, not a environment", fixed = TRUE)
  expect_error(assert_numeric_vector(c(TRUE, FALSE)), "'c(TRUE, FALSE)' must be a numeric vector, not a logical", fixed = TRUE)
  # Error messages use variable name of passed arguments
  y <- c("a", "b", "c")
  expect_error(assert_numeric_vector(y), "'y' must be a numeric vector, not a character", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_numeric_vector(c('a', 'b', 'c'), msg = "Custom error message"), "Custom error message")
})


# Assert Number -----------------------------------------------------------

cli::test_that_cli("assert_number() works", configs = "plain",  {
  # Error messages use variable name of passed arguments
  y <- c(1, 2, 3)
  expect_error(assert_number(y), "'y' is not a number! (length is 3, not 1)", fixed = TRUE)
  # Works for numeric scalars
  expect_identical(assert_number(3), TRUE)
  expect_identical(assert_number(-5.5), TRUE)

  # Aborts for numeric vectors
  expect_error(assert_number(c(1, 2, 3)), "'c(1, 2, 3)' is not a number! (length is 3, not 1)", fixed = TRUE)
  expect_error(assert_number(1:5), "'1:5' is not a number! (length is 5, not 1)", fixed = TRUE)

  # Aborts for non-numeric objects
  expect_error(assert_number("a"), "'\"a\"' is not a number! (class is character, not numeric)", fixed = TRUE)
  expect_error(assert_number(list(1, 2, 3)), "'list(1, 2, 3)' is not a number! (class is list, not numeric)", fixed = TRUE)
  expect_error(assert_number(function(x) x), "'function(x) x' is not a number! (class is function, not numeric)", fixed = TRUE)
  expect_error(assert_number(environment()), "'environment()' is not a number! (class is environment, not numeric)", fixed = TRUE)


  # Custom error messages work
  expect_error(assert_number(1:5, msg = "Custom error message"), "Custom error message")
  expect_error(assert_number("a", msg = "Custom error message"), "Custom error message")
})


# Assert Integer -----------------------------------------------------------
cli::test_that_cli("assert_int() works", configs = "plain",  {
  # Works for integer vectors
  expect_identical(assert_int(1:5), TRUE)
  expect_identical(assert_int(as.integer(c(1, 2.5, 3.14))), TRUE)

  # Works for empty integer vectors
  expect_identical(assert_int(integer()), TRUE)

  # Aborts for non-integer objects
  expect_error(assert_int(c("a", "b", "c")), "'c(\"a\", \"b\", \"c\")' must be an integer, not a character", fixed = TRUE)
  expect_error(assert_int(factor(c(1, 2, 3))), "'factor(c(1, 2, 3))' must be an integer, not a factor", fixed = TRUE)
  expect_error(assert_int(c(1, 2.5, 3.14)), "'c(1, 2.5, 3.14)' must be an integer, not a numeric", fixed = TRUE)
  expect_error(assert_int(data.frame(a = 1, b = 2)), "'data.frame(a = 1, b = 2)' must be an integer, not a data.frame", fixed = TRUE)
  expect_error(assert_int(list(a = 1, b = 2)), "'list(a = 1, b = 2)' must be an integer, not a list", fixed = TRUE)
  expect_error(assert_int(function(x) x), "'function(x) x' must be an integer, not a function", fixed = TRUE)
  expect_error(assert_int(environment()), "'environment()' must be an integer, not a environment", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- c("a", "b", "c")
  expect_error(assert_int(y), "'y' must be an integer, not a character", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_int(factor(c(1, 2, 3)), msg = "Custom error message"), "Custom error message")
})

# Assert Logical ----------------------------------------------------------------
cli::test_that_cli("assert_logical() works", configs = "plain",  {
  # Works for logical vectors
  expect_identical(assert_logical(c(TRUE, TRUE, TRUE)), TRUE)
  expect_identical(assert_logical(c(FALSE, TRUE, FALSE)), TRUE)
  expect_identical(assert_logical(c(TRUE, TRUE, NA)), TRUE)

  # Works for empty logical vectors
  expect_identical(assert_logical(logical()), TRUE)

  # Aborts for non-logical objects
  expect_error(assert_logical(c("a", "b", "c")), "'c(\"a\", \"b\", \"c\")' must be logical, not a character", fixed = TRUE)
  expect_error(assert_logical(factor(c("a", "b", "c"))), "'factor(c(\"a\", \"b\", \"c\"))' must be logical, not a factor", fixed = TRUE)
  expect_error(assert_logical(list(a = 1, b = 2)), "'list(a = 1, b = 2)' must be logical, not a list", fixed = TRUE)
  expect_error(assert_logical(matrix(1:9, 3)), "'matrix(1:9, 3)' must be logical, not a matrix", fixed = TRUE)
  expect_error(assert_logical(data.frame(a = 1, b = 2)), "'data.frame(a = 1, b = 2)' must be logical, not a data.frame", fixed = TRUE)
  expect_error(assert_logical(function(x) x), "'function(x) x' must be logical, not a function", fixed = TRUE)
  expect_error(assert_logical(environment()), "'environment()' must be logical, not a environment", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- c("a", "b", "c")
  expect_error(assert_logical(y), "'y' must be logical, not a character", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_logical(factor(c(1, 2, 3)), msg = "Custom error message"), "Custom error message")
})


# Assert Logical Vector ---------------------------------------------------
cli::test_that_cli("assert_logical_vector() works", configs = "plain", {

  # Works for logical vectors
  expect_identical(assert_logical_vector(c(TRUE, FALSE, TRUE)), TRUE)
  expect_identical(assert_logical_vector(c(TRUE, NA, TRUE)), TRUE)

  # Works for empty logical vectors
  expect_identical(assert_logical_vector(logical()), TRUE)

  # Aborts for non-logical vectors
  expect_error(assert_logical_vector(c(1, 2, 3)), "'c(1, 2, 3)' must be a logical vector, not a numeric", fixed = TRUE)
  expect_error(assert_logical_vector(c("a", "b", "c")), "'c(\"a\", \"b\", \"c\")' must be a logical vector, not a character", fixed = TRUE)
  expect_error(assert_logical_vector(matrix(c(TRUE, FALSE), 2, 1)), "'matrix(c(TRUE, FALSE), 2, 1)' must be a logical vector, not a matrix", fixed = TRUE)
  expect_error(assert_logical_vector(list(a = 1, b = 2)), "'list(a = 1, b = 2)' must be a logical vector, not a list", fixed = TRUE)
  expect_error(assert_logical_vector(data.frame(a = 1, b = 2)), "'data.frame(a = 1, b = 2)' must be a logical vector, not a data.frame", fixed = TRUE)
  expect_error(assert_logical_vector(function(x) x), "'function(x) x' must be a logical vector, not a function", fixed = TRUE)
  expect_error(assert_logical_vector(environment()), "'environment()' must be a logical vector, not a environment", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- data.frame(a = 1:5, b = 6:10)
  expect_error(assert_logical_vector(y), "'y' must be a logical vector, not a data.frame", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_logical_vector(c(1, 2, 3), msg = "Custom error message"), "Custom error message")
})


# Assert Flag -------------------------------------------------------------
cli::test_that_cli("assert_flag works as expected", configs = "plain", {
  # Works for flags
  expect_identical(assert_flag(TRUE), TRUE)
  expect_identical(assert_flag(FALSE), TRUE)

  # Aborts for non-flag objects
  expect_error(assert_flag(1), "'1' is not a flag! (class is numeric, not logical)", fixed = TRUE)
  expect_error(assert_flag("a"), "'\"a\"' is not a flag! (class is character, not logical)", fixed = TRUE)
  expect_error(assert_flag(1:3), "'1:3' is not a flag! (class is integer, not logical)", fixed = TRUE)
  expect_error(assert_flag(list(a = 1, b = 2)), "'list(a = 1, b = 2)' is not a flag! (class is list, not logical)", fixed = TRUE)
  expect_error(assert_flag(data.frame(a = 1, b = 2)), "'data.frame(a = 1, b = 2)' is not a flag! (class is data.frame, not logical)", fixed = TRUE)
  expect_error(assert_flag(function(x) x), "'function(x) x' is not a flag! (class is function, not logical)", fixed = TRUE)
  expect_error(assert_flag(environment()), "'environment()' is not a flag! (class is environment, not logical)", fixed = TRUE)
  expect_error(assert_flag(c(TRUE, TRUE)), "'c(TRUE, TRUE)' is not a flag! (length is 2, not 1)", fixed=TRUE)

  # Error messages use variable name of passed arguments
  y <- 1:3
  expect_error(assert_flag(y), "'y' is not a flag! (class is integer, not logical)", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_flag(1, msg = "Custom error message"), "Custom error message")
  expect_error(assert_flag(c(TRUE, TRUE), msg = "Custom error message"), "Custom error message")
})



# Assert Character ----------------------------------------------------------------
cli::test_that_cli("assert_character() works", configs = "plain",  {
  # Works for character vectors
  expect_identical(assert_character(c("a", "b", "c")), TRUE)
  expect_identical(assert_character(c("a", "b", "c", NA)), TRUE)

  # Works for empty character vectors
  expect_identical(assert_character(character()), TRUE)

  # Aborts for non-character vectors
  expect_error(assert_character(c(1, 2, 3)), "'c(1, 2, 3)' must be a character, not a numeric", fixed = TRUE)
  expect_error(assert_character(factor(c("a", "b", "c"))), "'factor(c(\"a\", \"b\", \"c\"))' must be a character, not a factor", fixed = TRUE)
  expect_error(assert_character(list(a = "1", b = "2")), "'list(a = \"1\", b = \"2\")' must be a character, not a list", fixed = TRUE)
  expect_error(assert_character(matrix(1:9, 3)), "'matrix(1:9, 3)' must be a character, not a matrix", fixed = TRUE)
  expect_error(assert_character(data.frame(a = "1", b = "2")), "'data.frame(a = \"1\", b = \"2\")' must be a character, not a data.frame", fixed = TRUE)
  expect_error(assert_character(function(x) x), "'function(x) x' must be a character, not a function", fixed = TRUE)
  expect_error(assert_character(environment()), "'environment()' must be a character, not a environment", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- c(1, 2, 3)
  expect_error(assert_character(y), "'y' must be a character, not a numeric", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_character(factor(c("a", "b", "c")), msg = "Custom error message"), "Custom error message")
})


# Assert Character Vector --------------------------------------------------
cli::test_that_cli("assert_character_vector works as expected", configs = "plain", {
  # Works for character vectors
  expect_identical(assert_character_vector(c("a", "b", "c")), TRUE)
  expect_identical(assert_character_vector(character()), TRUE)

  # Aborts for non-character vectors
  expect_error(assert_character_vector(1), "'1' must be a character vector, not a numeric", fixed = TRUE)
  expect_error(assert_character_vector(1:3), "'1:3' must be a character vector, not a integer", fixed = TRUE)
  expect_error(assert_character_vector(list(a = 1, b = 2)), "'list(a = 1, b = 2)' must be a character vector, not a list", fixed = TRUE)
  expect_error(assert_character_vector(data.frame(a = 1, b = 2)), "'data.frame(a = 1, b = 2)' must be a character vector, not a data.frame", fixed = TRUE)
  expect_error(assert_character_vector(function(x) x), "'function(x) x' must be a character vector, not a function", fixed = TRUE)
  expect_error(assert_character_vector(environment()), "'environment()' must be a character vector, not a environment", fixed = TRUE)
  expect_error(assert_character_vector(matrix(c('a', 'b', 'c'))), "'matrix(c(\"a\", \"b\", \"c\"))' must be a character vector, not a matrix", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- 1:3
  expect_error(assert_character_vector(y), "'y' must be a character vector, not a integer", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_character_vector(1, msg = "Custom error message"), "Custom error message")
  expect_error(assert_character_vector(c(1, 2, 3), msg = "Custom error message"), "Custom error message")
})


# Assert String -----------------------------------------------------------
cli::test_that_cli("assert_string() works", configs = "plain", {
  # Works for character vectors of length 1
  expect_identical(assert_string("a"), TRUE)

  # Works for empty character vectors
  expect_identical(assert_string(""), TRUE)

  # Aborts for non-character vectors
  expect_error(assert_string(1:10), "'1:10' is not a string! (class is integer, not character)", fixed = TRUE)
  expect_error(assert_string(c(1, 2, 3)), "'c(1, 2, 3)' is not a string! (class is numeric, not character)", fixed = TRUE)
  expect_error(assert_string(list(a = 1, b = 2)), "'list(a = 1, b = 2)' is not a string! (class is list, not character)", fixed = TRUE)
  expect_error(assert_string(factor(c(1, 2, 3))), "'factor(c(1, 2, 3))' is not a string! (class is factor, not character)", fixed = TRUE)
  expect_error(assert_string(c("a", "b")), "'c(\"a\", \"b\")' is not a string! (length is 2, not 1)", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- c(1, 2, 3)

  expect_error(assert_string(y), "'y' is not a string! (class is numeric, not character)", fixed = TRUE)
  z <- c("a", "b")
  expect_error(assert_string(z), "'z' is not a string! (length is 2, not 1)", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_string(1:10, msg = "Custom error message"), "Custom error message")
})

cli::test_that_cli("assert_non_empty_string() works", config = "plain", {
  # Works for objects that are nonempty strings
  expect_true(assert_non_empty_string("hello"))
  expect_true(assert_non_empty_string("123"))

  # Aborts for objects that are empty strings
  expect_snapshot(assert_non_empty_string(""), error = TRUE)

  # Aborts for objects that are not strings
  expect_snapshot(assert_non_empty_string(123), error = TRUE)
  expect_snapshot(assert_non_empty_string(c(1, 2, 3)), error = TRUE)

  # Error messages use variable name of passed arguments
  x <- ""
  expect_error(assert_non_empty_string(x), "^'x'", fixed = FALSE)

  # Custom error messages work
  expect_error(assert_non_empty_string("", msg = "Custom error message"), "Custom error message")
})



# Assert List ---------------------------------------------------------
cli::test_that_cli("assert_list() works", configs = "plain", {

  # Works for lists
  expect_true(assert_list(list(1, 2, 3)))
  expect_true(assert_list(list()))

  # Aborts for non-list objects
  expect_snapshot(assert_list(1), error = TRUE)
  expect_snapshot(assert_list(1.5), error = TRUE)
  expect_snapshot(assert_list('abc'), error = TRUE)
  expect_snapshot(assert_list(c(1, 2, 3)), error= TRUE)
  expect_snapshot(assert_list(mtcars), error= TRUE)
  expect_snapshot(assert_list(factor(c(1, 2, 3))), error = TRUE)

  # Error messages use variable name of passed arguments
  y <- c(1, 2, 3)
  expect_error(assert_list(y), "'y'", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_list(1, msg = "Custom error message"), "Custom error message")
})


# Assert Reactive ---------------------------------------------------------
cli::test_that_cli("assert_reactive() works", configs = "plain", {

  # Works for reactive objects
  expect_true(assert_reactive(shiny::reactive({ 1 + 1 })))
  expect_true(assert_reactive(shiny::reactiveVal(1)))

  # Aborts for non-reactive objects
  expect_snapshot(assert_reactive(1), error = TRUE)
  expect_snapshot(assert_reactive(1.5), error = TRUE)
  expect_snapshot(assert_reactive('abc'), error = TRUE)
  expect_snapshot(assert_reactive(c(1, 2, 3)), error = TRUE)
  expect_snapshot(assert_reactive(mtcars), error = TRUE)
  expect_snapshot(assert_reactive(factor(c(1, 2, 3))), error = TRUE)

  # Error messages use variable name of passed arguments
  x <- 1
  expect_error(assert_reactive(x), "'x'", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_reactive(1, msg = "Custom error message"), "Custom error message")
})

cli::test_that_cli("assert_function() works", config = "plain", {

  # Works for functions
  my_func <- function(x) x + 1
  expect_true(assert_function(my_func))

  # Works for anonymous function
  expect_true(assert_function(function(x){}))

  # Aborts for non-functions
  expect_snapshot(assert_function(1), error = TRUE)
  expect_snapshot(assert_function("abc"), error = TRUE)
  expect_snapshot(assert_function(c(1, 2, 3)), error = TRUE)

  # Error messages use variable name of passed arguments
  my_func2 <- "string"
  expect_error(assert_function(my_func2), "^'my_func2'", fixed = FALSE)

  # Custom error messages work
  expect_error(assert_function(1, msg = "Custom error message"), "Custom error message")
})

