Latex         =  xelatex
Bibtex        = bibtex
MakeGlossary  = makeglossaries
MakeIndex     = makeindex
FILE          = MajorProjectReport
BIBFILE       = Bibliographies

PDF           = $(FILE).pdf

$(PDF):$(FILE).aux $(FILE).bbl $(FILE).log 
	$(Latex) $(FILE).tex
	$(Latex) $(FILE).tex
$(FILE).bbl $(FILE).blg:$(BIBFILE).bib $(FILE).tex $(FILE).aux
	$(Bibtex) $(FILE).aux
$(FILE).aux:$(FILE).tex $(BIBFILE).bib
	$(Latex) $(FILE).tex
	$(MakeGlossary) $(FILE)
clean:
	rm \
	$(FILE).aux \
	$(FILE).bbl \
	$(FILE).blg \
	$(FILE).log \
	$(FILE).lof \
	$(FILE).toc \
	$(FILE).out \
	$(FILE).lot \
	$(FILE).ist \
	$(FILE).alg \
	$(FILE).acr \
	$(FILE).acn
