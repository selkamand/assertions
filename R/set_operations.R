# Set functions -----------------------------------------------------------
#' Check if one set is a subset of another
#'
#' Determines if all elements in set `x` are also present in set `y`.
#'
#' @param x A numeric, character, or logical vector.
#' @param y A numeric, character, or logical vector.
#' @return A logical value indicating whether `x` is a subset of `y`.
#' @examples
#' is_subset(1:3, 1:5)
#' is_subset(letters[1:3], letters)
#' is_subset(TRUE, c(TRUE, FALSE))
#'
#' @export
is_subset <- function(x, y){
  all(x %in% y)
}


#' Check if one set is a superset of another
#'
#' Determines if all elements in set `y` are also present in set `x`.
#'
#' @param x A numeric, character, or logical vector.
#' @param y A numeric, character, or logical vector.
#' @return A logical value indicating whether `x` is a superset of `y`.
#' @examples
#' is_superset(1:5, 1:3)
#' is_superset(letters, letters[1:3])
#' is_superset(c(TRUE, FALSE), TRUE)
#'
#' @export
is_superset <- function(x, y){
  all(y %in% x)
}

# Set Differences ---------------------------------------------------------------------

#' @title Elements Exclusive to First Set
#'
#' @description
#' Finds the elements that are in the first set but not in the second set.
#'
#' @param x A vector of elements.
#' @param y A vector of elements.
#'
#' @return A vector of elements that are in the first set but not in the second set.
#'
#' @examples
#' assertions:::setopts_exlusive_to_first(c(1, 2, 3), c(3, 4, 5))
#' # Output: [1] 1 2
setopts_exlusive_to_first <- function(x, y){
  setdiff(x, y)
}

#' @title Count of Elements Exclusive to First Set
#'
#' @description
#' Counts the number of elements that are in the first set but not in the second set.
#'
#' @param x A vector of elements.
#' @param y A vector of elements.
#'
#' @return A scalar representing the number of elements that are in the first set but not in the second set.
#'
#' @examples
#' assertions:::setopts_count_exlusive_to_first(c(1, 2, 3), c(3, 4, 5))
#' # Output: 2
setopts_count_exlusive_to_first <- function(x, y){
  length(setdiff(x, y))
}

#' @title Find Common Elements
#'
#' @description
#' Find the elements that are present in both sets.
#'
#' @param x A vector of elements.
#' @param y A vector of elements.
#'
#' @return A vector of elements that are present in both sets.
#'
#' @examples
#' assertions:::setopts_common_elements(c(1, 2, 3), c(2, 3, 4))
#' # Output: [1] 2 3
setopts_common_elements <- function(x, y){
  intersect(x, y)
}

#' @title Compare Sets for Equality
#'
#' @description
#' Determine if the two sets are equal.
#'
#' @param x A vector of elements.
#' @param y A vector of elements.
#'
#' @return A logical value indicating whether the sets are equal (`TRUE`) or not (`FALSE`).
#'
#' @examples
#' assertions:::setopts_are_equal(c(1, 2, 3), c(1, 2, 3))
#' # Output: TRUE
#' assertions:::setopts_are_equal(c(1, 2, 3), c(3, 2, 1))
#' # Output: TRUE
#' assertions:::setopts_are_equal(c(1, 2, 3), c(1, 2, 3, 4))
#' # Output: FALSE
setopts_are_equal <- function(x, y){
  setequal(x, y)
}
