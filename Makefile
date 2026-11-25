# Run from the repo root:
#   make pdf    →  build/octan.pdf       (letter)
#   make trade  →  build/octan-trade.pdf (6in x 9in)
BUILD_DIR := build
MAIN      := octan.tex
CHAPTERS  := $(wildcard chap-*.tex)

LETTER_PDF := $(BUILD_DIR)/octan.pdf
TRADE_PDF  := $(BUILD_DIR)/octan-trade.pdf

.PHONY: pdf trade clean

pdf: $(LETTER_PDF)
trade: $(TRADE_PDF)

define run_latex
	mkdir -p $(BUILD_DIR)
	pdflatex -interaction=nonstopmode -file-line-error -output-directory=$(BUILD_DIR) $(1)
	-makeindex $(BUILD_DIR)/$(2)
	pdflatex -interaction=nonstopmode -file-line-error -output-directory=$(BUILD_DIR) $(1)
	pdflatex -interaction=nonstopmode -file-line-error -output-directory=$(BUILD_DIR) $(1)
endef

$(LETTER_PDF): $(MAIN) $(CHAPTERS)
	$(call run_latex,$(MAIN),octan)

$(TRADE_PDF): $(MAIN) $(CHAPTERS)
	$(call run_latex,-jobname=octan-trade '\providecommand{\octanformat}{trade}\input{$(MAIN)}',octan-trade)

clean:
	-$(RM) -r $(BUILD_DIR)
