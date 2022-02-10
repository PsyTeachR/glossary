## link to glossary with shortdef on hover
#' Display glossary entry
#'
#' @param term The glossary term to link to, can contain spaces
#' @param display The display (if different than the term)
#' @param def The short definition to display on hover and in the glossary table; if NULL, this will be looked up from https://psyteachr.github.io/glossary/
#' @param link whether to include a link to https://psyteachr.github.io/glossary/
#' @param add_to_table whether to add to the table created by glossary_table()
#' @param show_def whether to show the definition or just the term
#'
#' @return string with the link and hover text
#' @export
#'
#' @examples
#' glossary("alpha")
#' glossary("argument", "Arguments")
#' glossary("PSYCH1001", shortdef = "Your class", link = FALSE)
#' glossary("character", show_def = TRUE)
#' glossary("numeric", show_def = TRUE, link = FALSE)
glossary <- function(term, 
                     display = term, 
                     def = NULL, 
                     link = TRUE, 
                     add_to_table = TRUE,
                     show_def = FALSE) {
  lcterm <- gsub(" ", "-", tolower(term), fixed = TRUE)
  first_letter <- substr(lcterm, 1, 1)
  url <- paste0("https://psyteachr.github.io/glossary/", first_letter)
  if (is.null(def) || def == "") {
    # look up short definition from glossary site
    hash <- paste0("#", lcterm, ".level2")
    tabledef <- tryCatch({
      the_html <- xml2::read_html(url)
      the_node <- rvest::html_node(the_html, hash)
      if (is.na(the_node)) stop("No glossary entry for ", lcterm)
      the_dfn <- rvest::html_node(the_node, "dfn")
      the_text <- rvest::html_text(the_dfn)
      the_def <- gsub("\'", "&#39;", the_text)
      if (is.na(the_def)) stop("No glossary shortdef for ", lcterm)
      the_def
    },
    error = function(e) { 
      warning(e, call. = FALSE)
      return("")
    })
    
    if (is.null(def)) def <- tabledef
  } else {
    tabledef <- def
  }
  
  ## add to global glossary for this book
  if (add_to_table) {
    env <- .GlobalEnv
    if (!exists(".myglossary", envir = env)) {
      assign(".myglossary", list(), envir = env)
    }
    .myglossary[lcterm] <<- tabledef
  }
  
  if (show_def && link) {
    paste0("<a class='glossary' target='_blank' href='", url, "#", 
           lcterm, "'>", display, "</a> (", def, ")")
  } else if (show_def) {
    # just show the definition
    def
  } else if (link) {
    # make a link that opens the definition webpage in a new window
    paste0("<a class='glossary' target='_blank' title='", def, 
           "' href='", url, "#", lcterm, "'>", display, "</a>")
  } else {
    # just add the tooltip and don't link to the definition webpage
    paste0("<a class='glossary' title='", def, "'>", display, "</a>")
  }
}


#' Reset glossary table
#' 
#' Resets the list .myglossary in the parent environment that collects glossary entries for the table
#'
#' @return NULL
#' @export
#'
#' @examples
#' reset_glossary()
#' 
reset_glossary <- function() {
  env <- .GlobalEnv
  assign(".myglossary", list(), envir = env)
}

#' Display glossary table
#'
#' @param link whether to include a link to https://psyteachr.github.io/glossary/
#' @param as_kable if the output should be a kableExtra table or a data frame
#'
#' @return kable table or data frame
#' @export
#'
#' @examples
#' glossary("alpha")
#' glossary("beta")
#' glossary_table()
glossary_table <- function(link = TRUE, as_kable = TRUE) {
  env <- .GlobalEnv
  if (!exists(".myglossary", envir = env)) {
    assign(".myglossary", list(), envir = env)
  }
  glossary <- .myglossary
  if (is.null(glossary)) glossary <- list()
  
  term <- names(glossary)
  pandocto <- knitr::opts_knit$get("rmarkdown.pandoc.to")
  is_latex <- !is.null(pandocto) && pandocto == "latex"
  
  if (link && !is_latex) {
    link_term <- sapply(term, function(t) {
      sprintf("[%s](https://psyteachr.github.io/glossary/%s.html#%s){class=\"glossary\" target=\"_blank\"}",
              gsub("(\\.|\\-)", " ", t),
              substr(t, 1, 1), 
              t)
    })
  } else {
    link_term <- term
  }
  
  the_list <- data.frame(
    term = link_term,
    definition = unlist(glossary)
  )
  
  if (is.null(term)) {
    data.frame()
  } else if (as_kable) {
    kableExtra::kable(the_list[order(term),], escape = is_latex, row.names = FALSE, ) %>%
      kableExtra::kable_styling()
  } else {
    the_list[order(term),]
  }
}