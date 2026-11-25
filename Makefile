# Run from the repo root: make pdf  →  build/octan.pdf
BUILD_DIR := build
PDF       := $(BUILD_DIR)/octan.pdf
MAIN      := octan.tex
CHAPTERS  := $(wildcard chap-*.tex)

.PHONY: pdf clean distclean

pdf: $(PDF)

$(PDF): $(MAIN) $(CHAPTERS)
	mkdir -p $(BUILD_DIR)
	pdflatex -interaction=nonstopmode -file-line-error -output-directory=$(BUILD_DIR) $(MAIN)
	pdflatex -interaction=nonstopmode -file-line-error -output-directory=$(BUILD_DIR) $(MAIN)

clean:
	-$(RM) $(BUILD_DIR)/*.aux $(BUILD_DIR)/*.log $(BUILD_DIR)/*.out $(BUILD_DIR)/*.toc $(BUILD_DIR)/*.lof $(BUILD_DIR)/*.lot $(BUILD_DIR)/*.fls $(BUILD_DIR)/*.fdb_latexmk $(BUILD_DIR)/*.synctex.gz 2>/dev/null
	-$(RM) *.aux *.log *.toc *.out 2>/dev/null

distclean:
	-$(RM) -r $(BUILD_DIR)
