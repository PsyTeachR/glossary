default : glossary README.md

glossary :
	Rscript _makefile.R
	rm -rf _bookdown_files

README.md : README.Rmd
	Rscript -e "devtools::install(upgrade = 'never')"
	Rscript -e 'rmarkdown::render("README.Rmd", rmarkdown::github_document())'

clean :
	rm -rf docs/
	rm -rf inst/book/
	rm -f _README.md
	rm -f _README.html
	rm -rf _bookdown_files
