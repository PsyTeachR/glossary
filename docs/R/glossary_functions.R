# collects glossary entries for a list at the end of the page
myglossary <- list() 

## link to glossary with shortdef on hover
glossary <- function(term, display = NULL, shortdef = "", link = TRUE) {
  lcterm <- gsub(" ", "-", tolower(term), fixed = TRUE)
  if (is.null(display)) display <- term
  first_letter <- substr(lcterm, 1, 1)
  url <- paste0("https://psyteachr.github.io/glossary/", first_letter)
  if (shortdef == "") {
    # look up short definition from glossary site
    hash <- paste0("#", lcterm, " dfn")
    shortdef <- tryCatch({
      the_html <- xml2::read_html(url)
      the_node <- rvest::html_node(the_html, hash)
      the_text <- rvest::html_text(the_node)
      gsub("\'", "&#39;", the_text)
    },
    error = function(e) { "" }
    )
  }
  
  ## add to global glossary for this book
  myglossary[lcterm] <<- shortdef
  
  if (link) {
    # make a link that opens the definition webpage in a new window
    paste0("<a class='glossary' target='_blank' title='", shortdef, 
           "' href='", url, "#", lcterm, "'>", display, "</a>")
  } else {
    # just add the tooltip and don't link to the definition webpage
    paste0("<a class='glossary' title='", shortdef, "'>", display, "</a>")
  }
}

glossary_table <- function() {
  term <- names(myglossary)
  link_term <- paste0("<a class='glossary' target='_blank' ",
                      "href='https://psyteachr.github.io/glossary/",
                      substr(term, 1, 1), "#", term, "'>",
                      gsub(".", " ", term, fixed = 1), "</a>")
  the_list <- data.frame(
    term = link_term,
    definition = unlist(myglossary)
  )
  
  knitr::kable(the_list[order(term),], escape = FALSE, row.names = FALSE)
}