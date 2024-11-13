# Unit tests for each function

# Test `is_vector`
test_that("is_vector works as expected", {
  expect_true(is_vector(c(1, 2, 3)))
  expect_false(is_vector(list(1, 2, 3)))
  expect_false(is_vector(matrix(1:4, 2, 2)))
  expect_false(is_vector(data.frame(a = 1:3, b = 4:6)))
  expect_false(is_vector(NULL))
  expect_true(is_vector(NA))
})

# Test `is_numeric_vector`
test_that("is_numeric_vector works as expected", {
  expect_true(is_numeric_vector(c(1, 2, 3)))
  expect_false(is_numeric_vector(list(1, 2, 3)))
  expect_true(is_numeric_vector(1:5))
  expect_false(is_numeric_vector("hello"))
  expect_false(is_numeric_vector(c(1, 2, "a")))
  expect_false(is_numeric_vector(NULL))
})

# Test `is_number`
test_that("is_number works as expected", {
  expect_true(is_number(1))
  expect_false(is_number(c(1, 2)))
  expect_false(is_number("a"))
  expect_false(is_number(NULL))
  expect_false(is_number(TRUE))
})

# Test `is_character_vector`
test_that("is_character_vector works as expected", {
  expect_true(is_character_vector(c("a", "b", "c")))
  expect_false(is_character_vector(list("a", "b", "c")))
  expect_false(is_character_vector(1:5))
  expect_false(is_character_vector(NA))
})

# Test `is_character_vector_or_glue`
test_that("is_character_vector_or_glue works as expected", {
  expect_true(is_character_vector_or_glue(c("a", "b", "c")))
  expect_false(is_character_vector_or_glue(1:5))
  expect_false(is_character_vector_or_glue(NA))
  # If `glue` package is available, add tests with glue strings
  glue_str <- glue::glue("Hello {1+1}")
  expect_true(is_character_vector_or_glue(glue_str))
})

# Test `is_scalar`
test_that("is_scalar works as expected", {
  expect_true(is_scalar(1))
  expect_false(is_scalar(c(1, 2)))
  expect_false(is_scalar(matrix(1:4, 2, 2)))
  expect_false(is_scalar(data.frame(a = 1:3, b = 4:6)))
  expect_false(is_scalar(NULL))
  expect_true(is_scalar(TRUE))
  expect_false(is_scalar(list(1)))
})

# Test `is_logical_vector`
test_that("is_logical_vector works as expected", {
  expect_true(is_logical_vector(c(TRUE, FALSE, TRUE)))
  expect_true(is_logical_vector(NA))
  expect_false(is_logical_vector(list(TRUE, FALSE, TRUE)))
  expect_false(is_logical_vector(1:5))
  expect_false(is_logical_vector("hello"))
})

# Test `is_string`
test_that("is_string works as expected", {
  expect_true(is_string("hello"))
  expect_false(is_string(c("a", "b")))
  expect_false(is_string(1))
  expect_false(is_string(NULL))
  expect_false(is_string(TRUE))
  expect_false(is_string(NA))
})

# Test `is_flag`
test_that("is_flag works as expected", {
  expect_true(is_flag(TRUE))
  expect_true(is_flag(FALSE))
  expect_false(is_flag(c(TRUE, FALSE)))
  expect_false(is_flag(1))
  expect_false(is_flag("hello"))
  expect_false(is_flag(NULL))
})

# Test `is_list`
test_that("is_list works as expected", {
  expect_true(is_list(list(1, 2)))
  expect_false(is_list(c(1, 2, 3)))
  expect_false(is_list(matrix(1:4, 2, 2)))
  expect_false(is_list(data.frame(a = 1:3, b = 4:6)))
  expect_true(is_list(data.frame(a = 1:3, b = 4:6), include_dataframes = TRUE))
})

# Test `is_reactive` (requires shiny)
test_that("is_reactive works as expected", {
  if (requireNamespace("shiny", quietly = TRUE)) {
    expect_true(is_reactive(shiny::reactive(1)))
    expect_false(is_reactive(1))
    expect_false(is_reactive(NULL))
  } else {
    skip("Shiny package not installed.")
  }
})

# Test `is_whole_number`
test_that("is_whole_number works as expected", {
  expect_true(is_whole_number(2))
  expect_false(is_whole_number(2.5))
  expect_true(is_whole_number(0))
  expect_true(is_whole_number(-3))
})

# Test `is_connection` (requires DBI)
test_that("is_connection works as expected", {
  # conn <- DBI::dbConnect(RSQLite::SQLite(), ":memory:")  # We use a mock connection instead since a real one would require more dependencies
  conn <- structure(list(), class = c("SQLiteConnection", "DBIConnection"))
  expect_true(is_connection(conn))
  expect_false(is_connection(NULL))
  expect_false(is_connection(1))
})

# Advanced function tests

# Test `is_number_advanced`
test_that("is_number_advanced works as expected", {
  expect_true(is_number_advanced(1))
  expect_match(is_number_advanced("a"), "is not a {.strong number}", fixed = TRUE)
  expect_match(is_number_advanced(c(1, 2)), "is not a {.strong number}", fixed = TRUE)
})

# Test `is_flag_advanced`
test_that("is_flag_advanced works as expected", {
  expect_true(is_flag_advanced(TRUE))
  expect_match(is_flag_advanced(1), "is not a {.strong flag}", fixed=TRUE)
  expect_match(is_flag_advanced(c(TRUE, FALSE)), "is not a {.strong flag}", fixed=TRUE)
})

# Test `is_string_advanced`
test_that("is_string_advanced works as expected", {
  expect_true(is_string_advanced("hello"))
  expect_match(is_string_advanced(1), "is not a {.strong string}", fixed=TRUE)
  expect_match(is_string_advanced(c("a", "b")), "is not a {.strong string}", fixed=TRUE)
})

# Test `is_non_empty_string_advanced`
test_that("is_non_empty_string_advanced works as expected", {
  expect_true(is_non_empty_string_advanced("hello"))
  expect_match(is_non_empty_string_advanced(1), "is not a {.strong string}", fixed=TRUE)
  expect_match(is_non_empty_string_advanced(""), "is an {.strong empty} string", fixed=TRUE)
})
