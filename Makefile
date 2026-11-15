PAPER   := paper
MAIN    := main
MAXPAGES := 4

.PHONY: pdf check watch clean

pdf:
	cd $(PAPER) && tectonic --keep-intermediates $(MAIN).tex

# Fails if the body (up to \label{endofbody}) runs past $(MAXPAGES) pages.
check: pdf
	@page=$$(sed -n 's/.*newlabel{endofbody}{{[^}]*}{\([0-9]*\)}.*/\1/p' $(PAPER)/$(MAIN).aux); \
	if [ -z "$$page" ]; then echo "endofbody label not found"; exit 1; fi; \
	if [ $$page -gt $(MAXPAGES) ]; then echo "FAIL: body ends on page $$page (limit $(MAXPAGES))"; exit 1; \
	else echo "OK: body ends on page $$page of $(MAXPAGES)"; fi

watch:
	cd $(PAPER) && tectonic -X watch

clean:
	cd $(PAPER) && rm -f *.aux *.bbl *.blg *.log *.out *.toc *.xdv $(MAIN).pdf
