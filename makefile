PACKAGE = *.dtx \
		  *.pdf \
		  *.ins \
		  *.tex \
		  makefile



.PHONY: all dist clean cleanall


all:eledform.sty eledform.pdf dist clean




%.sty: %.ins %.dtx 
	@rm -f $*.sty
	@pdflatex $*.ins

%.pdf: %.dtx %.sty
	@xelatex $*.dtx
	makeindex -s gglo.ist -o $*.gls $*.glo
	makeindex -s gind.ist -o $*.ind $*.idx
	@xelatex $*.dtx
	@xelatex $*.dtx
	

dist: $(PACKAGE)
	@$(RM) ../eledform.zip
	zip ../eldeform.zip $(PACKAGE)
	

clean:
	@$(RM) *.aux *.log *.out *.toc  *glo *idx *bib *bbl *blg *xml *gls *ilg *gz *ind

cleanall:clean
	@$(RM) bibleref-french-francais.pdf bibleref-french.pdf test.pdf *sty