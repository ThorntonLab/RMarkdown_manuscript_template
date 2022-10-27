PAPERFILENAME:=Manuscript
SIMATERIAL:=SupportingInformation
BIBFILE_RAW:=references.bib
BIBFILE:=references_processed.bib
PDF:=$(PAPERFILENAME).pdf
SIPDF:=$(SIMATERIAL).pdf
IMAGES:=Model.png

all: $(PDF) $(SIPDF)

clean:
	latexmk -c $(PDF)
	latexmk -c $(SIPDF)
	rm -f $(PDF) $(SIPDF) $(PAPERFILENAME).tex $(SIMATERIAL).tex $(BIBFILE)

%.pdf: %.Rmd
	R --no-save --quiet -e "rmarkdown::render('$<')"

$(SIMATERIAL).tex: $(SIMATERIAL).pdf

$(PAPERFILENAME).pdf: $(PAPERFILENAME).Rmd $(BIBFILE) $(IMAGES) $(SIMATERIAL).tex $(SIPDF) preamble.tex

$(SIMATERIAL).pdf: $(SIMATERIAL).Rmd $(BIBFILE) sipreamble.tex

$(BIBFILE): references.bib
	sed 's/{\\dh}/\\dh /g' $< > $@

