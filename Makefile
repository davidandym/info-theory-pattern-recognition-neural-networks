# Tools
LATEXMK = latexmk
RM = rm -f

# Targets
all: main.pdf

# Rules
%.pdf: %.tex
	$(LATEXMK) -pdf -M -MP -MF $*.d $*

mostlyclean:
	$(LATEXMK) -silent -c
	$(RM) *.bbl

clean: mostlyclean
	$(LATEXMK) -silent -C
	$(RM) *.run.xml *.synctex.gz
	$(RM) *.d

.PHONY: all clean doc mostlyclean

# Include auto-generated dependencies
-include *.d
