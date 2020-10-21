PAPERFILENAME:=Manuscript
BIBFILE:=references.bib
PDF:=$(PAPERFILENAME).pdf

all: $(PDF)

clean:
	latexmk -c $(PDF)
	rm -f $(PDF) $(PAPERFILENAME).tex

%.pdf: %.Rmd
	R --no-save --quiet -e "rmarkdown::render('$<')"

$(PAPERFILENAME).pdf: $(PAPERFILENAME).Rmd $(BIBFILE)

