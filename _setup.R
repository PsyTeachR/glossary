new_entry <- function(term, dfn = "", open = FALSE) {
  txt <- sprintf("## %s\n\n<dfn>%s</dfn>\n\n", term, dfn)
  filename <- sprintf("terms/%s.Rmd", gsub("\\W+", "-", tolower(term)))
  write(txt, filename)
  if (open) browseURL(filename)
}

bookdown::render_book("index.Rmd")

R.utils::copyDirectory(
  from = "docs", 
  to = "inst/book", 
  overwrite = TRUE, 
  recursive = TRUE)
