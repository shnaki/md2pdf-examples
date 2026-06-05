.PHONY: all build clean run-pandoc-xelatex run-pandoc-typst run-pandoc-weasyprint run-md-to-pdf run-marp run-quarto

TOOLS = pandoc-xelatex pandoc-typst pandoc-weasyprint md-to-pdf marp quarto

## Build all Docker images
build:
	docker compose build

## Convert with all tools
all: $(addprefix run-,$(TOOLS))

run-pandoc-xelatex:
	@echo "\n=== pandoc-xelatex ==="
	docker compose run --rm pandoc-xelatex

run-pandoc-typst:
	@echo "\n=== pandoc-typst ==="
	docker compose run --rm pandoc-typst

run-pandoc-weasyprint:
	@echo "\n=== pandoc-weasyprint ==="
	docker compose run --rm pandoc-weasyprint

run-md-to-pdf:
	@echo "\n=== md-to-pdf ==="
	docker compose run --rm md-to-pdf

run-marp:
	@echo "\n=== marp ==="
	docker compose run --rm marp

run-quarto:
	@echo "\n=== quarto ==="
	docker compose run --rm quarto

## Remove all generated PDFs
clean:
	rm -rf outputs/

## Show output file sizes
sizes:
	@find outputs -name "*.pdf" -exec ls -lh {} \; | awk '{print $$5, $$9}' | sort -k2
