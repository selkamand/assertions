# Test for is_subset -----------------------------------------------------------
test_that("is_subset works correctly", {
  expect_true(is_subset(c(1, 2), c(1, 2, 3, 4)))    # Subset case
  expect_false(is_subset(c(1, 5), c(1, 2, 3, 4)))   # Not a subset
  expect_true(is_subset(c("a"), c("a", "b", "c")))  # Single element subset
  expect_true(is_subset(c(TRUE, FALSE), c(TRUE, FALSE)))  # Logical subset
  expect_false(is_subset(c(TRUE, TRUE), c(FALSE)))   # No overlap
  expect_true(is_subset(integer(0), 1:10))           # Empty subset is always true
})

# Test for is_superset -----------------------------------------------------------
test_that("is_superset works correctly", {
  expect_true(is_superset(c(1, 2, 3, 4), c(1, 2)))   # Superset case
  expect_false(is_superset(c(1, 2, 3), c(1, 4)))     # Not a superset
  expect_true(is_superset(c("a", "b", "c"), c("a"))) # Single element in set
  expect_true(is_superset(c(TRUE, FALSE), c(TRUE)))   # Logical superset
  expect_false(is_superset(c(FALSE), c(TRUE, FALSE))) # Missing element in superset
  expect_true(is_superset(1:10, integer(0)))          # Empty subset always true
})

# Test for setopts_exlusive_to_first -----------------------------------------------------------
test_that("setopts_exlusive_to_first works correctly", {
  expect_equal(setopts_exlusive_to_first(c(1, 2, 3), c(2, 3, 4)), 1)        # Element exclusive to x
  expect_equal(setopts_exlusive_to_first(c("a", "b"), c("b", "c")), "a")    # Character vector
  expect_equal(setopts_exlusive_to_first(c(TRUE, FALSE), c(TRUE)), FALSE)    # Logical vector
  expect_equal(setopts_exlusive_to_first(1:5, 6:10), 1:5)                   # Non-overlapping sets
  expect_equal(setopts_exlusive_to_first(integer(0), 1:10), integer(0))      # Empty x
  expect_equal(setopts_exlusive_to_first(1:10, integer(0)), 1:10)            # Empty y
})

# Test for setopts_count_exlusive_to_first -----------------------------------------------------------
test_that("setopts_count_exlusive_to_first works correctly", {
  expect_equal(setopts_count_exlusive_to_first(c(1, 2, 3), c(2, 3, 4)), 1)   # Single exclusive
  expect_equal(setopts_count_exlusive_to_first(c("a", "b"), c("b", "c")), 1) # Character vector
  expect_equal(setopts_count_exlusive_to_first(c(TRUE, FALSE), c(TRUE)), 1)  # Logical vector
  expect_equal(setopts_count_exlusive_to_first(1:5, 6:10), 5)               # Non-overlapping sets
  expect_equal(setopts_count_exlusive_to_first(integer(0), 1:10), 0)        # Empty x
})

# Test for setopts_common_elements -----------------------------------------------------------
test_that("setopts_common_elements works correctly", {
  expect_equal(setopts_common_elements(c(1, 2, 3), c(2, 3, 4)), c(2, 3))   # Overlapping elements
  expect_equal(setopts_common_elements(c("a", "b"), c("b", "c")), "b")     # Single common character
  expect_equal(setopts_common_elements(c(TRUE, FALSE), c(TRUE)), TRUE)     # Logical vector
  expect_equal(setopts_common_elements(1:5, 6:10), integer(0))            # No common elements
  expect_equal(setopts_common_elements(integer(0), 1:10), integer(0))     # Empty x
})

# Test for setopts_are_equal -----------------------------------------------------------
test_that("setopts_are_equal works correctly", {
  expect_true(setopts_are_equal(c(1, 2, 3), c(3, 2, 1)))                  # Same elements, different order
  expect_false(setopts_are_equal(c(1, 2, 3), c(2, 3, 4)))                 # Different elements
  expect_true(setopts_are_equal(c("a", "b"), c("b", "a")))                # Character vector
  expect_false(setopts_are_equal(c(TRUE, FALSE), c(TRUE)))                # Logical vector, missing value
  expect_true(setopts_are_equal(integer(0), integer(0)))                  # Both empty
})

# Test for includes -----------------------------------------------------------
test_that("includes works correctly", {
  expect_true(includes(c(1, 2, 3, 4), c(1, 2)))                           # Subset case
  expect_false(includes(c(1, 2, 3), c(1, 4)))                             # Not a subset
  expect_true(includes(c("a", "b", "c"), "a"))                            # Single element
  expect_true(includes(c(TRUE, FALSE), c(TRUE)))                          # Logical vector
  expect_true(includes(1:10, integer(0)))                                 # Empty required set
})

# Test for includes_advanced -----------------------------------------------------------
test_that("includes_advanced works correctly", {
  expect_equal(includes_advanced(c(1, 2, 3, 4), c(1, 2)), TRUE)           # Subset case
  expect_match(includes_advanced(c(1, 2, 3), c(1, 4)), "must include")     # Missing elements
  expect_equal(includes_advanced(c("a", "b"), "a"), TRUE)                 # Single element character
  expect_match(includes_advanced(1:5, "a"), "must be the same type")      # Type mismatch
})

# Test for excludes_advanced -----------------------------------------------------------
test_that("excludes_advanced works correctly", {
  expect_equal(excludes_advanced(c(1, 2, 3, 4), c(5, 6)), TRUE)           # No overlap
  expect_match(excludes_advanced(c(1, 2, 3), c(1, 4)), "must exclude")     # Contains prohibited elements
  expect_equal(excludes_advanced(c("a", "b"), "c"), TRUE)                 # No prohibited element
  expect_match(excludes_advanced(1:5, "a"), "must be the same type")      # Type mismatch
})

# Test for sets_are_equivalent -----------------------------------------------------------
test_that("sets_are_equivalent works correctly", {
  expect_equal(sets_are_equivalent(c(1, 2, 3), c(3, 2, 1)), TRUE)         # Same elements
  expect_match(sets_are_equivalent(c(1, 2, 3), c(1, 2)), "unexpected value") # Extra element in x
  expect_match(sets_are_equivalent(c(1, 2), c(1, 2, 3)), "missing a required value") # Missing element in y
  expect_match(sets_are_equivalent(c(1, 2, 3), c(4, 5, 6)), "missing required values") # Completely different
})
