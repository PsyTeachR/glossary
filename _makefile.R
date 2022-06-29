options(bookdown.render.file_scope = FALSE)
utils::browseURL(bookdown::render_book("index.Rmd", clean = TRUE))

## create standalone pages with definitions
defpath <- file.path("docs", "_defs")
if (dir.exists(defpath))
  unlink(defpath, TRUE, TRUE)

dir.create(defpath)

all_terms <- dir("terms", "^[A-Za-z]{2,}.*\\.[Rr][Mm][Dd]$") |>
  sub("\\.[Rr][Mm][Dd]$", "", x = _) |>
  tolower()

for (term in all_terms) {

  first_letter <- substr(term, 1, 1)
  url <- paste0("docs/", first_letter, ".html")
  hash <- paste0("#", term, ".level2")
  def <- tryCatch({
    the_html <- xml2::read_html(url)
    the_node <- rvest::html_node(the_html, hash)
    if (is.na(the_node)) stop("No glossary entry for ", term)
    the_dfn <- rvest::html_node(the_node, "dfn")
    rvest::html_text(the_dfn)
  },
  error = function(e) { 
    warning(e)
    return("")
  })

  outfile <- file.path(defpath, term)
  readr::write_lines(def, outfile)
  message("wrote ", outfile)
}

R.utils::copyDirectory(
  from = "docs", 
  to = "inst/book", 
  overwrite = TRUE, 
  recursive = TRUE)

unlink("inst/book/.nojekyll")
