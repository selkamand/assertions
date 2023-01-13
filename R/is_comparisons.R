# Comparisons -------------------------------------------------------------

#' Check if a numeric vector is greater than a specified minimum value
#'
#' This function checks if a numeric vector is greater than a specified minimum value. It can also optionally check if all elements of the vector must be greater than the minimum value or if only one element is sufficient
#'
#' @param x a numeric vector to check
#' @param minimum The minimum value to compare against
#' @param na_allowed should NAs be allowed. If `na_allowed = TRUE`, all NAs will be treated as Inf. Othwerise will return `FALSE` if any NAs are present
#' @param all_must_satisfy A logical value indicating whether all elements of the vector must be greater than the minimum value or if only one element is sufficient. Default is TRUE
#'
#' @return A logical value indicating whether all elements of the numeric vector x are greater than the specified minimum value
#' @examples
#' is_greater_than(c(2,3,4), 1) # TRUE
#' is_greater_than(c(2,3,4), 2) # TRUE
#' is_greater_than(c(2,3,4), 3, all_must_satisfy=FALSE) # TRUE
#' is_greater_than(c(2,3,1), 3) # FALSE
#' @export
is_greater_than <- function(x, minimum, all_must_satisfy = TRUE){

  # Assert no missing values
  assert_has_no_missing_values(x)

  # Comparison
  res <- x > minimum

  # Deal with vectors
  if(all_must_satisfy) {
    return(all(res))
  }
  else
    return(any(res))
}

#' Check if a numeric vector is greater than or equal to a specified minimum value
#'
#' This function checks if a numeric vector is greater than or equal to a specified minimum value. It can also optionally check if all elements of the vector must be greater than or equal to the minimum value or if only one element is sufficient
#'
#' @param x a numeric vector to check
#' @param minimum The minimum value to compare against
#' @param all_must_satisfy A logical value indicating whether all elements of the vector must be greater than or equal to the minimum value or if only one element is sufficient. Default is TRUE
#' @return A logical value indicating whether all elements of the numeric vector x are greater than or equal to the specified minimum value
#' @examples
#' is_greater_than_or_equal_to(c(2,3,4), 1) # TRUE
#' is_greater_than_or_equal_to(c(2,3,4), 2) # TRUE
#' is_greater_than_or_equal_to(c(2,3,4), 3, all_must_satisfy=FALSE) # TRUE
#' is_greater_than_or_equal_to(c(2,3,1), 3) # FALSE
#' @export
is_greater_than_or_equal_to <- function(x, minimum, all_must_satisfy = TRUE){

  # Assert no missing values
  assert_has_no_missing_values(x)

  res <- x >= minimum
  if(all_must_satisfy) {
    return(all(res))
  }
  else
    return(any(res))
}
