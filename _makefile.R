options(bookdown.render.file_scope = FALSE)
utils::browseURL(bookdown::render_book("index.Rmd"))

R.utils::copyDirectory(
  from = "docs", 
  to = "inst/book", 
  overwrite = TRUE, 
  recursive = TRUE)

unlink("inst/book/.nojekyll")
