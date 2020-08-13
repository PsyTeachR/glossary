#' Open the glossary
#'
#' @return NULL
#' @export
#'
book <- function() {
  file <- system.file("book", "index.html", package = "glossary")
  utils::browseURL(file)
}