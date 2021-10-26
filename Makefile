default : glossary README.md

glossary :
	Rscript _makefile.R
	rm -rf _bookdown_files

README.md : _README.Rmd
	Rscript -e "devtools::install(upgrade = 'never')"
	Rscript -e 'rmarkdown::render("_README.Rmd", rmarkdown::github_document(), output_file = "README.md")'


clean :
	rm -rf docs/
	rm -rf inst/book/
	rm -f README.md
	rm -f README.html
	rm -rf _bookdown_files
