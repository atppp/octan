# Run from the repo root: make pdf  →  build/octan.pdf
BUILD_DIR := build
PDF       := $(BUILD_DIR)/octan.pdf
MAIN      := octan.tex
CHAPTERS  := $(wildcard chap-*.tex)

.PHONY: pdf clean

pdf: $(PDF)

$(PDF): $(MAIN) $(CHAPTERS)
	mkdir -p $(BUILD_DIR)
	pdflatex -interaction=nonstopmode -file-line-error -output-directory=$(BUILD_DIR) $(MAIN)
	-makeindex $(BUILD_DIR)/octan
	pdflatex -interaction=nonstopmode -file-line-error -output-directory=$(BUILD_DIR) $(MAIN)
	pdflatex -interaction=nonstopmode -file-line-error -output-directory=$(BUILD_DIR) $(MAIN)

clean:
	-$(RM) -r $(BUILD_DIR)
