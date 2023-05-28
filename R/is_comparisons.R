# Comparisons -------------------------------------------------------------

# Engine
compare <- function(x, equal_to = NULL, minimum = NULL, maximum = NULL, comparison_inclusive = TRUE, all_must_satisfy = TRUE){

  # Check at least one comparison criterion is supplied
  if(is.null(minimum) && is.null(maximum) && is.null(equal_to))
    stop("Must supply at least one threshold: either 'equal_to', `minimum` or maximum")

  # Assert no missing values
  assert_no_missing(x, arg_name = deparse(substitute(x, env = parent.frame())))

  # Preset some vals
  passes_min_threshold = TRUE
  passes_max_threshold = TRUE
  passes_equivalence = TRUE


  # Is Greater Than
  if(!is.null(minimum)){
    if(comparison_inclusive) passes_min_threshold <- x >= minimum
    else passes_min_threshold <- x > minimum
    passes_min_threshold <- if(all_must_satisfy) all(passes_min_threshold) else any(passes_min_threshold)
  }


  # Is Less Than
  if(!is.null(maximum)) {
    if(comparison_inclusive) passes_max_threshold <- x <= maximum
    else passes_max_threshold <- x < maximum

    passes_max_threshold <- if(all_must_satisfy) all(passes_max_threshold) else any(passes_max_threshold)
  }

  # Is Equal To
  if(!is.null(equal_to)){
    passes_equivalence <- x == equal_to
    passes_equivalence <- if(all_must_satisfy) all(passes_equivalence) else any(passes_equivalence)
  }

  # Passes thresholds
  passes_all_thresholds <- passes_min_threshold && passes_max_threshold && passes_equivalence

  return(passes_all_thresholds)
}


#' Check if a numeric vector is greater than a specified minimum value
#'
#' This function checks if a numeric vector is greater than a specified minimum value. It can also optionally check if all elements of the vector must be greater than the minimum value or if only one element is sufficient
#'
#' @param x a numeric vector to check
#' @param minimum The minimum value to compare against
#'
#' @return A logical value indicating whether all elements of the numeric vector x are greater than the specified minimum value
#' @examples
#' is_greater_than(c(2,3,4), 1) # TRUE
#' is_greater_than(c(2,3,4), 2) # TRUE
#' is_greater_than(c(2,3,1), 3) # FALSE
#' @export
is_greater_than <- function(x, minimum){
  compare(x = x, minimum = minimum, all_must_satisfy = TRUE, comparison_inclusive = FALSE)
}

#' Check if a numeric vector is greater than or equal to a specified minimum value
#'
#' This function checks if a numeric vector is greater than or equal to a specified minimum value. It can also optionally check if all elements of the vector must be greater than or equal to the minimum value or if only one element is sufficient
#'
#' @param x a numeric vector to check
#' @param minimum The minimum value to compare against
#' @return A logical value indicating whether all elements of the numeric vector x are greater than or equal to the specified minimum value
#' @examples
#' is_greater_than_or_equal_to(c(2,3,4), 1) # TRUE
#' is_greater_than_or_equal_to(c(2,3,4), 2) # TRUE
#' is_greater_than_or_equal_to(c(2,3,1), 3) # FALSE
#' @export
is_greater_than_or_equal_to <- function(x, minimum){
  compare(x = x, minimum = minimum, all_must_satisfy = TRUE, comparison_inclusive = TRUE)
}


#' Check if two objects are identical
#'
#' @param x first object to compare
#' @param y second object to compare
#' @return logical value indicating whether or not the objects are identical
#' @export
is_identical <- function(x, y){
  identical(x = x, y = y)
}

#' Check equality of two objects
#'
#' Is `x` equal to `y`. powered by the [all.equal()] function.
#'
#' @param x first object to compare
#' @param y second object to compare
#' @param tolerance Differences smaller than tolerance are not reported. The default value is close to 1.5e-8 (numeric >= 0).
#' @param check_names should the names(.) of target and current should be compare (flag)
#' @param check_environment should the environments of functions should be compared?
#' You may need to set check.environment=FALSE in unexpected cases, such as when comparing two nls() fits. (flag)
#' @param check_tzone should  "tzone" attributes be compared. Important for comparing POSIXt objects. (flag)
#' @return TRUE if x is equal to y
#' @export
#'
#' @examples
#' is_equal(1, 1) #TRUE
#' is_equal(c(1, 2), 1) #FALSE
#'
#' is_equal(c("A", "B"), c("A", "B")) #TRUE
#' is_equal("A", "B") #FALSE
#'
is_equal <- function(x, y, tolerance = sqrt(.Machine$double.eps), check_names = TRUE, check_environment = TRUE, check_tzone = TRUE){
  isTRUE(all.equal(x, y, check.names = check_names, check.environment = check_environment, check.tzone = check_tzone))
}


#' Check equality of type
#'
#' Is type of `x` the same as `y` (according to typof)
#'
#' @param x first object to compare
#' @param y second object to compare
#'
#' @return TRUE if x and y are of the same type, otherwise FALSE
#' @export
#'
is_same_type <- function(x, y){
  typeof(x) == typeof(y)
}
