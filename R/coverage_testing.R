# These functions are for counting the number of tests per assertion
# and updating the json used to display the relevant badge

#' List assertion names
#'
#' List all assertion names
#'
#' @return unique set of assertion names (character)
#'
#' @examples
#' assertion_names()
assertion_names <- function(){

  # Get path to scripts
  path_r_directory <- system.file("R", package = "assertions")
  path_scripts=dir(path_r_directory, full.names = TRUE, pattern = ".R$")

  # Get list of assertions
  ## Read lines
  char_lines <- unlist(lapply(path_scripts, function(path) {readLines(path)}))
  char_lines <- gsub(x=char_lines, pattern = " ", replacement = "")

  ## Find assertions
  assertions_names <-
    char_lines[
      grepl(x=char_lines, pattern = "^assert_[a-zA-Z0-9]+") &
        grepl(x=char_lines, pattern = "(assert_create|assert_create_chain)") &
        !grepl(x=char_lines, pattern = "^#",)
      ]

  assertions_names <- sub(x=assertions_names, pattern = "(<-|=|\\().*", replacement = "")
  assertions_names <- unique(assertions_names)
  assertions_names <- sort(assertions_names)

  return(assertions_names)
}
