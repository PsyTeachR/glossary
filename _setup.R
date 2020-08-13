new_entry <- function(term, dfn = "", open = FALSE, overwrite = FALSE) {
  txt <- sprintf("## %s\n\n<dfn>%s</dfn>\n\n", term, dfn)
  filename <- sprintf("terms/%s.Rmd", gsub("\\W+", "-", tolower(term)))
  if (file.exists(filename) & !overwrite) {
    stop(filename, " exists")
  }
  
  write(txt, filename)
  if (open) browseURL(filename)
}

bookdown::render_book("index.Rmd")

R.utils::copyDirectory(
  from = "docs", 
  to = "inst/book", 
  overwrite = TRUE, 
  recursive = TRUE)
