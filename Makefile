IMAGES_FOLDER ?= $(INPUT_FOLDER)/images
INPUT_FOLDER ?= $(shell pwd)
OUTPUT_FOLDER ?= $(shell pwd)/dist

slides:
	@pandoc keynote.md \
	--to revealjs \
	--output keynote.html \
	--template template/index.html \
	-V revealjs-url=template \
	-V theme=moon \
	-V progress=false \
	-V slideNumber=true \
	-V history=true \
	--standalone --slide-level 2

pdf: slides
	@echo "This might take a while, I'll beep when it's done"
	@echo ""
	npx decktape reveal `pwd`/rust-clis.html  rust-clis.pdf
	@echo -e "\a"

beamer:
	cp -R $(IMAGES_FOLDER) $(OUTPUT_FOLDER); \
	cd $(INPUT_FOLDER); \
	$(PANDOC) $(INPUT_FOLDER)/keynote.md \
	--from=$(MARKDOWN_OPTIONS) \
	--base-header-level=2 \
	--table-of-contents \
	$(FILTER_OPTIONS) \
	--default-image-extension=pdf \
	--standalone \
	--template=$(LATEX_TEMPLATE) \
	--to=beamer --output=$(OUTPUT_FOLDER)/index.$(LATEX_FILETYPE);
