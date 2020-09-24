#' Open the glossary
#'
#' @return NULL
#' @export
#'
open_glossary <- function() {
  file <- system.file("book", "index.html", package = "glossary")
  utils::browseURL(file)
}