TEX = latexmk --pdf -pdflatex="pdflatex --shell-escape"
SRC = $(filter-out trash.tex, $(wildcard *.tex))
PDF = $(SRC:.tex=.pdf)
DEP = ../bibliography.bib

all : $(PDF) compressed embedded

%.pdf : %.tex ${DEP}
	$(TEX) $< -jobname="$(basename $<)"

%.compressed.pdf : %.tex ${DEP}
	ghostscript -dEmbedAllFonts=true -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/printer -dNOPAUSE -dQUIET -dBATCH -sOutputFile=$@ $(basename $<).pdf

%.embedded.pdf : %.tex ${DEP}
	ghostscript -sDEVICE=pdfwrite -dBATCH -dNOPAUSE -dSAFER \
	-dPDFX -dPDFSETTINGS=/prepress \
	-dAutoFilterColorImages=false -dColorImageFilter=/FlateEncode \
	-dAutoFilterGrayImages=false -dGrayImageFilter=/FlateEncode \
	-dAutoFilterMonoImages=false -dMonoImageFilter=/CCITTFaxEncode \
	-sOutputFile=$@ $(basename $<).pdf

compressed : $(PDF:.pdf=.compressed.pdf)

embedded : $(PDF:.pdf=.embedded.pdf)

clean :
	latexmk -C *.tex
	rm -rf $(PDF:.pdf=.embedded.pdf) $(PDF:.pdf=.compressed.pdf) $(PDF:.pdf=.bbl) build _minted-*
