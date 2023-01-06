
# Cli formatting helpers --------------------------------------------------

#' Preprocess character vectors for cli::cli_abort()
#'
#' The \code{format_as_bullets} function is used for preprocessing character vectors by adding names.
#' These names are used to denote bullet points when the character vector is passed to \code{cli::cli_abort()}.
#' This allows for the easy creation of bullet point lists in error messages.
#' The bullet argument allows the user to specify the desired bullet point symbol.
#' The default bullet point symbols are: *, >, , x, v, i, and !.
#'
#' @param x A list of character strings
#' @param bullet One of '', '>', ' ', 'x', 'v', 'i', '!' (default: '')
#' The character to use as the bullet point for each element of x.
#'
#' @return A character string with each element of x formatted as a bullet point
#'
#' @examples
#' \dontrun{
#' cli::cli_abort(format_as_bullets(c("item 1", "item 2", "item 3")))
#' #> * item 1
#' #> * item 2
#' #> * item 3
#'
#'
#' cli::cli_abort(format_as_bullets(c("item 1", "item 2", "item 3"), bullet = ">"))
#' #> > item 1
#' #> > item 2
#' #> > item 3
#' }
#'
format_as_bullets <- function(x, bullet = c('*', '>', ' ', 'x', 'v', 'i', '!')){
  bullet <- rlang::arg_match(bullet)
  names(x) <- rep(bullet, times = length(x))
  return(x)
}


#' Preprocess character vectors for cli package functions
#'
#' @param x A character vector
#' @param inline_tag A character vector of inline tag names (e.g. "strong", "emph", "code", "arg")
#'
#' @return A character vector with inline tags applied to each element
#'
#' @examples
#' \dontrun{
#' format_inline(c("apple", "banana", "carrot"), inline_tag = "strong")
#'
#' format_inline(c("apple", "banana", "carrot"), inline_tag = "emph")
#' }
#'
format_inline <- function(x, inline_tag = c('strong', 'emph', 'code', 'arg')){
  inline_tag <- rlang::arg_match(inline_tag)
  x <- paste0('{.', inline_tag, ' ', x, '}')
  return(x)
}
