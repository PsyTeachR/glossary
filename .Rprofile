new_entry <- function(term, dfn = "", open = TRUE, overwrite = FALSE) {
  txt <- sprintf("## %s\n\n<dfn>%s</dfn>\n\n", term, dfn)
  filename <- sprintf("terms/%s.Rmd", gsub("\\W+", "-", tolower(term)))
  if (file.exists(filename) & !overwrite) {
    stop(filename, " exists")
  }
  
  write(txt, filename)
  if (open) browseURL(filename)
}
