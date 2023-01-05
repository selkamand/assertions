
# Assert DataFrame -------------------------------------------------------
cli::test_that_cli("assert_dataframe() works", configs = "plain", {

  # Works for data.frames
  expect_identical(assert_dataframe(mtcars), TRUE)

  # Works for empty data.frames
  expect_identical(assert_dataframe(data.frame()), TRUE)

  # Aborts for non-data.frame objects
  expect_error(assert_dataframe(1:10), "Error: '1:10' is not a data.frame! Object class: integer", fixed = TRUE)
  expect_error(assert_dataframe(matrix(1:6, 2, 3)), "Error: 'matrix(1:6, 2, 3)' is not a data.frame! Object class: matrix", fixed = TRUE)
  expect_error(assert_dataframe(c(1, 2, 3)), "Error: 'c(1, 2, 3)' is not a data.frame! Object class: numeric", fixed = TRUE)
  expect_error(assert_dataframe(list(a = 1, b = 2)), "Error: 'list(a = 1, b = 2)' is not a data.frame! Object class: list", fixed = TRUE)
  expect_error(assert_dataframe(factor(c(1, 2, 3))), "Error: 'factor(c(1, 2, 3))' is not a data.frame! Object class: factor", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- matrix(1:6, 2, 3)
  expect_error(assert_dataframe(y), "Error: 'y' is not a data.frame! Object class: matrix", fixed = TRUE)

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
  expect_error(assert_matrix(1:10), "Error: '1:10' is not a matrix! Object class: integer", fixed = TRUE)
  expect_error(assert_matrix(c(1, 2, 3)), "Error: 'c(1, 2, 3)' is not a matrix! Object class: numeric", fixed = TRUE)
  expect_error(assert_matrix(list(a = 1, b = 2)), "Error: 'list(a = 1, b = 2)' is not a matrix! Object class: list", fixed = TRUE)
  expect_error(assert_matrix(factor(c(1, 2, 3))), "Error: 'factor(c(1, 2, 3))' is not a matrix! Object class: factor", fixed = TRUE)
  expect_error(assert_matrix(data.frame(a = 1, b = 2)), "Error: 'data.frame(a = 1, b = 2)' is not a matrix! Object class: data.frame", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- data.frame(a = 1:5, b = 6:10)
  expect_error(assert_matrix(y), "Error: 'y' is not a matrix! Object class: data.frame", fixed = TRUE)

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
  expect_error(assert_vector(matrix(1:9, 3)), "Error: 'matrix(1:9, 3)' is not a vector! Object class: matrix", fixed = TRUE)
  expect_error(assert_vector(list(a = 1, b = 2)), "Error: 'list(a = 1, b = 2)' is not a vector! Object class: list", fixed = TRUE)
  expect_error(assert_vector(data.frame(a = 1, b = 2)), "Error: 'data.frame(a = 1, b = 2)' is not a vector! Object class: data.frame", fixed = TRUE)
  expect_error(assert_vector(function(x) x), "Error: 'function(x) x' is not a vector! Object class: function", fixed = TRUE)
  expect_error(assert_vector(environment()), "Error: 'environment()' is not a vector! Object class: environment", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- data.frame(a = 1:5, b = 6:10)
  expect_error(assert_vector(y), "Error: 'y' is not a vector! Object class: data.frame", fixed = TRUE)

  # Works for lists if include_lists = TRUE
  expect_identical(assert_vector(list(a = 1, b = 2), include_lists = TRUE), TRUE)

  # Aborts for lists if include_lists = FALSE
  expect_error(assert_vector(list(a = 1, b = 2)), "Error: 'list(a = 1, b = 2)' is not a vector! Object class: list", fixed = TRUE)

  #Custom error messages work
  expect_error(assert_vector(matrix(1:9, 3), msg = "Custom error message"), "Custom error message")
})



# Assert Factor -----------------------------------------------------------
cli::test_that_cli("assert_vector() works", configs = "plain",  {
  # Works for factors
  expect_identical(assert_factor(factor(c("a", "b", "c"))), TRUE)
  expect_identical(assert_factor(factor(c(1, 2, 3))), TRUE)

  # Works for empty factors
  expect_identical(assert_factor(factor()), TRUE)

  # Aborts for non-factor objects
  expect_error(assert_factor(c("a", "b", "c")), "Error: 'c(\"a\", \"b\", \"c\")' is not a factor! Object class: character", fixed = TRUE)
  expect_error(assert_factor(1:5), "Error: '1:5' is not a factor! Object class: integer", fixed = TRUE)
  expect_error(assert_factor(data.frame(a = 1, b = 2)), "Error: 'data.frame(a = 1, b = 2)' is not a factor! Object class: data.frame", fixed = TRUE)
  expect_error(assert_factor(matrix(1:9, 3)), "Error: 'matrix(1:9, 3)' is not a factor! Object class: matrix", fixed = TRUE)
  expect_error(assert_factor(list(a = 1, b = 2)), "Error: 'list(a = 1, b = 2)' is not a factor! Object class: list", fixed = TRUE)
  expect_error(assert_factor(function(x) x), "Error: 'function(x) x' is not a factor! Object class: function", fixed = TRUE)
  expect_error(assert_factor(environment()), "Error: 'environment()' is not a factor! Object class: environment", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- c("a", "b", "c")
  expect_error(assert_factor(y), "Error: 'y' is not a factor! Object class: character", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_factor(1:5, msg = "Custom error message"), "Custom error message")
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
  expect_error(assert_numeric(c("a", "b", "c")), "Error: 'c(\"a\", \"b\", \"c\")' is not numeric! Object class: character", fixed = TRUE)
  expect_error(assert_numeric(factor(c(1, 2, 3))), "Error: 'factor(c(1, 2, 3))' is not numeric! Object class: factor", fixed = TRUE)
  expect_error(assert_numeric(data.frame(a = 1, b = 2)), "Error: 'data.frame(a = 1, b = 2)' is not numeric! Object class: data.frame", fixed = TRUE)
  expect_error(assert_numeric(list(a = 1, b = 2)), "Error: 'list(a = 1, b = 2)' is not numeric! Object class: list", fixed = TRUE)
  expect_error(assert_numeric(function(x) x), "Error: 'function(x) x' is not numeric! Object class: function", fixed = TRUE)
  expect_error(assert_numeric(environment()), "Error: 'environment()' is not numeric! Object class: environment", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- c("a", "b", "c")
  expect_error(assert_numeric(y), "Error: 'y' is not numeric! Object class: character", fixed = TRUE)

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
  expect_error(assert_numeric_vector(c("a", "b", "c")), "Error: 'c(\"a\", \"b\", \"c\")' is not a numeric vector! Object class: character", fixed = TRUE)
  expect_error(assert_numeric_vector(factor(c("a", "b", "c"))), "Error: 'factor(c(\"a\", \"b\", \"c\"))' is not a numeric vector! Object class: factor", fixed = TRUE)
  expect_error(assert_numeric_vector(list(a = 1, b = 2)), "Error: 'list(a = 1, b = 2)' is not a numeric vector! Object class: list", fixed = TRUE)
  expect_error(assert_numeric_vector(matrix(1:9, 3)), "Error: 'matrix(1:9, 3)' is not a numeric vector! Object class: matrix", fixed = TRUE)
  expect_error(assert_numeric_vector(data.frame(a = 1, b = 2)), "Error: 'data.frame(a = 1, b = 2)' is not a numeric vector! Object class: data.frame", fixed = TRUE)
  expect_error(assert_numeric_vector(function(x) x), "Error: 'function(x) x' is not a numeric vector! Object class: function", fixed = TRUE)
  expect_error(assert_numeric_vector(environment()), "Error: 'environment()' is not a numeric vector! Object class: environment", fixed = TRUE)
  expect_error(assert_numeric_vector(c(TRUE, FALSE)), "Error: 'c(TRUE, FALSE)' is not a numeric vector! Object class: logical", fixed = TRUE)
  # Error messages use variable name of passed arguments
  y <- c("a", "b", "c")
  expect_error(assert_numeric_vector(y), "Error: 'y' is not a numeric vector! Object class: character", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_numeric_vector(c('a', 'b', 'c'), msg = "Custom error message"), "Custom error message")
})


# Assert Number -----------------------------------------------------------

cli::test_that_cli("assert_number() works", configs = "plain",  {
  # Works for numeric scalars
  expect_identical(assert_number(3), TRUE)
  expect_identical(assert_number(-5.5), TRUE)

  # Aborts for numeric vectors
  expect_error(assert_number(c(1, 2, 3)), "Error: 'c(1, 2, 3)' is not a number (length is 3, not 1!)", fixed = TRUE)
  expect_error(assert_number(1:5), "Error: '1:5' is not a number (length is 5, not 1!)", fixed = TRUE)

  # Aborts for non-numeric objects
  expect_error(assert_number("a"), "Error: '\"a\"' is not a number (Object class: character)", fixed = TRUE)
  expect_error(assert_number(list(1, 2, 3)), "Error: 'list(1, 2, 3)' is not a number (Object class: list)", fixed = TRUE)
  expect_error(assert_number(function(x) x), "Error: 'function(x) x' is not a number (Object class: function)", fixed = TRUE)
  expect_error(assert_number(environment()), "Error: 'environment()' is not a number (Object class: environment)", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- c(1, 2, 3)
  expect_error(assert_number(y), "Error: 'y' is not a number (length is 3, not 1!)", fixed = TRUE)

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
  expect_error(assert_int(c("a", "b", "c")), "Error: 'c(\"a\", \"b\", \"c\")' is not an integer! Object class: character", fixed = TRUE)
  expect_error(assert_int(factor(c(1, 2, 3))), "Error: 'factor(c(1, 2, 3))' is not an integer! Object class: factor", fixed = TRUE)
  expect_error(assert_int(c(1, 2.5, 3.14)), "Error: 'c(1, 2.5, 3.14)' is not an integer! Object class: numeric", fixed = TRUE)
  expect_error(assert_int(data.frame(a = 1, b = 2)), "Error: 'data.frame(a = 1, b = 2)' is not an integer! Object class: data.frame", fixed = TRUE)
  expect_error(assert_int(list(a = 1, b = 2)), "Error: 'list(a = 1, b = 2)' is not an integer! Object class: list", fixed = TRUE)
  expect_error(assert_int(function(x) x), "Error: 'function(x) x' is not an integer! Object class: function", fixed = TRUE)
  expect_error(assert_int(environment()), "Error: 'environment()' is not an integer! Object class: environment", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- c("a", "b", "c")
  expect_error(assert_int(y), "Error: 'y' is not an integer! Object class: character", fixed = TRUE)

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
  expect_error(assert_logical(c("a", "b", "c")), "Error: 'c(\"a\", \"b\", \"c\")' is not logical! Object class: character", fixed = TRUE)
  expect_error(assert_logical(factor(c("a", "b", "c"))), "Error: 'factor(c(\"a\", \"b\", \"c\"))' is not logical! Object class: factor", fixed = TRUE)
  expect_error(assert_logical(list(a = 1, b = 2)), "Error: 'list(a = 1, b = 2)' is not logical! Object class: list", fixed = TRUE)
  expect_error(assert_logical(matrix(1:9, 3)), "Error: 'matrix(1:9, 3)' is not logical! Object class: matrix", fixed = TRUE)
  expect_error(assert_logical(data.frame(a = 1, b = 2)), "Error: 'data.frame(a = 1, b = 2)' is not logical! Object class: data.frame", fixed = TRUE)
  expect_error(assert_logical(function(x) x), "Error: 'function(x) x' is not logical! Object class: function", fixed = TRUE)
  expect_error(assert_logical(environment()), "Error: 'environment()' is not logical! Object class: environment", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- c("a", "b", "c")
  expect_error(assert_logical(y), "Error: 'y' is not logical! Object class: character", fixed = TRUE)

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
  expect_error(assert_logical_vector(c(1, 2, 3)), "Error: 'c(1, 2, 3)' is not a logical vector! Object class: numeric", fixed = TRUE)
  expect_error(assert_logical_vector(c("a", "b", "c")), "Error: 'c(\"a\", \"b\", \"c\")' is not a logical vector! Object class: character", fixed = TRUE)
  expect_error(assert_logical_vector(matrix(c(TRUE, FALSE), 2, 1)), "Error: 'matrix(c(TRUE, FALSE), 2, 1)' is not a logical vector! Object class: matrix", fixed = TRUE)
  expect_error(assert_logical_vector(list(a = 1, b = 2)), "Error: 'list(a = 1, b = 2)' is not a logical vector! Object class: list", fixed = TRUE)
  expect_error(assert_logical_vector(data.frame(a = 1, b = 2)), "Error: 'data.frame(a = 1, b = 2)' is not a logical vector! Object class: data.frame", fixed = TRUE)
  expect_error(assert_logical_vector(function(x) x), "Error: 'function(x) x' is not a logical vector! Object class: function", fixed = TRUE)
  expect_error(assert_logical_vector(environment()), "Error: 'environment()' is not a logical vector! Object class: environment", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- data.frame(a = 1:5, b = 6:10)
  expect_error(assert_logical_vector(y), "Error: 'y' is not a logical vector! Object class: data.frame", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_logical_vector(c(1, 2, 3), msg = "Custom error message"), "Custom error message")
})


# Assert Flag -------------------------------------------------------------
cli::test_that_cli("assert_flag works as expected", configs = "plain", {
  # Works for flags
  expect_identical(assert_flag(TRUE), TRUE)
  expect_identical(assert_flag(FALSE), TRUE)

  # Aborts for non-flag objects
  expect_error(assert_flag(1), "Error: '1' is not a flag (Object class: numeric)", fixed = TRUE)
  expect_error(assert_flag("a"), "Error: '\"a\"' is not a flag (Object class: character)", fixed = TRUE)
  expect_error(assert_flag(1:3), "Error: '1:3' is not a flag (Object class: integer)", fixed = TRUE)
  expect_error(assert_flag(list(a = 1, b = 2)), "Error: 'list(a = 1, b = 2)' is not a flag (Object class: list)", fixed = TRUE)
  expect_error(assert_flag(data.frame(a = 1, b = 2)), "Error: 'data.frame(a = 1, b = 2)' is not a flag (Object class: data.frame)", fixed = TRUE)
  expect_error(assert_flag(function(x) x), "Error: 'function(x) x' is not a flag (Object class: function)", fixed = TRUE)
  expect_error(assert_flag(environment()), "Error: 'environment()' is not a flag (Object class: environment)", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- 1:3
  expect_error(assert_flag(y), "Error: 'y' is not a flag (Object class: integer)", fixed = TRUE)

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
  expect_error(assert_character(c(1, 2, 3)), "Error: 'c(1, 2, 3)' is not a character vector! Object class: numeric", fixed = TRUE)
  expect_error(assert_character(factor(c("a", "b", "c"))), "Error: 'factor(c(\"a\", \"b\", \"c\"))' is not a character vector! Object class: factor", fixed = TRUE)
  expect_error(assert_character(list(a = "1", b = "2")), "Error: 'list(a = \"1\", b = \"2\")' is not a character vector! Object class: list", fixed = TRUE)
  expect_error(assert_character(matrix(1:9, 3)), "Error: 'matrix(1:9, 3)' is not a character vector! Object class: matrix", fixed = TRUE)
  expect_error(assert_character(data.frame(a = "1", b = "2")), "Error: 'data.frame(a = \"1\", b = \"2\")' is not a character vector! Object class: data.frame", fixed = TRUE)
  expect_error(assert_character(function(x) x), "Error: 'function(x) x' is not a character vector! Object class: function", fixed = TRUE)
  expect_error(assert_character(environment()), "Error: 'environment()' is not a character vector! Object class: environment", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- c(1, 2, 3)
  expect_error(assert_character(y), "Error: 'y' is not a character vector! Object class: numeric", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_character(factor(c("a", "b", "c")), msg = "Custom error message"), "Custom error message")
})


# Assert Character Vector --------------------------------------------------
cli::test_that_cli("assert_character_vector works as expected", configs = "plain", {
  # Works for character vectors
  expect_identical(assert_character_vector(c("a", "b", "c")), TRUE)
  expect_identical(assert_character_vector(character()), TRUE)

  # Aborts for non-character vectors
  expect_error(assert_character_vector(1), "Error: '1' is not a character vector! Object class: numeric", fixed = TRUE)
  expect_error(assert_character_vector(1:3), "Error: '1:3' is not a character vector! Object class: integer", fixed = TRUE)
  expect_error(assert_character_vector(list(a = 1, b = 2)), "Error: 'list(a = 1, b = 2)' is not a character vector! Object class: list", fixed = TRUE)
  expect_error(assert_character_vector(data.frame(a = 1, b = 2)), "Error: 'data.frame(a = 1, b = 2)' is not a character vector! Object class: data.frame", fixed = TRUE)
  expect_error(assert_character_vector(function(x) x), "Error: 'function(x) x' is not a character vector! Object class: function", fixed = TRUE)
  expect_error(assert_character_vector(environment()), "Error: 'environment()' is not a character vector! Object class: environment", fixed = TRUE)
  expect_error(assert_character_vector(matrix(c('a', 'b', 'c'))), "Error: 'matrix(c(\"a\", \"b\", \"c\"))' is not a character vector! Object class: matrix", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- 1:3
  expect_error(assert_character_vector(y), "Error: 'y' is not a character vector! Object class: integer", fixed = TRUE)

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
  expect_error(assert_string(1:10), "Error: '1:10' is not a string (Object class: integer)", fixed = TRUE)
  expect_error(assert_string(c(1, 2, 3)), "Error: 'c(1, 2, 3)' is not a string (Object class: numeric)", fixed = TRUE)
  expect_error(assert_string(list(a = 1, b = 2)), "Error: 'list(a = 1, b = 2)' is not a string (Object class: list)", fixed = TRUE)
  expect_error(assert_string(factor(c(1, 2, 3))), "Error: 'factor(c(1, 2, 3))' is not a string (Object class: factor)", fixed = TRUE)
  expect_error(assert_string(c("a", "b")), "Error: 'c(\"a\", \"b\")' is not a string (length is 2, not 1!)", fixed = TRUE)

  # Error messages use variable name of passed arguments
  y <- c(1, 2, 3)
  expect_error(assert_string(y), "Error: 'y' is not a string (Object class: numeric)", fixed = TRUE)
  z <- c("a", "b")
  expect_error(assert_string(z), "Error: 'z' is not a string (length is 2, not 1!)", fixed = TRUE)

  # Custom error messages work
  expect_error(assert_string(1:10, msg = "Custom error message"), "Custom error message")
})

